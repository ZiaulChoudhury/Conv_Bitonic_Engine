import math
import sys
seq_length=int(sys.argv[1])
layers = int(math.log2(seq_length))
program = "package compact;\
\nimport FIFO::*;\
\nimport FIFOF::*;\
\nimport datatypes::*;\
\nimport SpecialFIFOs:: * ;\
\nimport Real::*;\
\nimport Vector::*;"
len = seq_length
idx = 0
for i in range(0,layers+1):
    program += "\n#define L"+str(idx) + " " +str(len)
    idx = idx + 1
    len = int(len/2)

len = 16
idx = 0
for i in range(0,layers+1):
    program += "\n#define B"+str(idx) + " " +str(len)
    idx = idx + 1
    len = int(len*2)

program += "\ninterface CompactTree;\
\n        method Action put(Vector#(L0, Bit#(B0)) datas);\
\n        method ActionValue#(Bit#(B"+str(layers)+")) get;\
\nendinterface\
\n\
\n(*synthesize*)\
\nmodule mkCompactTree(CompactTree);"

for i in range(0, layers+1):
    program+="\n\tReg#(Bit#(B"+str(i)+"))  s"+str(i)+"[L"+str(i)+"];"

for i in range(0, layers+1):
    program+="\n\tReg#(Int#(16))  h"+str(i)+"[L"+str(i)+"];"

for i in range(0, layers+2):
    program += "\n\tFIFOF#(Bit#(1)) p"+str(i) +"<- mkPipelineFIFOF;"

for i in range(0, layers+1):
    program += "\n\tfor(int i =0; i<L"+str(i)+"; i = i + 1) begin"
    program += "\n\t\ts"+str(i)+"[i] <- mkReg(0);"
    program += "\n\t\th"+str(i)+"[i] <- mkReg(0);"
    program += "\n\tend"

program+="\n\trule _Q0;\
\n\tfor (int i=0; i<L0; i = i + 1)\
\n\tif (s0[i] != 0)\
\n\t\th0[i] <= 1;\
\n\tendrule"

for i in range(1,layers+1):
    program+="\n\trule _Q"+str(i)+";"
    program+="\n\t\tfor(int i=0; i < L"+str(i)+"; i = i + 1) begin"
    program+="\n\t\t\th"+str(i)+"[i] <= (h"+str(i-1)+"[2*i] + h"+str(i-1)+"[2*i+1]);"
    program+="\n\t\t\tBit#(B"+str(i)+") a = zeroExtend(s"+str(i-1)+"[2*i]);"
    program+="\n\t\t\tBit#(B"+str(i)+") b = zeroExtend(s"+str(i-1)+"[2*i+1]);"
    program+="\n\t\t\tBit#(B"+str(i)+") c = (b << (h"+str(i-1)+"[2*i] << 4)) | a;"
    program+="\n\t\t\ts"+str(i)+"[i] <= c;"
    program+="\n\t\tend"
    program+="\n\tendrule"

for i in range(0, layers+1):
    program+="\n\trule _act"+str(i)+";"
    program+="\n\t\tp"+str(i)+".deq;"
    program+="\n\t\tp"+str(i+1)+".enq(1);"
    program+="\n\tendrule"

program +="\n\nmethod Action put(Vector#(L0, Bit#(B0)) datas);\
\n\tfor(int i=0;i<L0;i=i+1)\
\n\ts0[i] <= datas[i];\
\n\tp0.enq(1);\
\nendmethod\
\n\n\
method ActionValue#(Bit#(B"+str(layers)+")) get;"
program+="\n\tp"+str(layers+1)+".deq;"
program+="\n\treturn s"+str(layers)+"[0];\
\nendmethod\
\nendmodule\
\nendpackage"

#print (program)
file_path = "compact.bsv"
with open(file_path, "w") as verilog_file:
    verilog_file.write(program)

program = "package flowtest;\
\nimport FIFO::*;\
\nimport FIFOF::*;\
\nimport datatypes::*;\
\nimport SpecialFIFOs:: * ;\
\nimport Real::*;\
\nimport Vector::*;\
\nimport compact::*;\
\nimport \"BDPI\" function Action fill_image();\
\nimport \"BDPI\" function Int#(32) load_data(Int#(32) r_c);\
\n\
\n\
\n#define L0 " +str(seq_length)+ " \
\n#define B " +str(seq_length*16)+ " \
\n(*synthesize*)\
\nmodule mkFlowTest();\
\n\
\nCompactTree px <- mkCompactTree;\
\nReg#(Bool)  init <- mkReg(False);\
\nReg#(int)   index <- mkReg(0);\
\nReg#(Bit#(B))    data <- mkReg(0);\
\n\trule init_data (init == False);\
\n\t\tfill_image();\
\n\t\tinit <= True;\
\n\tendrule\
\n\
\n\trule load_data (index < L0 && init == True);\
\n\t\tInt#(16) dx = truncate(load_data(index));\
\n\t\tindex <= index + 1;\
\n\t\tdata <= (data << 16) | zeroExtend(pack(dx));\
\n\tendrule\
\n\
\n\trule push_data (index == L0 && init == True);\
\n\t\tpx.put(unpack(pack(data)));\
\n\t\tindex <= index + 1;\
\n\tendrule"

import random
def coin_flip():
    return random.choice([0, 1])

def generate_random_16bit_number(min_value, max_value):
    if min_value < 0 or max_value > 65535:
        raise ValueError("The range must be between 0 and 65535 (inclusive)")

    return random.randint(min_value, max_value)

for i in range(0,seq_length):
    if coin_flip() == 1:
        print(generate_random_16bit_number(10,200))
    else:
        print(0)


program +="\n\trule get_data;\
\n\tlet d <- px.get;\
\n\tVector#(L0, Int#(16)) dx = unpack(d);\
\n\tfor(int i=0; i<L0; i=i+1)\
\n\t$display(\"%d\",dx[i]);\
\n\t$finish(0);\
\n\tendrule\
\nendmodule\
\nendpackage"

file_path = "flowtest.bsv"
with open(file_path, "w") as verilog_file:
    verilog_file.write(program)

replications = seq_length
program="package flowVerilog;\
\nimport FixedPoint:: *;\
\nimport SpecialFIFOs:: * ;\
\nimport Vector:: *;\
\nimport FIFO:: *;\
\nimport FIFOF:: *;\
\nimport datatypes::*;\
\nimport compact::*;\
\n#define L0 "+str(replications)+"\
\n#define MEMWORD "+str(replications*16)+"\
\ninterface STDIN;\
\n        method Action put(DataType datas);\
\n        method Bit#(16) get;\
\nendinterface\
\n\
\n(*synthesize*)\
\nmodule mkFlowTest(STDIN);\
\n        CompactTree px              <- mkCompactTree;\
\n        Reg#(Int#(16))  cache[L0];\
\n        Reg#(UInt#(12)) sum_count <- mkReg(0);\
\n        Reg#(Int#(16)) total_sum <- mkReg(0);\
\n        Reg#(UInt#(12)) ent <- mkReg(0);\
\n        Reg#(Bit#(MEMWORD)) inQ <- mkReg(0);\
\n\
\n        for(int i=0; i < L0; i = i + 1)\
\n                cache[i] <- mkReg(0);\
\n        rule collect (ent == L0);\
\n              px.put(unpack(inQ));\
\n		ent <= 0;\
\n       endrule\
\n\
\n        rule receive (sum_count==0);\
\n                let d <- px.get;\
\n		  Vector#(L0,Int#(16)) dx = unpack(d);\
\n                for(int i=0; i < L0; i = i + 1)\
\n                        cache[i] <= dx[i];\
\n                sum_count <= 1;\
\n        endrule"

for i in range(0,replications):
    program+="\nrule s"+str(i+1)+"(sum_count == "+str(i+1)+");\
\n  total_sum <= total_sum + cache["+str(i)+"];\
\nendrule"


program+="\n        method Action put(DataType datas) if(ent < L0);\
\n                      Bit#(MEMWORD) x = zeroExtend(pack(datas));\
\n                      inQ <= (inQ << 8) | x;\
\n                      ent <= ent + 1;\
\n                  endmethod\
\n\
\n\
\n        method Bit#(16) get;\
\n                return pack(total_sum);\
\n        endmethod\
\nendmodule\
\nendpackage"

file_path = "flowVerilog.bsv"

with open(file_path, "w") as verilog_file:
    verilog_file.write(program)

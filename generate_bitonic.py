import math
import sys
seq_length=int(sys.argv[1])
program = "package bitonic;\
\nimport FIFO::*;\
\nimport FIFOF::*;\
\nimport datatypes::*;\
\nimport SpecialFIFOs:: * ;\
\nimport Real::*;\
\nimport Vector::*;\
\n#define L0 " +str(seq_length)+"\
\n\
\ninterface Bitonic;\
\n        method Action put(Vector#(L0, Int#(16)) datas);\
\n        method ActionValue#(Vector#(L0, Int#(16))) get;\
\nendinterface\
\n\
\n(*synthesize*)\
\nmodule mkBitonic(Bitonic);"

layers = int(math.log2(seq_length))
total = 0
for i in range(0,layers):
    for j in range(0,i+1):
        total = total + 1

for i in range(0,total+1):
    program += "\nReg#(Int#(16)) s"+str(i)+"[L0];"

program += "\n\nfor(int i =0; i<L0; i = i + 1) begin"
for i in range(0,total+1):
    program += "\ns"+str(i)+"[i] <- mkReg(0);"
program += "\nend"
for i in range(0,total+1):
    program +="\nFIFOF#(Bit#(1)) p"+str(i)+" <- mkPipelineFIFOF;"

tx = 0
for i in range(0,layers):
    for j , k in zip(range(i+1,0,-1), range(0,i+1)):
        mod = int(math.pow(2,j)/2)
        program += "\nrule "+"_Q"+str(i)+str(j)+";"
        program += "\n\tp"+str(tx)+".deq;"
        program += "\n\tlet mod = "+ str(mod*2)+";"
        program += "\n\tfor(int i=0; i < L0/mod; i = i + 1) begin"
        program += "\n\t\tif ((i/"+str(int(pow(2,k)))+")%2 == 0) begin"
        for j in range(0,mod):
            program += "\n\t\t\ts"+str(tx+1)+"[mod*i+"+str(j)+"] <= min(s"+str(tx)+"[mod*i+"+str(j)+"] , s"+str(tx)+"[mod*i+"+str(j)+"+mod/2]);"
            program += "\n\t\t\ts"+str(tx+1)+"[mod*i+"+str(j)+"+mod/2] <= max(s"+str(tx)+"[mod*i+"+str(j)+"] , s"+str(tx)+"[mod*i+"+str(j)+"+mod/2]);"
        program += "\n\t\tend"
        program += "\n\t\telse begin"
        for j in range(0,mod):
            program += "\n\t\t\ts"+str(tx+1)+"[mod*i+"+str(j)+"] <= max(s"+str(tx)+"[mod*i+"+str(j)+"] , s"+str(tx)+"[mod*i+"+str(j)+"+mod/2]);"
            program += "\n\t\t\ts"+str(tx+1)+"[mod*i+"+str(j)+"+mod/2] <= min(s"+str(tx)+"[mod*i+"+str(j)+"] , s"+str(tx)+"[mod*i+"+str(j)+"+mod/2]);"
        program += "\n\t\tend"
        program += "\n\tend"
        program += "\n\tp"+str(tx+1)+".enq(1);"
        program += "\nendrule"
        tx = tx + 1
program +="\n\nmethod Action put(Vector#(L0, Int#(16)) datas);\
\nfor(int i=0;i<L0;i=i+1)\
\ns0[i] <= datas[i];\
\np0.enq(1);\
\nendmethod\
\n\n\
method ActionValue#(Vector#(L0, Int#(16))) get;"
program+="\np"+str(total)+".deq;"
program+="\nVector#(L0,Int#(16)) r = newVector;\
\nfor(int i=0; i<L0; i = i + 1)\
\nr[i] = s"+str(total)+"[i];\
\nreturn r;\
\nendmethod\
\nendmodule\
\nendpackage"

file_path = "bitonic.bsv"
with open(file_path, "w") as verilog_file:
    verilog_file.write(program)

program = "package flowtest;\
\nimport FIFO::*;\
\nimport FIFOF::*;\
\nimport datatypes::*;\
\nimport SpecialFIFOs:: * ;\
\nimport Real::*;\
\nimport Vector::*;\
\nimport bitonic::*;\
\n#define L0 " +str(seq_length)+""
import random
def coin_flip():
    return random.choice([0, 1])

def generate_random_16bit_number(min_value, max_value):
    if min_value < 0 or max_value > 65535:
        raise ValueError("The range must be between 0 and 65535 (inclusive)")

    return random.randint(min_value, max_value)

program +="\n(*synthesize*)\
\nmodule mkFlowTest();\
\n\nBitonic px <- mkBitonic;\
\n\n\trule push_data;\
\n\t\tVector#(L0,Int#(16)) r = newVector;\
\n\t\tfor (Int  # (16) i=0; i<L0; i = i + 1)"
for i in range(0,seq_length):
    program+="\n\t\tr["+str(i)+"]=" + str(generate_random_16bit_number(10,1000)) + ";"

program +="\n\t\tpx.put(r);\
\n\tendrule\
\n\n\
\n\trule get_data;\
\n\tlet d <- px.get;\
\n\t\tfor(int i=0; i<L0; i=i+1)\
\n\t\t\t$display(\"%d\",d[i]);\
\n\t\t\t$finish(0);\
\n\tendrule\
\n\
\nendmodule\
\nendpackage"

file_path = "flowtest.bsv"
with open(file_path, "w") as verilog_file:
    verilog_file.write(program)


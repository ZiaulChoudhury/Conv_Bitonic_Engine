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

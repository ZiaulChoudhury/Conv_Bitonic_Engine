package flowVerilog;
import FixedPoint:: *;
import SpecialFIFOs:: * ;
import Vector:: *;
import FIFO:: *;
import FIFOF:: *;
import datatypes::*;
import compact::*;
#define L0 256
#define MEMWORD 2048
interface STDIN;
        method Action put(DataType datas);
        method Bit#(8) get(Int#(32) index);
endinterface

(*synthesize*)
module mkFlowTest(STDIN);
        CompactTree px              <- mkCompactTree;
        Reg#(Int#(8))  cache[L0];
        Reg#(UInt#(12)) sum_count <- mkReg(0);
        Reg#(Int#(16)) total_sum <- mkReg(0);
        Reg#(UInt#(12)) ent <- mkReg(0);
        Reg#(Bit#(MEMWORD)) inQ <- mkReg(0);

        for(int i=0; i < L0; i = i + 1)
                cache[i] <- mkReg(0);
        rule collect (ent == L0);
              px.put(unpack(inQ));
		ent <= 0;
       endrule

        rule receive (sum_count==0);
                let d <- px.get;
		  Vector#(L0,Int#(8)) dx = unpack(d);
                for(int i=0; i < L0; i = i + 1)
                        cache[i] <= dx[i];
                sum_count <= 1;
        endrule
        method Action put(DataType datas) if(ent < L0);
                      Bit#(MEMWORD) x = zeroExtend(pack(datas));
                      inQ <= (inQ << 16) | x;
                      ent <= ent + 1;
                  endmethod


        method Bit#(8) get(Int#(32) index);
                return pack(cache[index]);
        endmethod
endmodule
endpackage
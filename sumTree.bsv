package sumTree;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;

#define L0 8
#define L1 4
#define L2 2

#define KERNEL 3

interface SumTree;
        method Action put(Vector#(8, Int#(16)) datas);
        method ActionValue#(Int#(16)) get;
	method Action configure(UInt#(8) kernel); 
endinterface

(*synthesize*)
module mkSumTree(SumTree);

Reg#(Int#(16)) s0[L0];
Reg#(Int#(16)) s1[L0];
Reg#(Int#(16)) s2[L0];
Reg#(UInt#(8)) _shft <- mkReg(0);

FIFOF#(Bit#(1)) p0 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p1 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p2 <- mkPipelineFIFOF;

for(int i =0; i<L0; i = i + 1)
		s0[i] <- mkReg(0);
for(int i =0; i<L1; i = i + 1)
		s1[i] <- mkReg(0);
for(int i =0; i<L2; i = i + 1)
		s2[i] <- mkReg(0);

FIFOF#(Int#(16)) sum <- mkFIFOF;

	rule _Q1;
			for(int i=0; i < L1; i = i + 1) 
				s1[i] <= s0[2*i] + s0[2*i+1];
	endrule

	rule _Q2;
			for(int i=0; i < L2; i = i + 1) 
				s2[i] <= s1[2*i] + s1[2*i+1];
	endrule

	rule _Q3;
			p2.deq;
			sum.enq(s2[0] + s2[1]);
	endrule

	rule act0;
		p0.deq;
		p1.enq(1);
	endrule
	
	rule act1;
		p1.deq;
		p2.enq(1);
	endrule
		
        method Action put(Vector#(8, Int#(16)) datas);

		Bit#(128) x0 = pack(datas) << (_shft << 4);
		Bit#(128) x1 = pack(x0)    >> (_shft << 4);	
		Vector#(8, Int#(16)) x3 = unpack(x1);
		
		for(int i=0;i<8;i=i+1)
			s0[i] <= x3[i];
		p0.enq(1);
	endmethod
	
        method ActionValue#(Int#(16)) get;
			sum.deq;
			return sum.first;
	endmethod
	
	method Action configure(UInt#(8) kernel);
		_shft <= 8 - kernel; 
	endmethod
endmodule
endpackage

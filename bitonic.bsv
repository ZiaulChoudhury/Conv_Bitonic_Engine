package bitonic;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;
#define L0 8

interface Bitonic;
        method Action put(Vector#(L0, Int#(16)) datas);
        method ActionValue#(Vector#(L0, Int#(16))) get;
endinterface

(*synthesize*)
module mkBitonic(Bitonic);
Reg#(Int#(16)) s0[L0];
Reg#(Int#(16)) s1[L0];
Reg#(Int#(16)) s2[L0];
Reg#(Int#(16)) s3[L0];
Reg#(Int#(16)) s4[L0];
Reg#(Int#(16)) s5[L0];
Reg#(Int#(16)) s6[L0];

for(int i =0; i<L0; i = i + 1) begin
s0[i] <- mkReg(0);
s1[i] <- mkReg(0);
s2[i] <- mkReg(0);
s3[i] <- mkReg(0);
s4[i] <- mkReg(0);
s5[i] <- mkReg(0);
s6[i] <- mkReg(0);
end
FIFOF#(Bit#(1)) p0 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p1 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p2 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p3 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p4 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p5 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p6 <- mkPipelineFIFOF;
rule _Q01;
	p0.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			s1[mod*i+0] <= min(s0[mod*i+0] , s0[mod*i+0+mod/2]);
			s1[mod*i+0+mod/2] <= max(s0[mod*i+0] , s0[mod*i+0+mod/2]);
		end
		else begin
			s1[mod*i+0] <= max(s0[mod*i+0] , s0[mod*i+0+mod/2]);
			s1[mod*i+0+mod/2] <= min(s0[mod*i+0] , s0[mod*i+0+mod/2]);
		end
	end
	p1.enq(1);
endrule
rule _Q12;
	p1.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			s2[mod*i+0] <= min(s1[mod*i+0] , s1[mod*i+0+mod/2]);
			s2[mod*i+0+mod/2] <= max(s1[mod*i+0] , s1[mod*i+0+mod/2]);
			s2[mod*i+1] <= min(s1[mod*i+1] , s1[mod*i+1+mod/2]);
			s2[mod*i+1+mod/2] <= max(s1[mod*i+1] , s1[mod*i+1+mod/2]);
		end
		else begin
			s2[mod*i+0] <= max(s1[mod*i+0] , s1[mod*i+0+mod/2]);
			s2[mod*i+0+mod/2] <= min(s1[mod*i+0] , s1[mod*i+0+mod/2]);
			s2[mod*i+1] <= max(s1[mod*i+1] , s1[mod*i+1+mod/2]);
			s2[mod*i+1+mod/2] <= min(s1[mod*i+1] , s1[mod*i+1+mod/2]);
		end
	end
	p2.enq(1);
endrule
rule _Q11;
	p2.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			s3[mod*i+0] <= min(s2[mod*i+0] , s2[mod*i+0+mod/2]);
			s3[mod*i+0+mod/2] <= max(s2[mod*i+0] , s2[mod*i+0+mod/2]);
		end
		else begin
			s3[mod*i+0] <= max(s2[mod*i+0] , s2[mod*i+0+mod/2]);
			s3[mod*i+0+mod/2] <= min(s2[mod*i+0] , s2[mod*i+0+mod/2]);
		end
	end
	p3.enq(1);
endrule
rule _Q23;
	p3.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			s4[mod*i+0] <= min(s3[mod*i+0] , s3[mod*i+0+mod/2]);
			s4[mod*i+0+mod/2] <= max(s3[mod*i+0] , s3[mod*i+0+mod/2]);
			s4[mod*i+1] <= min(s3[mod*i+1] , s3[mod*i+1+mod/2]);
			s4[mod*i+1+mod/2] <= max(s3[mod*i+1] , s3[mod*i+1+mod/2]);
			s4[mod*i+2] <= min(s3[mod*i+2] , s3[mod*i+2+mod/2]);
			s4[mod*i+2+mod/2] <= max(s3[mod*i+2] , s3[mod*i+2+mod/2]);
			s4[mod*i+3] <= min(s3[mod*i+3] , s3[mod*i+3+mod/2]);
			s4[mod*i+3+mod/2] <= max(s3[mod*i+3] , s3[mod*i+3+mod/2]);
		end
		else begin
			s4[mod*i+0] <= max(s3[mod*i+0] , s3[mod*i+0+mod/2]);
			s4[mod*i+0+mod/2] <= min(s3[mod*i+0] , s3[mod*i+0+mod/2]);
			s4[mod*i+1] <= max(s3[mod*i+1] , s3[mod*i+1+mod/2]);
			s4[mod*i+1+mod/2] <= min(s3[mod*i+1] , s3[mod*i+1+mod/2]);
			s4[mod*i+2] <= max(s3[mod*i+2] , s3[mod*i+2+mod/2]);
			s4[mod*i+2+mod/2] <= min(s3[mod*i+2] , s3[mod*i+2+mod/2]);
			s4[mod*i+3] <= max(s3[mod*i+3] , s3[mod*i+3+mod/2]);
			s4[mod*i+3+mod/2] <= min(s3[mod*i+3] , s3[mod*i+3+mod/2]);
		end
	end
	p4.enq(1);
endrule
rule _Q22;
	p4.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			s5[mod*i+0] <= min(s4[mod*i+0] , s4[mod*i+0+mod/2]);
			s5[mod*i+0+mod/2] <= max(s4[mod*i+0] , s4[mod*i+0+mod/2]);
			s5[mod*i+1] <= min(s4[mod*i+1] , s4[mod*i+1+mod/2]);
			s5[mod*i+1+mod/2] <= max(s4[mod*i+1] , s4[mod*i+1+mod/2]);
		end
		else begin
			s5[mod*i+0] <= max(s4[mod*i+0] , s4[mod*i+0+mod/2]);
			s5[mod*i+0+mod/2] <= min(s4[mod*i+0] , s4[mod*i+0+mod/2]);
			s5[mod*i+1] <= max(s4[mod*i+1] , s4[mod*i+1+mod/2]);
			s5[mod*i+1+mod/2] <= min(s4[mod*i+1] , s4[mod*i+1+mod/2]);
		end
	end
	p5.enq(1);
endrule
rule _Q21;
	p5.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/4)%2 == 0) begin
			s6[mod*i+0] <= min(s5[mod*i+0] , s5[mod*i+0+mod/2]);
			s6[mod*i+0+mod/2] <= max(s5[mod*i+0] , s5[mod*i+0+mod/2]);
		end
		else begin
			s6[mod*i+0] <= max(s5[mod*i+0] , s5[mod*i+0+mod/2]);
			s6[mod*i+0+mod/2] <= min(s5[mod*i+0] , s5[mod*i+0+mod/2]);
		end
	end
	p6.enq(1);
endrule

method Action put(Vector#(L0, Int#(16)) datas);
for(int i=0;i<L0;i=i+1)
s0[i] <= datas[i];
p0.enq(1);
endmethod

method ActionValue#(Vector#(L0, Int#(16))) get;
p6.deq;
Vector#(L0,Int#(16)) r = newVector;
for(int i=0; i<L0; i = i + 1)
r[i] = s6[i];
return r;
endmethod
endmodule
endpackage
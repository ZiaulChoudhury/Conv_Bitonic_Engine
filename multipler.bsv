package bitonic;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;
#define L0 4

interface Multiply;
        method Action put(Vector#(L0, Int#(32)) datas);
        method ActionValue#(Vector#(L0, Int#(32))) get;
	method Action weight(Int#(16) w);
endinterface

(*synthesize*)
module mkMultiply(Multiply);
Reg#(Int#(32)) s0[L0];
Reg#(Int#(32)) s1[L0];
Reg#(Int#(32)) s2[L0];
Reg#(Int#(32)) s3[L0];

for(int i =0; i<L0; i = i + 1) begin
s0[i] <- mkReg(0);
s1[i] <- mkReg(0);
s2[i] <- mkReg(0);
s3[i] <- mkReg(0);
end
FIFOF#(Bit#(1)) p0 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p1 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p2 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p3 <- mkPipelineFIFOF;
rule _Q01;
	p0.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(32)) _S1i0 = min_max(pack(s0[mod*i+0]) , pack(s0[mod*i+0+mod/2]));
		if ((i/1)%2 == 0) begin
			s1[mod*i+0] <= _S1i0[0];
			s1[mod*i+0+mod/2] <= _S1i0[1];
		end
		else begin
			s1[mod*i+0] <= _S1i0[1];
			s1[mod*i+0+mod/2] <= _S1i0[0];
		end
	end
	p1.enq(1);
endrule
rule _Q12;
	p1.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(32)) _S2i0 = min_max(pack(s1[mod*i+0]) , pack(s1[mod*i+0+mod/2]));
			 Vector#(2, Int#(32)) _S2i1 = min_max(pack(s1[mod*i+1]) , pack(s1[mod*i+1+mod/2]));
		if ((i/1)%2 == 0) begin
			s2[mod*i+0] <= _S2i0[0];
			s2[mod*i+0+mod/2] <= _S2i0[1];
			s2[mod*i+1] <= _S2i1[0];
			s2[mod*i+1+mod/2] <= _S2i1[1];
		end
		else begin
			s2[mod*i+0] <= _S2i0[1];
			s2[mod*i+0+mod/2] <= _S2i0[0];
			s2[mod*i+1] <= _S2i1[1];
			s2[mod*i+1+mod/2] <= _S2i1[0];
		end
	end
	p2.enq(1);
endrule
rule _Q11;
	p2.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(32)) _S3i0 = min_max(pack(s2[mod*i+0]) , pack(s2[mod*i+0+mod/2]));
		if ((i/2)%2 == 0) begin
			s3[mod*i+0] <= _S3i0[0];
			s3[mod*i+0+mod/2] <= _S3i0[1];
		end
		else begin
			s3[mod*i+0] <= _S3i0[1];
			s3[mod*i+0+mod/2] <= _S3i0[0];
		end
	end
	p3.enq(1);
endrule

method Action put(Vector#(L0, Int#(32)) datas);
for(int i=0;i<L0;i=i+1)
s0[i] <= datas[i];
p0.enq(1);
endmethod

method ActionValue#(Vector#(L0, Int#(32))) get;
p3.deq;
Vector#(L0,Int#(32)) r = newVector;
for(int i=0; i<L0; i = i + 1)
r[i] = s3[i];
return r;
endmethod
endmodule
endpackage

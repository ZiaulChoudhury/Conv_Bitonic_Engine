package bitonic;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;
#define L0 16

interface Bitonic;
        method Action put(Vector#(L0, Int#(32)) datas);
        method ActionValue#(Vector#(L0, Int#(32))) get;
endinterface


function Vector#(2,Int#(32)) min_max(Bit#(32) pkt1, Bit#(32) pkt2);
	Int#(8)  p1_partition = unpack(pkt1[7:0]);
	Int#(8)  p2_partition = unpack(pkt2[7:0]);
	Int#(8)  p1_conv      = unpack(pkt1[15:8]);
	Int#(8)  p2_conv      = unpack(pkt2[15:8]);
	Vector#(2,Int#(32)) sort = newVector;
	if (p1_partition < p2_partition || (p1_partition == p2_partition && p1_conv < p2_conv)) begin
		 sort[0] = unpack(pkt1); sort[1] = unpack(pkt2); end
	else begin
		 sort[1] = unpack(pkt1); sort[0] = unpack(pkt2); end
	return sort;
endfunction


(*synthesize*)
module mkBitonic(Bitonic);
Reg#(Int#(32)) s0[L0];
Reg#(Int#(32)) s1[L0];
Reg#(Int#(32)) s2[L0];
Reg#(Int#(32)) s3[L0];
Reg#(Int#(32)) s4[L0];
Reg#(Int#(32)) s5[L0];
Reg#(Int#(32)) s6[L0];
Reg#(Int#(32)) s7[L0];
Reg#(Int#(32)) s8[L0];
Reg#(Int#(32)) s9[L0];
Reg#(Int#(32)) s10[L0];

for(int i =0; i<L0; i = i + 1) begin
s0[i] <- mkReg(0);
s1[i] <- mkReg(0);
s2[i] <- mkReg(0);
s3[i] <- mkReg(0);
s4[i] <- mkReg(0);
s5[i] <- mkReg(0);
s6[i] <- mkReg(0);
s7[i] <- mkReg(0);
s8[i] <- mkReg(0);
s9[i] <- mkReg(0);
s10[i] <- mkReg(0);
end
FIFOF#(Bit#(1)) p0 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p1 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p2 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p3 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p4 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p5 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p6 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p7 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p8 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p9 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p10 <- mkPipelineFIFOF;
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
rule _Q23;
	p3.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(32)) _S4i0 = min_max(pack(s3[mod*i+0]) , pack(s3[mod*i+0+mod/2]));
			 Vector#(2, Int#(32)) _S4i1 = min_max(pack(s3[mod*i+1]) , pack(s3[mod*i+1+mod/2]));
			 Vector#(2, Int#(32)) _S4i2 = min_max(pack(s3[mod*i+2]) , pack(s3[mod*i+2+mod/2]));
			 Vector#(2, Int#(32)) _S4i3 = min_max(pack(s3[mod*i+3]) , pack(s3[mod*i+3+mod/2]));
		if ((i/1)%2 == 0) begin
			s4[mod*i+0] <= _S4i0[0];
			s4[mod*i+0+mod/2] <= _S4i0[1];
			s4[mod*i+1] <= _S4i1[0];
			s4[mod*i+1+mod/2] <= _S4i1[1];
			s4[mod*i+2] <= _S4i2[0];
			s4[mod*i+2+mod/2] <= _S4i2[1];
			s4[mod*i+3] <= _S4i3[0];
			s4[mod*i+3+mod/2] <= _S4i3[1];
		end
		else begin
			s4[mod*i+0] <= _S4i0[1];
			s4[mod*i+0+mod/2] <= _S4i0[0];
			s4[mod*i+1] <= _S4i1[1];
			s4[mod*i+1+mod/2] <= _S4i1[0];
			s4[mod*i+2] <= _S4i2[1];
			s4[mod*i+2+mod/2] <= _S4i2[0];
			s4[mod*i+3] <= _S4i3[1];
			s4[mod*i+3+mod/2] <= _S4i3[0];
		end
	end
	p4.enq(1);
endrule
rule _Q22;
	p4.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(32)) _S5i0 = min_max(pack(s4[mod*i+0]) , pack(s4[mod*i+0+mod/2]));
			 Vector#(2, Int#(32)) _S5i1 = min_max(pack(s4[mod*i+1]) , pack(s4[mod*i+1+mod/2]));
		if ((i/2)%2 == 0) begin
			s5[mod*i+0] <= _S5i0[0];
			s5[mod*i+0+mod/2] <= _S5i0[1];
			s5[mod*i+1] <= _S5i1[0];
			s5[mod*i+1+mod/2] <= _S5i1[1];
		end
		else begin
			s5[mod*i+0] <= _S5i0[1];
			s5[mod*i+0+mod/2] <= _S5i0[0];
			s5[mod*i+1] <= _S5i1[1];
			s5[mod*i+1+mod/2] <= _S5i1[0];
		end
	end
	p5.enq(1);
endrule
rule _Q21;
	p5.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(32)) _S6i0 = min_max(pack(s5[mod*i+0]) , pack(s5[mod*i+0+mod/2]));
		if ((i/4)%2 == 0) begin
			s6[mod*i+0] <= _S6i0[0];
			s6[mod*i+0+mod/2] <= _S6i0[1];
		end
		else begin
			s6[mod*i+0] <= _S6i0[1];
			s6[mod*i+0+mod/2] <= _S6i0[0];
		end
	end
	p6.enq(1);
endrule
rule _Q34;
	p6.deq;
	let mod = 16;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(32)) _S7i0 = min_max(pack(s6[mod*i+0]) , pack(s6[mod*i+0+mod/2]));
			 Vector#(2, Int#(32)) _S7i1 = min_max(pack(s6[mod*i+1]) , pack(s6[mod*i+1+mod/2]));
			 Vector#(2, Int#(32)) _S7i2 = min_max(pack(s6[mod*i+2]) , pack(s6[mod*i+2+mod/2]));
			 Vector#(2, Int#(32)) _S7i3 = min_max(pack(s6[mod*i+3]) , pack(s6[mod*i+3+mod/2]));
			 Vector#(2, Int#(32)) _S7i4 = min_max(pack(s6[mod*i+4]) , pack(s6[mod*i+4+mod/2]));
			 Vector#(2, Int#(32)) _S7i5 = min_max(pack(s6[mod*i+5]) , pack(s6[mod*i+5+mod/2]));
			 Vector#(2, Int#(32)) _S7i6 = min_max(pack(s6[mod*i+6]) , pack(s6[mod*i+6+mod/2]));
			 Vector#(2, Int#(32)) _S7i7 = min_max(pack(s6[mod*i+7]) , pack(s6[mod*i+7+mod/2]));
		if ((i/1)%2 == 0) begin
			s7[mod*i+0] <= _S7i0[0];
			s7[mod*i+0+mod/2] <= _S7i0[1];
			s7[mod*i+1] <= _S7i1[0];
			s7[mod*i+1+mod/2] <= _S7i1[1];
			s7[mod*i+2] <= _S7i2[0];
			s7[mod*i+2+mod/2] <= _S7i2[1];
			s7[mod*i+3] <= _S7i3[0];
			s7[mod*i+3+mod/2] <= _S7i3[1];
			s7[mod*i+4] <= _S7i4[0];
			s7[mod*i+4+mod/2] <= _S7i4[1];
			s7[mod*i+5] <= _S7i5[0];
			s7[mod*i+5+mod/2] <= _S7i5[1];
			s7[mod*i+6] <= _S7i6[0];
			s7[mod*i+6+mod/2] <= _S7i6[1];
			s7[mod*i+7] <= _S7i7[0];
			s7[mod*i+7+mod/2] <= _S7i7[1];
		end
		else begin
			s7[mod*i+0] <= _S7i0[1];
			s7[mod*i+0+mod/2] <= _S7i0[0];
			s7[mod*i+1] <= _S7i1[1];
			s7[mod*i+1+mod/2] <= _S7i1[0];
			s7[mod*i+2] <= _S7i2[1];
			s7[mod*i+2+mod/2] <= _S7i2[0];
			s7[mod*i+3] <= _S7i3[1];
			s7[mod*i+3+mod/2] <= _S7i3[0];
			s7[mod*i+4] <= _S7i4[1];
			s7[mod*i+4+mod/2] <= _S7i4[0];
			s7[mod*i+5] <= _S7i5[1];
			s7[mod*i+5+mod/2] <= _S7i5[0];
			s7[mod*i+6] <= _S7i6[1];
			s7[mod*i+6+mod/2] <= _S7i6[0];
			s7[mod*i+7] <= _S7i7[1];
			s7[mod*i+7+mod/2] <= _S7i7[0];
		end
	end
	p7.enq(1);
endrule
rule _Q33;
	p7.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(32)) _S8i0 = min_max(pack(s7[mod*i+0]) , pack(s7[mod*i+0+mod/2]));
			 Vector#(2, Int#(32)) _S8i1 = min_max(pack(s7[mod*i+1]) , pack(s7[mod*i+1+mod/2]));
			 Vector#(2, Int#(32)) _S8i2 = min_max(pack(s7[mod*i+2]) , pack(s7[mod*i+2+mod/2]));
			 Vector#(2, Int#(32)) _S8i3 = min_max(pack(s7[mod*i+3]) , pack(s7[mod*i+3+mod/2]));
		if ((i/2)%2 == 0) begin
			s8[mod*i+0] <= _S8i0[0];
			s8[mod*i+0+mod/2] <= _S8i0[1];
			s8[mod*i+1] <= _S8i1[0];
			s8[mod*i+1+mod/2] <= _S8i1[1];
			s8[mod*i+2] <= _S8i2[0];
			s8[mod*i+2+mod/2] <= _S8i2[1];
			s8[mod*i+3] <= _S8i3[0];
			s8[mod*i+3+mod/2] <= _S8i3[1];
		end
		else begin
			s8[mod*i+0] <= _S8i0[1];
			s8[mod*i+0+mod/2] <= _S8i0[0];
			s8[mod*i+1] <= _S8i1[1];
			s8[mod*i+1+mod/2] <= _S8i1[0];
			s8[mod*i+2] <= _S8i2[1];
			s8[mod*i+2+mod/2] <= _S8i2[0];
			s8[mod*i+3] <= _S8i3[1];
			s8[mod*i+3+mod/2] <= _S8i3[0];
		end
	end
	p8.enq(1);
endrule
rule _Q32;
	p8.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(32)) _S9i0 = min_max(pack(s8[mod*i+0]) , pack(s8[mod*i+0+mod/2]));
			 Vector#(2, Int#(32)) _S9i1 = min_max(pack(s8[mod*i+1]) , pack(s8[mod*i+1+mod/2]));
		if ((i/4)%2 == 0) begin
			s9[mod*i+0] <= _S9i0[0];
			s9[mod*i+0+mod/2] <= _S9i0[1];
			s9[mod*i+1] <= _S9i1[0];
			s9[mod*i+1+mod/2] <= _S9i1[1];
		end
		else begin
			s9[mod*i+0] <= _S9i0[1];
			s9[mod*i+0+mod/2] <= _S9i0[0];
			s9[mod*i+1] <= _S9i1[1];
			s9[mod*i+1+mod/2] <= _S9i1[0];
		end
	end
	p9.enq(1);
endrule
rule _Q31;
	p9.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(32)) _S10i0 = min_max(pack(s9[mod*i+0]) , pack(s9[mod*i+0+mod/2]));
		if ((i/8)%2 == 0) begin
			s10[mod*i+0] <= _S10i0[0];
			s10[mod*i+0+mod/2] <= _S10i0[1];
		end
		else begin
			s10[mod*i+0] <= _S10i0[1];
			s10[mod*i+0+mod/2] <= _S10i0[0];
		end
	end
	p10.enq(1);
endrule

method Action put(Vector#(L0, Int#(32)) datas);
for(int i=0;i<L0;i=i+1)
s0[i] <= datas[i];
p0.enq(1);
endmethod

method ActionValue#(Vector#(L0, Int#(32))) get;
p10.deq;
Vector#(L0,Int#(32)) r = newVector;
for(int i=0; i<L0; i = i + 1)
r[i] = s10[i];
return r;
endmethod
endmodule
endpackage
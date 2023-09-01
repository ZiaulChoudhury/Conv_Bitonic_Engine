package bitonic;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;
#define L0 128

interface Bitonic;
        method Action put(Vector#(L0, Int#(16)) datas);
        method ActionValue#(Vector#(L0, Int#(16))) get;
endinterface


function Vector#(2,Int#(16)) min_max(Bit#(16) pkt1, Bit#(16) pkt2);
	Int#(4)  p1_partition = unpack(pkt1[3:0]);
	Int#(4)  p2_partition = unpack(pkt2[3:0]);
	Int#(4)  p1_conv      = unpack(pkt1[7:4]);
	Int#(4)  p2_conv      = unpack(pkt2[7:4]);
	Vector#(2,Int#(16)) sort = newVector;
	if (p1_partition < p2_partition || (p1_partition == p2_partition && p1_conv < p2_conv)) begin
		 sort[0] = unpack(pkt1); sort[1] = unpack(pkt2); end
	else begin
		 sort[1] = unpack(pkt1); sort[0] = unpack(pkt2); end
	return sort;
endfunction


(*synthesize*)
module mkBitonic(Bitonic);
Reg#(Int#(16)) s0[L0];
Reg#(Int#(16)) s1[L0];
Reg#(Int#(16)) s2[L0];
Reg#(Int#(16)) s3[L0];
Reg#(Int#(16)) s4[L0];
Reg#(Int#(16)) s5[L0];
Reg#(Int#(16)) s6[L0];
Reg#(Int#(16)) s7[L0];
Reg#(Int#(16)) s8[L0];
Reg#(Int#(16)) s9[L0];
Reg#(Int#(16)) s10[L0];
Reg#(Int#(16)) s11[L0];
Reg#(Int#(16)) s12[L0];
Reg#(Int#(16)) s13[L0];
Reg#(Int#(16)) s14[L0];
Reg#(Int#(16)) s15[L0];
Reg#(Int#(16)) s16[L0];
Reg#(Int#(16)) s17[L0];
Reg#(Int#(16)) s18[L0];
Reg#(Int#(16)) s19[L0];
Reg#(Int#(16)) s20[L0];
Reg#(Int#(16)) s21[L0];
Reg#(Int#(16)) s22[L0];
Reg#(Int#(16)) s23[L0];
Reg#(Int#(16)) s24[L0];
Reg#(Int#(16)) s25[L0];
Reg#(Int#(16)) s26[L0];
Reg#(Int#(16)) s27[L0];
Reg#(Int#(16)) s28[L0];

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
s11[i] <- mkReg(0);
s12[i] <- mkReg(0);
s13[i] <- mkReg(0);
s14[i] <- mkReg(0);
s15[i] <- mkReg(0);
s16[i] <- mkReg(0);
s17[i] <- mkReg(0);
s18[i] <- mkReg(0);
s19[i] <- mkReg(0);
s20[i] <- mkReg(0);
s21[i] <- mkReg(0);
s22[i] <- mkReg(0);
s23[i] <- mkReg(0);
s24[i] <- mkReg(0);
s25[i] <- mkReg(0);
s26[i] <- mkReg(0);
s27[i] <- mkReg(0);
s28[i] <- mkReg(0);
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
FIFOF#(Bit#(1)) p11 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p12 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p13 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p14 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p15 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p16 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p17 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p18 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p19 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p20 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p21 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p22 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p23 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p24 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p25 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p26 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p27 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p28 <- mkPipelineFIFOF;
rule _Q01;
	p0.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S1i0 = min_max(pack(s0[mod*i+0]) , pack(s0[mod*i+0+mod/2]));
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
			 Vector#(2, Int#(16)) _S2i0 = min_max(pack(s1[mod*i+0]) , pack(s1[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S2i1 = min_max(pack(s1[mod*i+1]) , pack(s1[mod*i+1+mod/2]));
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
			 Vector#(2, Int#(16)) _S3i0 = min_max(pack(s2[mod*i+0]) , pack(s2[mod*i+0+mod/2]));
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
			 Vector#(2, Int#(16)) _S4i0 = min_max(pack(s3[mod*i+0]) , pack(s3[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S4i1 = min_max(pack(s3[mod*i+1]) , pack(s3[mod*i+1+mod/2]));
			 Vector#(2, Int#(16)) _S4i2 = min_max(pack(s3[mod*i+2]) , pack(s3[mod*i+2+mod/2]));
			 Vector#(2, Int#(16)) _S4i3 = min_max(pack(s3[mod*i+3]) , pack(s3[mod*i+3+mod/2]));
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
			 Vector#(2, Int#(16)) _S5i0 = min_max(pack(s4[mod*i+0]) , pack(s4[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S5i1 = min_max(pack(s4[mod*i+1]) , pack(s4[mod*i+1+mod/2]));
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
			 Vector#(2, Int#(16)) _S6i0 = min_max(pack(s5[mod*i+0]) , pack(s5[mod*i+0+mod/2]));
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
			 Vector#(2, Int#(16)) _S7i0 = min_max(pack(s6[mod*i+0]) , pack(s6[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S7i1 = min_max(pack(s6[mod*i+1]) , pack(s6[mod*i+1+mod/2]));
			 Vector#(2, Int#(16)) _S7i2 = min_max(pack(s6[mod*i+2]) , pack(s6[mod*i+2+mod/2]));
			 Vector#(2, Int#(16)) _S7i3 = min_max(pack(s6[mod*i+3]) , pack(s6[mod*i+3+mod/2]));
			 Vector#(2, Int#(16)) _S7i4 = min_max(pack(s6[mod*i+4]) , pack(s6[mod*i+4+mod/2]));
			 Vector#(2, Int#(16)) _S7i5 = min_max(pack(s6[mod*i+5]) , pack(s6[mod*i+5+mod/2]));
			 Vector#(2, Int#(16)) _S7i6 = min_max(pack(s6[mod*i+6]) , pack(s6[mod*i+6+mod/2]));
			 Vector#(2, Int#(16)) _S7i7 = min_max(pack(s6[mod*i+7]) , pack(s6[mod*i+7+mod/2]));
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
			 Vector#(2, Int#(16)) _S8i0 = min_max(pack(s7[mod*i+0]) , pack(s7[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S8i1 = min_max(pack(s7[mod*i+1]) , pack(s7[mod*i+1+mod/2]));
			 Vector#(2, Int#(16)) _S8i2 = min_max(pack(s7[mod*i+2]) , pack(s7[mod*i+2+mod/2]));
			 Vector#(2, Int#(16)) _S8i3 = min_max(pack(s7[mod*i+3]) , pack(s7[mod*i+3+mod/2]));
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
			 Vector#(2, Int#(16)) _S9i0 = min_max(pack(s8[mod*i+0]) , pack(s8[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S9i1 = min_max(pack(s8[mod*i+1]) , pack(s8[mod*i+1+mod/2]));
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
			 Vector#(2, Int#(16)) _S10i0 = min_max(pack(s9[mod*i+0]) , pack(s9[mod*i+0+mod/2]));
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
rule _Q45;
	p10.deq;
	let mod = 32;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S11i0 = min_max(pack(s10[mod*i+0]) , pack(s10[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S11i1 = min_max(pack(s10[mod*i+1]) , pack(s10[mod*i+1+mod/2]));
			 Vector#(2, Int#(16)) _S11i2 = min_max(pack(s10[mod*i+2]) , pack(s10[mod*i+2+mod/2]));
			 Vector#(2, Int#(16)) _S11i3 = min_max(pack(s10[mod*i+3]) , pack(s10[mod*i+3+mod/2]));
			 Vector#(2, Int#(16)) _S11i4 = min_max(pack(s10[mod*i+4]) , pack(s10[mod*i+4+mod/2]));
			 Vector#(2, Int#(16)) _S11i5 = min_max(pack(s10[mod*i+5]) , pack(s10[mod*i+5+mod/2]));
			 Vector#(2, Int#(16)) _S11i6 = min_max(pack(s10[mod*i+6]) , pack(s10[mod*i+6+mod/2]));
			 Vector#(2, Int#(16)) _S11i7 = min_max(pack(s10[mod*i+7]) , pack(s10[mod*i+7+mod/2]));
			 Vector#(2, Int#(16)) _S11i8 = min_max(pack(s10[mod*i+8]) , pack(s10[mod*i+8+mod/2]));
			 Vector#(2, Int#(16)) _S11i9 = min_max(pack(s10[mod*i+9]) , pack(s10[mod*i+9+mod/2]));
			 Vector#(2, Int#(16)) _S11i10 = min_max(pack(s10[mod*i+10]) , pack(s10[mod*i+10+mod/2]));
			 Vector#(2, Int#(16)) _S11i11 = min_max(pack(s10[mod*i+11]) , pack(s10[mod*i+11+mod/2]));
			 Vector#(2, Int#(16)) _S11i12 = min_max(pack(s10[mod*i+12]) , pack(s10[mod*i+12+mod/2]));
			 Vector#(2, Int#(16)) _S11i13 = min_max(pack(s10[mod*i+13]) , pack(s10[mod*i+13+mod/2]));
			 Vector#(2, Int#(16)) _S11i14 = min_max(pack(s10[mod*i+14]) , pack(s10[mod*i+14+mod/2]));
			 Vector#(2, Int#(16)) _S11i15 = min_max(pack(s10[mod*i+15]) , pack(s10[mod*i+15+mod/2]));
		if ((i/1)%2 == 0) begin
			s11[mod*i+0] <= _S11i0[0];
			s11[mod*i+0+mod/2] <= _S11i0[1];
			s11[mod*i+1] <= _S11i1[0];
			s11[mod*i+1+mod/2] <= _S11i1[1];
			s11[mod*i+2] <= _S11i2[0];
			s11[mod*i+2+mod/2] <= _S11i2[1];
			s11[mod*i+3] <= _S11i3[0];
			s11[mod*i+3+mod/2] <= _S11i3[1];
			s11[mod*i+4] <= _S11i4[0];
			s11[mod*i+4+mod/2] <= _S11i4[1];
			s11[mod*i+5] <= _S11i5[0];
			s11[mod*i+5+mod/2] <= _S11i5[1];
			s11[mod*i+6] <= _S11i6[0];
			s11[mod*i+6+mod/2] <= _S11i6[1];
			s11[mod*i+7] <= _S11i7[0];
			s11[mod*i+7+mod/2] <= _S11i7[1];
			s11[mod*i+8] <= _S11i8[0];
			s11[mod*i+8+mod/2] <= _S11i8[1];
			s11[mod*i+9] <= _S11i9[0];
			s11[mod*i+9+mod/2] <= _S11i9[1];
			s11[mod*i+10] <= _S11i10[0];
			s11[mod*i+10+mod/2] <= _S11i10[1];
			s11[mod*i+11] <= _S11i11[0];
			s11[mod*i+11+mod/2] <= _S11i11[1];
			s11[mod*i+12] <= _S11i12[0];
			s11[mod*i+12+mod/2] <= _S11i12[1];
			s11[mod*i+13] <= _S11i13[0];
			s11[mod*i+13+mod/2] <= _S11i13[1];
			s11[mod*i+14] <= _S11i14[0];
			s11[mod*i+14+mod/2] <= _S11i14[1];
			s11[mod*i+15] <= _S11i15[0];
			s11[mod*i+15+mod/2] <= _S11i15[1];
		end
		else begin
			s11[mod*i+0] <= _S11i0[1];
			s11[mod*i+0+mod/2] <= _S11i0[0];
			s11[mod*i+1] <= _S11i1[1];
			s11[mod*i+1+mod/2] <= _S11i1[0];
			s11[mod*i+2] <= _S11i2[1];
			s11[mod*i+2+mod/2] <= _S11i2[0];
			s11[mod*i+3] <= _S11i3[1];
			s11[mod*i+3+mod/2] <= _S11i3[0];
			s11[mod*i+4] <= _S11i4[1];
			s11[mod*i+4+mod/2] <= _S11i4[0];
			s11[mod*i+5] <= _S11i5[1];
			s11[mod*i+5+mod/2] <= _S11i5[0];
			s11[mod*i+6] <= _S11i6[1];
			s11[mod*i+6+mod/2] <= _S11i6[0];
			s11[mod*i+7] <= _S11i7[1];
			s11[mod*i+7+mod/2] <= _S11i7[0];
			s11[mod*i+8] <= _S11i8[1];
			s11[mod*i+8+mod/2] <= _S11i8[0];
			s11[mod*i+9] <= _S11i9[1];
			s11[mod*i+9+mod/2] <= _S11i9[0];
			s11[mod*i+10] <= _S11i10[1];
			s11[mod*i+10+mod/2] <= _S11i10[0];
			s11[mod*i+11] <= _S11i11[1];
			s11[mod*i+11+mod/2] <= _S11i11[0];
			s11[mod*i+12] <= _S11i12[1];
			s11[mod*i+12+mod/2] <= _S11i12[0];
			s11[mod*i+13] <= _S11i13[1];
			s11[mod*i+13+mod/2] <= _S11i13[0];
			s11[mod*i+14] <= _S11i14[1];
			s11[mod*i+14+mod/2] <= _S11i14[0];
			s11[mod*i+15] <= _S11i15[1];
			s11[mod*i+15+mod/2] <= _S11i15[0];
		end
	end
	p11.enq(1);
endrule
rule _Q44;
	p11.deq;
	let mod = 16;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S12i0 = min_max(pack(s11[mod*i+0]) , pack(s11[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S12i1 = min_max(pack(s11[mod*i+1]) , pack(s11[mod*i+1+mod/2]));
			 Vector#(2, Int#(16)) _S12i2 = min_max(pack(s11[mod*i+2]) , pack(s11[mod*i+2+mod/2]));
			 Vector#(2, Int#(16)) _S12i3 = min_max(pack(s11[mod*i+3]) , pack(s11[mod*i+3+mod/2]));
			 Vector#(2, Int#(16)) _S12i4 = min_max(pack(s11[mod*i+4]) , pack(s11[mod*i+4+mod/2]));
			 Vector#(2, Int#(16)) _S12i5 = min_max(pack(s11[mod*i+5]) , pack(s11[mod*i+5+mod/2]));
			 Vector#(2, Int#(16)) _S12i6 = min_max(pack(s11[mod*i+6]) , pack(s11[mod*i+6+mod/2]));
			 Vector#(2, Int#(16)) _S12i7 = min_max(pack(s11[mod*i+7]) , pack(s11[mod*i+7+mod/2]));
		if ((i/2)%2 == 0) begin
			s12[mod*i+0] <= _S12i0[0];
			s12[mod*i+0+mod/2] <= _S12i0[1];
			s12[mod*i+1] <= _S12i1[0];
			s12[mod*i+1+mod/2] <= _S12i1[1];
			s12[mod*i+2] <= _S12i2[0];
			s12[mod*i+2+mod/2] <= _S12i2[1];
			s12[mod*i+3] <= _S12i3[0];
			s12[mod*i+3+mod/2] <= _S12i3[1];
			s12[mod*i+4] <= _S12i4[0];
			s12[mod*i+4+mod/2] <= _S12i4[1];
			s12[mod*i+5] <= _S12i5[0];
			s12[mod*i+5+mod/2] <= _S12i5[1];
			s12[mod*i+6] <= _S12i6[0];
			s12[mod*i+6+mod/2] <= _S12i6[1];
			s12[mod*i+7] <= _S12i7[0];
			s12[mod*i+7+mod/2] <= _S12i7[1];
		end
		else begin
			s12[mod*i+0] <= _S12i0[1];
			s12[mod*i+0+mod/2] <= _S12i0[0];
			s12[mod*i+1] <= _S12i1[1];
			s12[mod*i+1+mod/2] <= _S12i1[0];
			s12[mod*i+2] <= _S12i2[1];
			s12[mod*i+2+mod/2] <= _S12i2[0];
			s12[mod*i+3] <= _S12i3[1];
			s12[mod*i+3+mod/2] <= _S12i3[0];
			s12[mod*i+4] <= _S12i4[1];
			s12[mod*i+4+mod/2] <= _S12i4[0];
			s12[mod*i+5] <= _S12i5[1];
			s12[mod*i+5+mod/2] <= _S12i5[0];
			s12[mod*i+6] <= _S12i6[1];
			s12[mod*i+6+mod/2] <= _S12i6[0];
			s12[mod*i+7] <= _S12i7[1];
			s12[mod*i+7+mod/2] <= _S12i7[0];
		end
	end
	p12.enq(1);
endrule
rule _Q43;
	p12.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S13i0 = min_max(pack(s12[mod*i+0]) , pack(s12[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S13i1 = min_max(pack(s12[mod*i+1]) , pack(s12[mod*i+1+mod/2]));
			 Vector#(2, Int#(16)) _S13i2 = min_max(pack(s12[mod*i+2]) , pack(s12[mod*i+2+mod/2]));
			 Vector#(2, Int#(16)) _S13i3 = min_max(pack(s12[mod*i+3]) , pack(s12[mod*i+3+mod/2]));
		if ((i/4)%2 == 0) begin
			s13[mod*i+0] <= _S13i0[0];
			s13[mod*i+0+mod/2] <= _S13i0[1];
			s13[mod*i+1] <= _S13i1[0];
			s13[mod*i+1+mod/2] <= _S13i1[1];
			s13[mod*i+2] <= _S13i2[0];
			s13[mod*i+2+mod/2] <= _S13i2[1];
			s13[mod*i+3] <= _S13i3[0];
			s13[mod*i+3+mod/2] <= _S13i3[1];
		end
		else begin
			s13[mod*i+0] <= _S13i0[1];
			s13[mod*i+0+mod/2] <= _S13i0[0];
			s13[mod*i+1] <= _S13i1[1];
			s13[mod*i+1+mod/2] <= _S13i1[0];
			s13[mod*i+2] <= _S13i2[1];
			s13[mod*i+2+mod/2] <= _S13i2[0];
			s13[mod*i+3] <= _S13i3[1];
			s13[mod*i+3+mod/2] <= _S13i3[0];
		end
	end
	p13.enq(1);
endrule
rule _Q42;
	p13.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S14i0 = min_max(pack(s13[mod*i+0]) , pack(s13[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S14i1 = min_max(pack(s13[mod*i+1]) , pack(s13[mod*i+1+mod/2]));
		if ((i/8)%2 == 0) begin
			s14[mod*i+0] <= _S14i0[0];
			s14[mod*i+0+mod/2] <= _S14i0[1];
			s14[mod*i+1] <= _S14i1[0];
			s14[mod*i+1+mod/2] <= _S14i1[1];
		end
		else begin
			s14[mod*i+0] <= _S14i0[1];
			s14[mod*i+0+mod/2] <= _S14i0[0];
			s14[mod*i+1] <= _S14i1[1];
			s14[mod*i+1+mod/2] <= _S14i1[0];
		end
	end
	p14.enq(1);
endrule
rule _Q41;
	p14.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S15i0 = min_max(pack(s14[mod*i+0]) , pack(s14[mod*i+0+mod/2]));
		if ((i/16)%2 == 0) begin
			s15[mod*i+0] <= _S15i0[0];
			s15[mod*i+0+mod/2] <= _S15i0[1];
		end
		else begin
			s15[mod*i+0] <= _S15i0[1];
			s15[mod*i+0+mod/2] <= _S15i0[0];
		end
	end
	p15.enq(1);
endrule
rule _Q56;
	p15.deq;
	let mod = 64;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S16i0 = min_max(pack(s15[mod*i+0]) , pack(s15[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S16i1 = min_max(pack(s15[mod*i+1]) , pack(s15[mod*i+1+mod/2]));
			 Vector#(2, Int#(16)) _S16i2 = min_max(pack(s15[mod*i+2]) , pack(s15[mod*i+2+mod/2]));
			 Vector#(2, Int#(16)) _S16i3 = min_max(pack(s15[mod*i+3]) , pack(s15[mod*i+3+mod/2]));
			 Vector#(2, Int#(16)) _S16i4 = min_max(pack(s15[mod*i+4]) , pack(s15[mod*i+4+mod/2]));
			 Vector#(2, Int#(16)) _S16i5 = min_max(pack(s15[mod*i+5]) , pack(s15[mod*i+5+mod/2]));
			 Vector#(2, Int#(16)) _S16i6 = min_max(pack(s15[mod*i+6]) , pack(s15[mod*i+6+mod/2]));
			 Vector#(2, Int#(16)) _S16i7 = min_max(pack(s15[mod*i+7]) , pack(s15[mod*i+7+mod/2]));
			 Vector#(2, Int#(16)) _S16i8 = min_max(pack(s15[mod*i+8]) , pack(s15[mod*i+8+mod/2]));
			 Vector#(2, Int#(16)) _S16i9 = min_max(pack(s15[mod*i+9]) , pack(s15[mod*i+9+mod/2]));
			 Vector#(2, Int#(16)) _S16i10 = min_max(pack(s15[mod*i+10]) , pack(s15[mod*i+10+mod/2]));
			 Vector#(2, Int#(16)) _S16i11 = min_max(pack(s15[mod*i+11]) , pack(s15[mod*i+11+mod/2]));
			 Vector#(2, Int#(16)) _S16i12 = min_max(pack(s15[mod*i+12]) , pack(s15[mod*i+12+mod/2]));
			 Vector#(2, Int#(16)) _S16i13 = min_max(pack(s15[mod*i+13]) , pack(s15[mod*i+13+mod/2]));
			 Vector#(2, Int#(16)) _S16i14 = min_max(pack(s15[mod*i+14]) , pack(s15[mod*i+14+mod/2]));
			 Vector#(2, Int#(16)) _S16i15 = min_max(pack(s15[mod*i+15]) , pack(s15[mod*i+15+mod/2]));
			 Vector#(2, Int#(16)) _S16i16 = min_max(pack(s15[mod*i+16]) , pack(s15[mod*i+16+mod/2]));
			 Vector#(2, Int#(16)) _S16i17 = min_max(pack(s15[mod*i+17]) , pack(s15[mod*i+17+mod/2]));
			 Vector#(2, Int#(16)) _S16i18 = min_max(pack(s15[mod*i+18]) , pack(s15[mod*i+18+mod/2]));
			 Vector#(2, Int#(16)) _S16i19 = min_max(pack(s15[mod*i+19]) , pack(s15[mod*i+19+mod/2]));
			 Vector#(2, Int#(16)) _S16i20 = min_max(pack(s15[mod*i+20]) , pack(s15[mod*i+20+mod/2]));
			 Vector#(2, Int#(16)) _S16i21 = min_max(pack(s15[mod*i+21]) , pack(s15[mod*i+21+mod/2]));
			 Vector#(2, Int#(16)) _S16i22 = min_max(pack(s15[mod*i+22]) , pack(s15[mod*i+22+mod/2]));
			 Vector#(2, Int#(16)) _S16i23 = min_max(pack(s15[mod*i+23]) , pack(s15[mod*i+23+mod/2]));
			 Vector#(2, Int#(16)) _S16i24 = min_max(pack(s15[mod*i+24]) , pack(s15[mod*i+24+mod/2]));
			 Vector#(2, Int#(16)) _S16i25 = min_max(pack(s15[mod*i+25]) , pack(s15[mod*i+25+mod/2]));
			 Vector#(2, Int#(16)) _S16i26 = min_max(pack(s15[mod*i+26]) , pack(s15[mod*i+26+mod/2]));
			 Vector#(2, Int#(16)) _S16i27 = min_max(pack(s15[mod*i+27]) , pack(s15[mod*i+27+mod/2]));
			 Vector#(2, Int#(16)) _S16i28 = min_max(pack(s15[mod*i+28]) , pack(s15[mod*i+28+mod/2]));
			 Vector#(2, Int#(16)) _S16i29 = min_max(pack(s15[mod*i+29]) , pack(s15[mod*i+29+mod/2]));
			 Vector#(2, Int#(16)) _S16i30 = min_max(pack(s15[mod*i+30]) , pack(s15[mod*i+30+mod/2]));
			 Vector#(2, Int#(16)) _S16i31 = min_max(pack(s15[mod*i+31]) , pack(s15[mod*i+31+mod/2]));
		if ((i/1)%2 == 0) begin
			s16[mod*i+0] <= _S16i0[0];
			s16[mod*i+0+mod/2] <= _S16i0[1];
			s16[mod*i+1] <= _S16i1[0];
			s16[mod*i+1+mod/2] <= _S16i1[1];
			s16[mod*i+2] <= _S16i2[0];
			s16[mod*i+2+mod/2] <= _S16i2[1];
			s16[mod*i+3] <= _S16i3[0];
			s16[mod*i+3+mod/2] <= _S16i3[1];
			s16[mod*i+4] <= _S16i4[0];
			s16[mod*i+4+mod/2] <= _S16i4[1];
			s16[mod*i+5] <= _S16i5[0];
			s16[mod*i+5+mod/2] <= _S16i5[1];
			s16[mod*i+6] <= _S16i6[0];
			s16[mod*i+6+mod/2] <= _S16i6[1];
			s16[mod*i+7] <= _S16i7[0];
			s16[mod*i+7+mod/2] <= _S16i7[1];
			s16[mod*i+8] <= _S16i8[0];
			s16[mod*i+8+mod/2] <= _S16i8[1];
			s16[mod*i+9] <= _S16i9[0];
			s16[mod*i+9+mod/2] <= _S16i9[1];
			s16[mod*i+10] <= _S16i10[0];
			s16[mod*i+10+mod/2] <= _S16i10[1];
			s16[mod*i+11] <= _S16i11[0];
			s16[mod*i+11+mod/2] <= _S16i11[1];
			s16[mod*i+12] <= _S16i12[0];
			s16[mod*i+12+mod/2] <= _S16i12[1];
			s16[mod*i+13] <= _S16i13[0];
			s16[mod*i+13+mod/2] <= _S16i13[1];
			s16[mod*i+14] <= _S16i14[0];
			s16[mod*i+14+mod/2] <= _S16i14[1];
			s16[mod*i+15] <= _S16i15[0];
			s16[mod*i+15+mod/2] <= _S16i15[1];
			s16[mod*i+16] <= _S16i16[0];
			s16[mod*i+16+mod/2] <= _S16i16[1];
			s16[mod*i+17] <= _S16i17[0];
			s16[mod*i+17+mod/2] <= _S16i17[1];
			s16[mod*i+18] <= _S16i18[0];
			s16[mod*i+18+mod/2] <= _S16i18[1];
			s16[mod*i+19] <= _S16i19[0];
			s16[mod*i+19+mod/2] <= _S16i19[1];
			s16[mod*i+20] <= _S16i20[0];
			s16[mod*i+20+mod/2] <= _S16i20[1];
			s16[mod*i+21] <= _S16i21[0];
			s16[mod*i+21+mod/2] <= _S16i21[1];
			s16[mod*i+22] <= _S16i22[0];
			s16[mod*i+22+mod/2] <= _S16i22[1];
			s16[mod*i+23] <= _S16i23[0];
			s16[mod*i+23+mod/2] <= _S16i23[1];
			s16[mod*i+24] <= _S16i24[0];
			s16[mod*i+24+mod/2] <= _S16i24[1];
			s16[mod*i+25] <= _S16i25[0];
			s16[mod*i+25+mod/2] <= _S16i25[1];
			s16[mod*i+26] <= _S16i26[0];
			s16[mod*i+26+mod/2] <= _S16i26[1];
			s16[mod*i+27] <= _S16i27[0];
			s16[mod*i+27+mod/2] <= _S16i27[1];
			s16[mod*i+28] <= _S16i28[0];
			s16[mod*i+28+mod/2] <= _S16i28[1];
			s16[mod*i+29] <= _S16i29[0];
			s16[mod*i+29+mod/2] <= _S16i29[1];
			s16[mod*i+30] <= _S16i30[0];
			s16[mod*i+30+mod/2] <= _S16i30[1];
			s16[mod*i+31] <= _S16i31[0];
			s16[mod*i+31+mod/2] <= _S16i31[1];
		end
		else begin
			s16[mod*i+0] <= _S16i0[1];
			s16[mod*i+0+mod/2] <= _S16i0[0];
			s16[mod*i+1] <= _S16i1[1];
			s16[mod*i+1+mod/2] <= _S16i1[0];
			s16[mod*i+2] <= _S16i2[1];
			s16[mod*i+2+mod/2] <= _S16i2[0];
			s16[mod*i+3] <= _S16i3[1];
			s16[mod*i+3+mod/2] <= _S16i3[0];
			s16[mod*i+4] <= _S16i4[1];
			s16[mod*i+4+mod/2] <= _S16i4[0];
			s16[mod*i+5] <= _S16i5[1];
			s16[mod*i+5+mod/2] <= _S16i5[0];
			s16[mod*i+6] <= _S16i6[1];
			s16[mod*i+6+mod/2] <= _S16i6[0];
			s16[mod*i+7] <= _S16i7[1];
			s16[mod*i+7+mod/2] <= _S16i7[0];
			s16[mod*i+8] <= _S16i8[1];
			s16[mod*i+8+mod/2] <= _S16i8[0];
			s16[mod*i+9] <= _S16i9[1];
			s16[mod*i+9+mod/2] <= _S16i9[0];
			s16[mod*i+10] <= _S16i10[1];
			s16[mod*i+10+mod/2] <= _S16i10[0];
			s16[mod*i+11] <= _S16i11[1];
			s16[mod*i+11+mod/2] <= _S16i11[0];
			s16[mod*i+12] <= _S16i12[1];
			s16[mod*i+12+mod/2] <= _S16i12[0];
			s16[mod*i+13] <= _S16i13[1];
			s16[mod*i+13+mod/2] <= _S16i13[0];
			s16[mod*i+14] <= _S16i14[1];
			s16[mod*i+14+mod/2] <= _S16i14[0];
			s16[mod*i+15] <= _S16i15[1];
			s16[mod*i+15+mod/2] <= _S16i15[0];
			s16[mod*i+16] <= _S16i16[1];
			s16[mod*i+16+mod/2] <= _S16i16[0];
			s16[mod*i+17] <= _S16i17[1];
			s16[mod*i+17+mod/2] <= _S16i17[0];
			s16[mod*i+18] <= _S16i18[1];
			s16[mod*i+18+mod/2] <= _S16i18[0];
			s16[mod*i+19] <= _S16i19[1];
			s16[mod*i+19+mod/2] <= _S16i19[0];
			s16[mod*i+20] <= _S16i20[1];
			s16[mod*i+20+mod/2] <= _S16i20[0];
			s16[mod*i+21] <= _S16i21[1];
			s16[mod*i+21+mod/2] <= _S16i21[0];
			s16[mod*i+22] <= _S16i22[1];
			s16[mod*i+22+mod/2] <= _S16i22[0];
			s16[mod*i+23] <= _S16i23[1];
			s16[mod*i+23+mod/2] <= _S16i23[0];
			s16[mod*i+24] <= _S16i24[1];
			s16[mod*i+24+mod/2] <= _S16i24[0];
			s16[mod*i+25] <= _S16i25[1];
			s16[mod*i+25+mod/2] <= _S16i25[0];
			s16[mod*i+26] <= _S16i26[1];
			s16[mod*i+26+mod/2] <= _S16i26[0];
			s16[mod*i+27] <= _S16i27[1];
			s16[mod*i+27+mod/2] <= _S16i27[0];
			s16[mod*i+28] <= _S16i28[1];
			s16[mod*i+28+mod/2] <= _S16i28[0];
			s16[mod*i+29] <= _S16i29[1];
			s16[mod*i+29+mod/2] <= _S16i29[0];
			s16[mod*i+30] <= _S16i30[1];
			s16[mod*i+30+mod/2] <= _S16i30[0];
			s16[mod*i+31] <= _S16i31[1];
			s16[mod*i+31+mod/2] <= _S16i31[0];
		end
	end
	p16.enq(1);
endrule
rule _Q55;
	p16.deq;
	let mod = 32;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S17i0 = min_max(pack(s16[mod*i+0]) , pack(s16[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S17i1 = min_max(pack(s16[mod*i+1]) , pack(s16[mod*i+1+mod/2]));
			 Vector#(2, Int#(16)) _S17i2 = min_max(pack(s16[mod*i+2]) , pack(s16[mod*i+2+mod/2]));
			 Vector#(2, Int#(16)) _S17i3 = min_max(pack(s16[mod*i+3]) , pack(s16[mod*i+3+mod/2]));
			 Vector#(2, Int#(16)) _S17i4 = min_max(pack(s16[mod*i+4]) , pack(s16[mod*i+4+mod/2]));
			 Vector#(2, Int#(16)) _S17i5 = min_max(pack(s16[mod*i+5]) , pack(s16[mod*i+5+mod/2]));
			 Vector#(2, Int#(16)) _S17i6 = min_max(pack(s16[mod*i+6]) , pack(s16[mod*i+6+mod/2]));
			 Vector#(2, Int#(16)) _S17i7 = min_max(pack(s16[mod*i+7]) , pack(s16[mod*i+7+mod/2]));
			 Vector#(2, Int#(16)) _S17i8 = min_max(pack(s16[mod*i+8]) , pack(s16[mod*i+8+mod/2]));
			 Vector#(2, Int#(16)) _S17i9 = min_max(pack(s16[mod*i+9]) , pack(s16[mod*i+9+mod/2]));
			 Vector#(2, Int#(16)) _S17i10 = min_max(pack(s16[mod*i+10]) , pack(s16[mod*i+10+mod/2]));
			 Vector#(2, Int#(16)) _S17i11 = min_max(pack(s16[mod*i+11]) , pack(s16[mod*i+11+mod/2]));
			 Vector#(2, Int#(16)) _S17i12 = min_max(pack(s16[mod*i+12]) , pack(s16[mod*i+12+mod/2]));
			 Vector#(2, Int#(16)) _S17i13 = min_max(pack(s16[mod*i+13]) , pack(s16[mod*i+13+mod/2]));
			 Vector#(2, Int#(16)) _S17i14 = min_max(pack(s16[mod*i+14]) , pack(s16[mod*i+14+mod/2]));
			 Vector#(2, Int#(16)) _S17i15 = min_max(pack(s16[mod*i+15]) , pack(s16[mod*i+15+mod/2]));
		if ((i/2)%2 == 0) begin
			s17[mod*i+0] <= _S17i0[0];
			s17[mod*i+0+mod/2] <= _S17i0[1];
			s17[mod*i+1] <= _S17i1[0];
			s17[mod*i+1+mod/2] <= _S17i1[1];
			s17[mod*i+2] <= _S17i2[0];
			s17[mod*i+2+mod/2] <= _S17i2[1];
			s17[mod*i+3] <= _S17i3[0];
			s17[mod*i+3+mod/2] <= _S17i3[1];
			s17[mod*i+4] <= _S17i4[0];
			s17[mod*i+4+mod/2] <= _S17i4[1];
			s17[mod*i+5] <= _S17i5[0];
			s17[mod*i+5+mod/2] <= _S17i5[1];
			s17[mod*i+6] <= _S17i6[0];
			s17[mod*i+6+mod/2] <= _S17i6[1];
			s17[mod*i+7] <= _S17i7[0];
			s17[mod*i+7+mod/2] <= _S17i7[1];
			s17[mod*i+8] <= _S17i8[0];
			s17[mod*i+8+mod/2] <= _S17i8[1];
			s17[mod*i+9] <= _S17i9[0];
			s17[mod*i+9+mod/2] <= _S17i9[1];
			s17[mod*i+10] <= _S17i10[0];
			s17[mod*i+10+mod/2] <= _S17i10[1];
			s17[mod*i+11] <= _S17i11[0];
			s17[mod*i+11+mod/2] <= _S17i11[1];
			s17[mod*i+12] <= _S17i12[0];
			s17[mod*i+12+mod/2] <= _S17i12[1];
			s17[mod*i+13] <= _S17i13[0];
			s17[mod*i+13+mod/2] <= _S17i13[1];
			s17[mod*i+14] <= _S17i14[0];
			s17[mod*i+14+mod/2] <= _S17i14[1];
			s17[mod*i+15] <= _S17i15[0];
			s17[mod*i+15+mod/2] <= _S17i15[1];
		end
		else begin
			s17[mod*i+0] <= _S17i0[1];
			s17[mod*i+0+mod/2] <= _S17i0[0];
			s17[mod*i+1] <= _S17i1[1];
			s17[mod*i+1+mod/2] <= _S17i1[0];
			s17[mod*i+2] <= _S17i2[1];
			s17[mod*i+2+mod/2] <= _S17i2[0];
			s17[mod*i+3] <= _S17i3[1];
			s17[mod*i+3+mod/2] <= _S17i3[0];
			s17[mod*i+4] <= _S17i4[1];
			s17[mod*i+4+mod/2] <= _S17i4[0];
			s17[mod*i+5] <= _S17i5[1];
			s17[mod*i+5+mod/2] <= _S17i5[0];
			s17[mod*i+6] <= _S17i6[1];
			s17[mod*i+6+mod/2] <= _S17i6[0];
			s17[mod*i+7] <= _S17i7[1];
			s17[mod*i+7+mod/2] <= _S17i7[0];
			s17[mod*i+8] <= _S17i8[1];
			s17[mod*i+8+mod/2] <= _S17i8[0];
			s17[mod*i+9] <= _S17i9[1];
			s17[mod*i+9+mod/2] <= _S17i9[0];
			s17[mod*i+10] <= _S17i10[1];
			s17[mod*i+10+mod/2] <= _S17i10[0];
			s17[mod*i+11] <= _S17i11[1];
			s17[mod*i+11+mod/2] <= _S17i11[0];
			s17[mod*i+12] <= _S17i12[1];
			s17[mod*i+12+mod/2] <= _S17i12[0];
			s17[mod*i+13] <= _S17i13[1];
			s17[mod*i+13+mod/2] <= _S17i13[0];
			s17[mod*i+14] <= _S17i14[1];
			s17[mod*i+14+mod/2] <= _S17i14[0];
			s17[mod*i+15] <= _S17i15[1];
			s17[mod*i+15+mod/2] <= _S17i15[0];
		end
	end
	p17.enq(1);
endrule
rule _Q54;
	p17.deq;
	let mod = 16;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S18i0 = min_max(pack(s17[mod*i+0]) , pack(s17[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S18i1 = min_max(pack(s17[mod*i+1]) , pack(s17[mod*i+1+mod/2]));
			 Vector#(2, Int#(16)) _S18i2 = min_max(pack(s17[mod*i+2]) , pack(s17[mod*i+2+mod/2]));
			 Vector#(2, Int#(16)) _S18i3 = min_max(pack(s17[mod*i+3]) , pack(s17[mod*i+3+mod/2]));
			 Vector#(2, Int#(16)) _S18i4 = min_max(pack(s17[mod*i+4]) , pack(s17[mod*i+4+mod/2]));
			 Vector#(2, Int#(16)) _S18i5 = min_max(pack(s17[mod*i+5]) , pack(s17[mod*i+5+mod/2]));
			 Vector#(2, Int#(16)) _S18i6 = min_max(pack(s17[mod*i+6]) , pack(s17[mod*i+6+mod/2]));
			 Vector#(2, Int#(16)) _S18i7 = min_max(pack(s17[mod*i+7]) , pack(s17[mod*i+7+mod/2]));
		if ((i/4)%2 == 0) begin
			s18[mod*i+0] <= _S18i0[0];
			s18[mod*i+0+mod/2] <= _S18i0[1];
			s18[mod*i+1] <= _S18i1[0];
			s18[mod*i+1+mod/2] <= _S18i1[1];
			s18[mod*i+2] <= _S18i2[0];
			s18[mod*i+2+mod/2] <= _S18i2[1];
			s18[mod*i+3] <= _S18i3[0];
			s18[mod*i+3+mod/2] <= _S18i3[1];
			s18[mod*i+4] <= _S18i4[0];
			s18[mod*i+4+mod/2] <= _S18i4[1];
			s18[mod*i+5] <= _S18i5[0];
			s18[mod*i+5+mod/2] <= _S18i5[1];
			s18[mod*i+6] <= _S18i6[0];
			s18[mod*i+6+mod/2] <= _S18i6[1];
			s18[mod*i+7] <= _S18i7[0];
			s18[mod*i+7+mod/2] <= _S18i7[1];
		end
		else begin
			s18[mod*i+0] <= _S18i0[1];
			s18[mod*i+0+mod/2] <= _S18i0[0];
			s18[mod*i+1] <= _S18i1[1];
			s18[mod*i+1+mod/2] <= _S18i1[0];
			s18[mod*i+2] <= _S18i2[1];
			s18[mod*i+2+mod/2] <= _S18i2[0];
			s18[mod*i+3] <= _S18i3[1];
			s18[mod*i+3+mod/2] <= _S18i3[0];
			s18[mod*i+4] <= _S18i4[1];
			s18[mod*i+4+mod/2] <= _S18i4[0];
			s18[mod*i+5] <= _S18i5[1];
			s18[mod*i+5+mod/2] <= _S18i5[0];
			s18[mod*i+6] <= _S18i6[1];
			s18[mod*i+6+mod/2] <= _S18i6[0];
			s18[mod*i+7] <= _S18i7[1];
			s18[mod*i+7+mod/2] <= _S18i7[0];
		end
	end
	p18.enq(1);
endrule
rule _Q53;
	p18.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S19i0 = min_max(pack(s18[mod*i+0]) , pack(s18[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S19i1 = min_max(pack(s18[mod*i+1]) , pack(s18[mod*i+1+mod/2]));
			 Vector#(2, Int#(16)) _S19i2 = min_max(pack(s18[mod*i+2]) , pack(s18[mod*i+2+mod/2]));
			 Vector#(2, Int#(16)) _S19i3 = min_max(pack(s18[mod*i+3]) , pack(s18[mod*i+3+mod/2]));
		if ((i/8)%2 == 0) begin
			s19[mod*i+0] <= _S19i0[0];
			s19[mod*i+0+mod/2] <= _S19i0[1];
			s19[mod*i+1] <= _S19i1[0];
			s19[mod*i+1+mod/2] <= _S19i1[1];
			s19[mod*i+2] <= _S19i2[0];
			s19[mod*i+2+mod/2] <= _S19i2[1];
			s19[mod*i+3] <= _S19i3[0];
			s19[mod*i+3+mod/2] <= _S19i3[1];
		end
		else begin
			s19[mod*i+0] <= _S19i0[1];
			s19[mod*i+0+mod/2] <= _S19i0[0];
			s19[mod*i+1] <= _S19i1[1];
			s19[mod*i+1+mod/2] <= _S19i1[0];
			s19[mod*i+2] <= _S19i2[1];
			s19[mod*i+2+mod/2] <= _S19i2[0];
			s19[mod*i+3] <= _S19i3[1];
			s19[mod*i+3+mod/2] <= _S19i3[0];
		end
	end
	p19.enq(1);
endrule
rule _Q52;
	p19.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S20i0 = min_max(pack(s19[mod*i+0]) , pack(s19[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S20i1 = min_max(pack(s19[mod*i+1]) , pack(s19[mod*i+1+mod/2]));
		if ((i/16)%2 == 0) begin
			s20[mod*i+0] <= _S20i0[0];
			s20[mod*i+0+mod/2] <= _S20i0[1];
			s20[mod*i+1] <= _S20i1[0];
			s20[mod*i+1+mod/2] <= _S20i1[1];
		end
		else begin
			s20[mod*i+0] <= _S20i0[1];
			s20[mod*i+0+mod/2] <= _S20i0[0];
			s20[mod*i+1] <= _S20i1[1];
			s20[mod*i+1+mod/2] <= _S20i1[0];
		end
	end
	p20.enq(1);
endrule
rule _Q51;
	p20.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S21i0 = min_max(pack(s20[mod*i+0]) , pack(s20[mod*i+0+mod/2]));
		if ((i/32)%2 == 0) begin
			s21[mod*i+0] <= _S21i0[0];
			s21[mod*i+0+mod/2] <= _S21i0[1];
		end
		else begin
			s21[mod*i+0] <= _S21i0[1];
			s21[mod*i+0+mod/2] <= _S21i0[0];
		end
	end
	p21.enq(1);
endrule
rule _Q67;
	p21.deq;
	let mod = 128;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S22i0 = min_max(pack(s21[mod*i+0]) , pack(s21[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S22i1 = min_max(pack(s21[mod*i+1]) , pack(s21[mod*i+1+mod/2]));
			 Vector#(2, Int#(16)) _S22i2 = min_max(pack(s21[mod*i+2]) , pack(s21[mod*i+2+mod/2]));
			 Vector#(2, Int#(16)) _S22i3 = min_max(pack(s21[mod*i+3]) , pack(s21[mod*i+3+mod/2]));
			 Vector#(2, Int#(16)) _S22i4 = min_max(pack(s21[mod*i+4]) , pack(s21[mod*i+4+mod/2]));
			 Vector#(2, Int#(16)) _S22i5 = min_max(pack(s21[mod*i+5]) , pack(s21[mod*i+5+mod/2]));
			 Vector#(2, Int#(16)) _S22i6 = min_max(pack(s21[mod*i+6]) , pack(s21[mod*i+6+mod/2]));
			 Vector#(2, Int#(16)) _S22i7 = min_max(pack(s21[mod*i+7]) , pack(s21[mod*i+7+mod/2]));
			 Vector#(2, Int#(16)) _S22i8 = min_max(pack(s21[mod*i+8]) , pack(s21[mod*i+8+mod/2]));
			 Vector#(2, Int#(16)) _S22i9 = min_max(pack(s21[mod*i+9]) , pack(s21[mod*i+9+mod/2]));
			 Vector#(2, Int#(16)) _S22i10 = min_max(pack(s21[mod*i+10]) , pack(s21[mod*i+10+mod/2]));
			 Vector#(2, Int#(16)) _S22i11 = min_max(pack(s21[mod*i+11]) , pack(s21[mod*i+11+mod/2]));
			 Vector#(2, Int#(16)) _S22i12 = min_max(pack(s21[mod*i+12]) , pack(s21[mod*i+12+mod/2]));
			 Vector#(2, Int#(16)) _S22i13 = min_max(pack(s21[mod*i+13]) , pack(s21[mod*i+13+mod/2]));
			 Vector#(2, Int#(16)) _S22i14 = min_max(pack(s21[mod*i+14]) , pack(s21[mod*i+14+mod/2]));
			 Vector#(2, Int#(16)) _S22i15 = min_max(pack(s21[mod*i+15]) , pack(s21[mod*i+15+mod/2]));
			 Vector#(2, Int#(16)) _S22i16 = min_max(pack(s21[mod*i+16]) , pack(s21[mod*i+16+mod/2]));
			 Vector#(2, Int#(16)) _S22i17 = min_max(pack(s21[mod*i+17]) , pack(s21[mod*i+17+mod/2]));
			 Vector#(2, Int#(16)) _S22i18 = min_max(pack(s21[mod*i+18]) , pack(s21[mod*i+18+mod/2]));
			 Vector#(2, Int#(16)) _S22i19 = min_max(pack(s21[mod*i+19]) , pack(s21[mod*i+19+mod/2]));
			 Vector#(2, Int#(16)) _S22i20 = min_max(pack(s21[mod*i+20]) , pack(s21[mod*i+20+mod/2]));
			 Vector#(2, Int#(16)) _S22i21 = min_max(pack(s21[mod*i+21]) , pack(s21[mod*i+21+mod/2]));
			 Vector#(2, Int#(16)) _S22i22 = min_max(pack(s21[mod*i+22]) , pack(s21[mod*i+22+mod/2]));
			 Vector#(2, Int#(16)) _S22i23 = min_max(pack(s21[mod*i+23]) , pack(s21[mod*i+23+mod/2]));
			 Vector#(2, Int#(16)) _S22i24 = min_max(pack(s21[mod*i+24]) , pack(s21[mod*i+24+mod/2]));
			 Vector#(2, Int#(16)) _S22i25 = min_max(pack(s21[mod*i+25]) , pack(s21[mod*i+25+mod/2]));
			 Vector#(2, Int#(16)) _S22i26 = min_max(pack(s21[mod*i+26]) , pack(s21[mod*i+26+mod/2]));
			 Vector#(2, Int#(16)) _S22i27 = min_max(pack(s21[mod*i+27]) , pack(s21[mod*i+27+mod/2]));
			 Vector#(2, Int#(16)) _S22i28 = min_max(pack(s21[mod*i+28]) , pack(s21[mod*i+28+mod/2]));
			 Vector#(2, Int#(16)) _S22i29 = min_max(pack(s21[mod*i+29]) , pack(s21[mod*i+29+mod/2]));
			 Vector#(2, Int#(16)) _S22i30 = min_max(pack(s21[mod*i+30]) , pack(s21[mod*i+30+mod/2]));
			 Vector#(2, Int#(16)) _S22i31 = min_max(pack(s21[mod*i+31]) , pack(s21[mod*i+31+mod/2]));
			 Vector#(2, Int#(16)) _S22i32 = min_max(pack(s21[mod*i+32]) , pack(s21[mod*i+32+mod/2]));
			 Vector#(2, Int#(16)) _S22i33 = min_max(pack(s21[mod*i+33]) , pack(s21[mod*i+33+mod/2]));
			 Vector#(2, Int#(16)) _S22i34 = min_max(pack(s21[mod*i+34]) , pack(s21[mod*i+34+mod/2]));
			 Vector#(2, Int#(16)) _S22i35 = min_max(pack(s21[mod*i+35]) , pack(s21[mod*i+35+mod/2]));
			 Vector#(2, Int#(16)) _S22i36 = min_max(pack(s21[mod*i+36]) , pack(s21[mod*i+36+mod/2]));
			 Vector#(2, Int#(16)) _S22i37 = min_max(pack(s21[mod*i+37]) , pack(s21[mod*i+37+mod/2]));
			 Vector#(2, Int#(16)) _S22i38 = min_max(pack(s21[mod*i+38]) , pack(s21[mod*i+38+mod/2]));
			 Vector#(2, Int#(16)) _S22i39 = min_max(pack(s21[mod*i+39]) , pack(s21[mod*i+39+mod/2]));
			 Vector#(2, Int#(16)) _S22i40 = min_max(pack(s21[mod*i+40]) , pack(s21[mod*i+40+mod/2]));
			 Vector#(2, Int#(16)) _S22i41 = min_max(pack(s21[mod*i+41]) , pack(s21[mod*i+41+mod/2]));
			 Vector#(2, Int#(16)) _S22i42 = min_max(pack(s21[mod*i+42]) , pack(s21[mod*i+42+mod/2]));
			 Vector#(2, Int#(16)) _S22i43 = min_max(pack(s21[mod*i+43]) , pack(s21[mod*i+43+mod/2]));
			 Vector#(2, Int#(16)) _S22i44 = min_max(pack(s21[mod*i+44]) , pack(s21[mod*i+44+mod/2]));
			 Vector#(2, Int#(16)) _S22i45 = min_max(pack(s21[mod*i+45]) , pack(s21[mod*i+45+mod/2]));
			 Vector#(2, Int#(16)) _S22i46 = min_max(pack(s21[mod*i+46]) , pack(s21[mod*i+46+mod/2]));
			 Vector#(2, Int#(16)) _S22i47 = min_max(pack(s21[mod*i+47]) , pack(s21[mod*i+47+mod/2]));
			 Vector#(2, Int#(16)) _S22i48 = min_max(pack(s21[mod*i+48]) , pack(s21[mod*i+48+mod/2]));
			 Vector#(2, Int#(16)) _S22i49 = min_max(pack(s21[mod*i+49]) , pack(s21[mod*i+49+mod/2]));
			 Vector#(2, Int#(16)) _S22i50 = min_max(pack(s21[mod*i+50]) , pack(s21[mod*i+50+mod/2]));
			 Vector#(2, Int#(16)) _S22i51 = min_max(pack(s21[mod*i+51]) , pack(s21[mod*i+51+mod/2]));
			 Vector#(2, Int#(16)) _S22i52 = min_max(pack(s21[mod*i+52]) , pack(s21[mod*i+52+mod/2]));
			 Vector#(2, Int#(16)) _S22i53 = min_max(pack(s21[mod*i+53]) , pack(s21[mod*i+53+mod/2]));
			 Vector#(2, Int#(16)) _S22i54 = min_max(pack(s21[mod*i+54]) , pack(s21[mod*i+54+mod/2]));
			 Vector#(2, Int#(16)) _S22i55 = min_max(pack(s21[mod*i+55]) , pack(s21[mod*i+55+mod/2]));
			 Vector#(2, Int#(16)) _S22i56 = min_max(pack(s21[mod*i+56]) , pack(s21[mod*i+56+mod/2]));
			 Vector#(2, Int#(16)) _S22i57 = min_max(pack(s21[mod*i+57]) , pack(s21[mod*i+57+mod/2]));
			 Vector#(2, Int#(16)) _S22i58 = min_max(pack(s21[mod*i+58]) , pack(s21[mod*i+58+mod/2]));
			 Vector#(2, Int#(16)) _S22i59 = min_max(pack(s21[mod*i+59]) , pack(s21[mod*i+59+mod/2]));
			 Vector#(2, Int#(16)) _S22i60 = min_max(pack(s21[mod*i+60]) , pack(s21[mod*i+60+mod/2]));
			 Vector#(2, Int#(16)) _S22i61 = min_max(pack(s21[mod*i+61]) , pack(s21[mod*i+61+mod/2]));
			 Vector#(2, Int#(16)) _S22i62 = min_max(pack(s21[mod*i+62]) , pack(s21[mod*i+62+mod/2]));
			 Vector#(2, Int#(16)) _S22i63 = min_max(pack(s21[mod*i+63]) , pack(s21[mod*i+63+mod/2]));
		if ((i/1)%2 == 0) begin
			s22[mod*i+0] <= _S22i0[0];
			s22[mod*i+0+mod/2] <= _S22i0[1];
			s22[mod*i+1] <= _S22i1[0];
			s22[mod*i+1+mod/2] <= _S22i1[1];
			s22[mod*i+2] <= _S22i2[0];
			s22[mod*i+2+mod/2] <= _S22i2[1];
			s22[mod*i+3] <= _S22i3[0];
			s22[mod*i+3+mod/2] <= _S22i3[1];
			s22[mod*i+4] <= _S22i4[0];
			s22[mod*i+4+mod/2] <= _S22i4[1];
			s22[mod*i+5] <= _S22i5[0];
			s22[mod*i+5+mod/2] <= _S22i5[1];
			s22[mod*i+6] <= _S22i6[0];
			s22[mod*i+6+mod/2] <= _S22i6[1];
			s22[mod*i+7] <= _S22i7[0];
			s22[mod*i+7+mod/2] <= _S22i7[1];
			s22[mod*i+8] <= _S22i8[0];
			s22[mod*i+8+mod/2] <= _S22i8[1];
			s22[mod*i+9] <= _S22i9[0];
			s22[mod*i+9+mod/2] <= _S22i9[1];
			s22[mod*i+10] <= _S22i10[0];
			s22[mod*i+10+mod/2] <= _S22i10[1];
			s22[mod*i+11] <= _S22i11[0];
			s22[mod*i+11+mod/2] <= _S22i11[1];
			s22[mod*i+12] <= _S22i12[0];
			s22[mod*i+12+mod/2] <= _S22i12[1];
			s22[mod*i+13] <= _S22i13[0];
			s22[mod*i+13+mod/2] <= _S22i13[1];
			s22[mod*i+14] <= _S22i14[0];
			s22[mod*i+14+mod/2] <= _S22i14[1];
			s22[mod*i+15] <= _S22i15[0];
			s22[mod*i+15+mod/2] <= _S22i15[1];
			s22[mod*i+16] <= _S22i16[0];
			s22[mod*i+16+mod/2] <= _S22i16[1];
			s22[mod*i+17] <= _S22i17[0];
			s22[mod*i+17+mod/2] <= _S22i17[1];
			s22[mod*i+18] <= _S22i18[0];
			s22[mod*i+18+mod/2] <= _S22i18[1];
			s22[mod*i+19] <= _S22i19[0];
			s22[mod*i+19+mod/2] <= _S22i19[1];
			s22[mod*i+20] <= _S22i20[0];
			s22[mod*i+20+mod/2] <= _S22i20[1];
			s22[mod*i+21] <= _S22i21[0];
			s22[mod*i+21+mod/2] <= _S22i21[1];
			s22[mod*i+22] <= _S22i22[0];
			s22[mod*i+22+mod/2] <= _S22i22[1];
			s22[mod*i+23] <= _S22i23[0];
			s22[mod*i+23+mod/2] <= _S22i23[1];
			s22[mod*i+24] <= _S22i24[0];
			s22[mod*i+24+mod/2] <= _S22i24[1];
			s22[mod*i+25] <= _S22i25[0];
			s22[mod*i+25+mod/2] <= _S22i25[1];
			s22[mod*i+26] <= _S22i26[0];
			s22[mod*i+26+mod/2] <= _S22i26[1];
			s22[mod*i+27] <= _S22i27[0];
			s22[mod*i+27+mod/2] <= _S22i27[1];
			s22[mod*i+28] <= _S22i28[0];
			s22[mod*i+28+mod/2] <= _S22i28[1];
			s22[mod*i+29] <= _S22i29[0];
			s22[mod*i+29+mod/2] <= _S22i29[1];
			s22[mod*i+30] <= _S22i30[0];
			s22[mod*i+30+mod/2] <= _S22i30[1];
			s22[mod*i+31] <= _S22i31[0];
			s22[mod*i+31+mod/2] <= _S22i31[1];
			s22[mod*i+32] <= _S22i32[0];
			s22[mod*i+32+mod/2] <= _S22i32[1];
			s22[mod*i+33] <= _S22i33[0];
			s22[mod*i+33+mod/2] <= _S22i33[1];
			s22[mod*i+34] <= _S22i34[0];
			s22[mod*i+34+mod/2] <= _S22i34[1];
			s22[mod*i+35] <= _S22i35[0];
			s22[mod*i+35+mod/2] <= _S22i35[1];
			s22[mod*i+36] <= _S22i36[0];
			s22[mod*i+36+mod/2] <= _S22i36[1];
			s22[mod*i+37] <= _S22i37[0];
			s22[mod*i+37+mod/2] <= _S22i37[1];
			s22[mod*i+38] <= _S22i38[0];
			s22[mod*i+38+mod/2] <= _S22i38[1];
			s22[mod*i+39] <= _S22i39[0];
			s22[mod*i+39+mod/2] <= _S22i39[1];
			s22[mod*i+40] <= _S22i40[0];
			s22[mod*i+40+mod/2] <= _S22i40[1];
			s22[mod*i+41] <= _S22i41[0];
			s22[mod*i+41+mod/2] <= _S22i41[1];
			s22[mod*i+42] <= _S22i42[0];
			s22[mod*i+42+mod/2] <= _S22i42[1];
			s22[mod*i+43] <= _S22i43[0];
			s22[mod*i+43+mod/2] <= _S22i43[1];
			s22[mod*i+44] <= _S22i44[0];
			s22[mod*i+44+mod/2] <= _S22i44[1];
			s22[mod*i+45] <= _S22i45[0];
			s22[mod*i+45+mod/2] <= _S22i45[1];
			s22[mod*i+46] <= _S22i46[0];
			s22[mod*i+46+mod/2] <= _S22i46[1];
			s22[mod*i+47] <= _S22i47[0];
			s22[mod*i+47+mod/2] <= _S22i47[1];
			s22[mod*i+48] <= _S22i48[0];
			s22[mod*i+48+mod/2] <= _S22i48[1];
			s22[mod*i+49] <= _S22i49[0];
			s22[mod*i+49+mod/2] <= _S22i49[1];
			s22[mod*i+50] <= _S22i50[0];
			s22[mod*i+50+mod/2] <= _S22i50[1];
			s22[mod*i+51] <= _S22i51[0];
			s22[mod*i+51+mod/2] <= _S22i51[1];
			s22[mod*i+52] <= _S22i52[0];
			s22[mod*i+52+mod/2] <= _S22i52[1];
			s22[mod*i+53] <= _S22i53[0];
			s22[mod*i+53+mod/2] <= _S22i53[1];
			s22[mod*i+54] <= _S22i54[0];
			s22[mod*i+54+mod/2] <= _S22i54[1];
			s22[mod*i+55] <= _S22i55[0];
			s22[mod*i+55+mod/2] <= _S22i55[1];
			s22[mod*i+56] <= _S22i56[0];
			s22[mod*i+56+mod/2] <= _S22i56[1];
			s22[mod*i+57] <= _S22i57[0];
			s22[mod*i+57+mod/2] <= _S22i57[1];
			s22[mod*i+58] <= _S22i58[0];
			s22[mod*i+58+mod/2] <= _S22i58[1];
			s22[mod*i+59] <= _S22i59[0];
			s22[mod*i+59+mod/2] <= _S22i59[1];
			s22[mod*i+60] <= _S22i60[0];
			s22[mod*i+60+mod/2] <= _S22i60[1];
			s22[mod*i+61] <= _S22i61[0];
			s22[mod*i+61+mod/2] <= _S22i61[1];
			s22[mod*i+62] <= _S22i62[0];
			s22[mod*i+62+mod/2] <= _S22i62[1];
			s22[mod*i+63] <= _S22i63[0];
			s22[mod*i+63+mod/2] <= _S22i63[1];
		end
		else begin
			s22[mod*i+0] <= _S22i0[1];
			s22[mod*i+0+mod/2] <= _S22i0[0];
			s22[mod*i+1] <= _S22i1[1];
			s22[mod*i+1+mod/2] <= _S22i1[0];
			s22[mod*i+2] <= _S22i2[1];
			s22[mod*i+2+mod/2] <= _S22i2[0];
			s22[mod*i+3] <= _S22i3[1];
			s22[mod*i+3+mod/2] <= _S22i3[0];
			s22[mod*i+4] <= _S22i4[1];
			s22[mod*i+4+mod/2] <= _S22i4[0];
			s22[mod*i+5] <= _S22i5[1];
			s22[mod*i+5+mod/2] <= _S22i5[0];
			s22[mod*i+6] <= _S22i6[1];
			s22[mod*i+6+mod/2] <= _S22i6[0];
			s22[mod*i+7] <= _S22i7[1];
			s22[mod*i+7+mod/2] <= _S22i7[0];
			s22[mod*i+8] <= _S22i8[1];
			s22[mod*i+8+mod/2] <= _S22i8[0];
			s22[mod*i+9] <= _S22i9[1];
			s22[mod*i+9+mod/2] <= _S22i9[0];
			s22[mod*i+10] <= _S22i10[1];
			s22[mod*i+10+mod/2] <= _S22i10[0];
			s22[mod*i+11] <= _S22i11[1];
			s22[mod*i+11+mod/2] <= _S22i11[0];
			s22[mod*i+12] <= _S22i12[1];
			s22[mod*i+12+mod/2] <= _S22i12[0];
			s22[mod*i+13] <= _S22i13[1];
			s22[mod*i+13+mod/2] <= _S22i13[0];
			s22[mod*i+14] <= _S22i14[1];
			s22[mod*i+14+mod/2] <= _S22i14[0];
			s22[mod*i+15] <= _S22i15[1];
			s22[mod*i+15+mod/2] <= _S22i15[0];
			s22[mod*i+16] <= _S22i16[1];
			s22[mod*i+16+mod/2] <= _S22i16[0];
			s22[mod*i+17] <= _S22i17[1];
			s22[mod*i+17+mod/2] <= _S22i17[0];
			s22[mod*i+18] <= _S22i18[1];
			s22[mod*i+18+mod/2] <= _S22i18[0];
			s22[mod*i+19] <= _S22i19[1];
			s22[mod*i+19+mod/2] <= _S22i19[0];
			s22[mod*i+20] <= _S22i20[1];
			s22[mod*i+20+mod/2] <= _S22i20[0];
			s22[mod*i+21] <= _S22i21[1];
			s22[mod*i+21+mod/2] <= _S22i21[0];
			s22[mod*i+22] <= _S22i22[1];
			s22[mod*i+22+mod/2] <= _S22i22[0];
			s22[mod*i+23] <= _S22i23[1];
			s22[mod*i+23+mod/2] <= _S22i23[0];
			s22[mod*i+24] <= _S22i24[1];
			s22[mod*i+24+mod/2] <= _S22i24[0];
			s22[mod*i+25] <= _S22i25[1];
			s22[mod*i+25+mod/2] <= _S22i25[0];
			s22[mod*i+26] <= _S22i26[1];
			s22[mod*i+26+mod/2] <= _S22i26[0];
			s22[mod*i+27] <= _S22i27[1];
			s22[mod*i+27+mod/2] <= _S22i27[0];
			s22[mod*i+28] <= _S22i28[1];
			s22[mod*i+28+mod/2] <= _S22i28[0];
			s22[mod*i+29] <= _S22i29[1];
			s22[mod*i+29+mod/2] <= _S22i29[0];
			s22[mod*i+30] <= _S22i30[1];
			s22[mod*i+30+mod/2] <= _S22i30[0];
			s22[mod*i+31] <= _S22i31[1];
			s22[mod*i+31+mod/2] <= _S22i31[0];
			s22[mod*i+32] <= _S22i32[1];
			s22[mod*i+32+mod/2] <= _S22i32[0];
			s22[mod*i+33] <= _S22i33[1];
			s22[mod*i+33+mod/2] <= _S22i33[0];
			s22[mod*i+34] <= _S22i34[1];
			s22[mod*i+34+mod/2] <= _S22i34[0];
			s22[mod*i+35] <= _S22i35[1];
			s22[mod*i+35+mod/2] <= _S22i35[0];
			s22[mod*i+36] <= _S22i36[1];
			s22[mod*i+36+mod/2] <= _S22i36[0];
			s22[mod*i+37] <= _S22i37[1];
			s22[mod*i+37+mod/2] <= _S22i37[0];
			s22[mod*i+38] <= _S22i38[1];
			s22[mod*i+38+mod/2] <= _S22i38[0];
			s22[mod*i+39] <= _S22i39[1];
			s22[mod*i+39+mod/2] <= _S22i39[0];
			s22[mod*i+40] <= _S22i40[1];
			s22[mod*i+40+mod/2] <= _S22i40[0];
			s22[mod*i+41] <= _S22i41[1];
			s22[mod*i+41+mod/2] <= _S22i41[0];
			s22[mod*i+42] <= _S22i42[1];
			s22[mod*i+42+mod/2] <= _S22i42[0];
			s22[mod*i+43] <= _S22i43[1];
			s22[mod*i+43+mod/2] <= _S22i43[0];
			s22[mod*i+44] <= _S22i44[1];
			s22[mod*i+44+mod/2] <= _S22i44[0];
			s22[mod*i+45] <= _S22i45[1];
			s22[mod*i+45+mod/2] <= _S22i45[0];
			s22[mod*i+46] <= _S22i46[1];
			s22[mod*i+46+mod/2] <= _S22i46[0];
			s22[mod*i+47] <= _S22i47[1];
			s22[mod*i+47+mod/2] <= _S22i47[0];
			s22[mod*i+48] <= _S22i48[1];
			s22[mod*i+48+mod/2] <= _S22i48[0];
			s22[mod*i+49] <= _S22i49[1];
			s22[mod*i+49+mod/2] <= _S22i49[0];
			s22[mod*i+50] <= _S22i50[1];
			s22[mod*i+50+mod/2] <= _S22i50[0];
			s22[mod*i+51] <= _S22i51[1];
			s22[mod*i+51+mod/2] <= _S22i51[0];
			s22[mod*i+52] <= _S22i52[1];
			s22[mod*i+52+mod/2] <= _S22i52[0];
			s22[mod*i+53] <= _S22i53[1];
			s22[mod*i+53+mod/2] <= _S22i53[0];
			s22[mod*i+54] <= _S22i54[1];
			s22[mod*i+54+mod/2] <= _S22i54[0];
			s22[mod*i+55] <= _S22i55[1];
			s22[mod*i+55+mod/2] <= _S22i55[0];
			s22[mod*i+56] <= _S22i56[1];
			s22[mod*i+56+mod/2] <= _S22i56[0];
			s22[mod*i+57] <= _S22i57[1];
			s22[mod*i+57+mod/2] <= _S22i57[0];
			s22[mod*i+58] <= _S22i58[1];
			s22[mod*i+58+mod/2] <= _S22i58[0];
			s22[mod*i+59] <= _S22i59[1];
			s22[mod*i+59+mod/2] <= _S22i59[0];
			s22[mod*i+60] <= _S22i60[1];
			s22[mod*i+60+mod/2] <= _S22i60[0];
			s22[mod*i+61] <= _S22i61[1];
			s22[mod*i+61+mod/2] <= _S22i61[0];
			s22[mod*i+62] <= _S22i62[1];
			s22[mod*i+62+mod/2] <= _S22i62[0];
			s22[mod*i+63] <= _S22i63[1];
			s22[mod*i+63+mod/2] <= _S22i63[0];
		end
	end
	p22.enq(1);
endrule
rule _Q66;
	p22.deq;
	let mod = 64;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S23i0 = min_max(pack(s22[mod*i+0]) , pack(s22[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S23i1 = min_max(pack(s22[mod*i+1]) , pack(s22[mod*i+1+mod/2]));
			 Vector#(2, Int#(16)) _S23i2 = min_max(pack(s22[mod*i+2]) , pack(s22[mod*i+2+mod/2]));
			 Vector#(2, Int#(16)) _S23i3 = min_max(pack(s22[mod*i+3]) , pack(s22[mod*i+3+mod/2]));
			 Vector#(2, Int#(16)) _S23i4 = min_max(pack(s22[mod*i+4]) , pack(s22[mod*i+4+mod/2]));
			 Vector#(2, Int#(16)) _S23i5 = min_max(pack(s22[mod*i+5]) , pack(s22[mod*i+5+mod/2]));
			 Vector#(2, Int#(16)) _S23i6 = min_max(pack(s22[mod*i+6]) , pack(s22[mod*i+6+mod/2]));
			 Vector#(2, Int#(16)) _S23i7 = min_max(pack(s22[mod*i+7]) , pack(s22[mod*i+7+mod/2]));
			 Vector#(2, Int#(16)) _S23i8 = min_max(pack(s22[mod*i+8]) , pack(s22[mod*i+8+mod/2]));
			 Vector#(2, Int#(16)) _S23i9 = min_max(pack(s22[mod*i+9]) , pack(s22[mod*i+9+mod/2]));
			 Vector#(2, Int#(16)) _S23i10 = min_max(pack(s22[mod*i+10]) , pack(s22[mod*i+10+mod/2]));
			 Vector#(2, Int#(16)) _S23i11 = min_max(pack(s22[mod*i+11]) , pack(s22[mod*i+11+mod/2]));
			 Vector#(2, Int#(16)) _S23i12 = min_max(pack(s22[mod*i+12]) , pack(s22[mod*i+12+mod/2]));
			 Vector#(2, Int#(16)) _S23i13 = min_max(pack(s22[mod*i+13]) , pack(s22[mod*i+13+mod/2]));
			 Vector#(2, Int#(16)) _S23i14 = min_max(pack(s22[mod*i+14]) , pack(s22[mod*i+14+mod/2]));
			 Vector#(2, Int#(16)) _S23i15 = min_max(pack(s22[mod*i+15]) , pack(s22[mod*i+15+mod/2]));
			 Vector#(2, Int#(16)) _S23i16 = min_max(pack(s22[mod*i+16]) , pack(s22[mod*i+16+mod/2]));
			 Vector#(2, Int#(16)) _S23i17 = min_max(pack(s22[mod*i+17]) , pack(s22[mod*i+17+mod/2]));
			 Vector#(2, Int#(16)) _S23i18 = min_max(pack(s22[mod*i+18]) , pack(s22[mod*i+18+mod/2]));
			 Vector#(2, Int#(16)) _S23i19 = min_max(pack(s22[mod*i+19]) , pack(s22[mod*i+19+mod/2]));
			 Vector#(2, Int#(16)) _S23i20 = min_max(pack(s22[mod*i+20]) , pack(s22[mod*i+20+mod/2]));
			 Vector#(2, Int#(16)) _S23i21 = min_max(pack(s22[mod*i+21]) , pack(s22[mod*i+21+mod/2]));
			 Vector#(2, Int#(16)) _S23i22 = min_max(pack(s22[mod*i+22]) , pack(s22[mod*i+22+mod/2]));
			 Vector#(2, Int#(16)) _S23i23 = min_max(pack(s22[mod*i+23]) , pack(s22[mod*i+23+mod/2]));
			 Vector#(2, Int#(16)) _S23i24 = min_max(pack(s22[mod*i+24]) , pack(s22[mod*i+24+mod/2]));
			 Vector#(2, Int#(16)) _S23i25 = min_max(pack(s22[mod*i+25]) , pack(s22[mod*i+25+mod/2]));
			 Vector#(2, Int#(16)) _S23i26 = min_max(pack(s22[mod*i+26]) , pack(s22[mod*i+26+mod/2]));
			 Vector#(2, Int#(16)) _S23i27 = min_max(pack(s22[mod*i+27]) , pack(s22[mod*i+27+mod/2]));
			 Vector#(2, Int#(16)) _S23i28 = min_max(pack(s22[mod*i+28]) , pack(s22[mod*i+28+mod/2]));
			 Vector#(2, Int#(16)) _S23i29 = min_max(pack(s22[mod*i+29]) , pack(s22[mod*i+29+mod/2]));
			 Vector#(2, Int#(16)) _S23i30 = min_max(pack(s22[mod*i+30]) , pack(s22[mod*i+30+mod/2]));
			 Vector#(2, Int#(16)) _S23i31 = min_max(pack(s22[mod*i+31]) , pack(s22[mod*i+31+mod/2]));
		if ((i/2)%2 == 0) begin
			s23[mod*i+0] <= _S23i0[0];
			s23[mod*i+0+mod/2] <= _S23i0[1];
			s23[mod*i+1] <= _S23i1[0];
			s23[mod*i+1+mod/2] <= _S23i1[1];
			s23[mod*i+2] <= _S23i2[0];
			s23[mod*i+2+mod/2] <= _S23i2[1];
			s23[mod*i+3] <= _S23i3[0];
			s23[mod*i+3+mod/2] <= _S23i3[1];
			s23[mod*i+4] <= _S23i4[0];
			s23[mod*i+4+mod/2] <= _S23i4[1];
			s23[mod*i+5] <= _S23i5[0];
			s23[mod*i+5+mod/2] <= _S23i5[1];
			s23[mod*i+6] <= _S23i6[0];
			s23[mod*i+6+mod/2] <= _S23i6[1];
			s23[mod*i+7] <= _S23i7[0];
			s23[mod*i+7+mod/2] <= _S23i7[1];
			s23[mod*i+8] <= _S23i8[0];
			s23[mod*i+8+mod/2] <= _S23i8[1];
			s23[mod*i+9] <= _S23i9[0];
			s23[mod*i+9+mod/2] <= _S23i9[1];
			s23[mod*i+10] <= _S23i10[0];
			s23[mod*i+10+mod/2] <= _S23i10[1];
			s23[mod*i+11] <= _S23i11[0];
			s23[mod*i+11+mod/2] <= _S23i11[1];
			s23[mod*i+12] <= _S23i12[0];
			s23[mod*i+12+mod/2] <= _S23i12[1];
			s23[mod*i+13] <= _S23i13[0];
			s23[mod*i+13+mod/2] <= _S23i13[1];
			s23[mod*i+14] <= _S23i14[0];
			s23[mod*i+14+mod/2] <= _S23i14[1];
			s23[mod*i+15] <= _S23i15[0];
			s23[mod*i+15+mod/2] <= _S23i15[1];
			s23[mod*i+16] <= _S23i16[0];
			s23[mod*i+16+mod/2] <= _S23i16[1];
			s23[mod*i+17] <= _S23i17[0];
			s23[mod*i+17+mod/2] <= _S23i17[1];
			s23[mod*i+18] <= _S23i18[0];
			s23[mod*i+18+mod/2] <= _S23i18[1];
			s23[mod*i+19] <= _S23i19[0];
			s23[mod*i+19+mod/2] <= _S23i19[1];
			s23[mod*i+20] <= _S23i20[0];
			s23[mod*i+20+mod/2] <= _S23i20[1];
			s23[mod*i+21] <= _S23i21[0];
			s23[mod*i+21+mod/2] <= _S23i21[1];
			s23[mod*i+22] <= _S23i22[0];
			s23[mod*i+22+mod/2] <= _S23i22[1];
			s23[mod*i+23] <= _S23i23[0];
			s23[mod*i+23+mod/2] <= _S23i23[1];
			s23[mod*i+24] <= _S23i24[0];
			s23[mod*i+24+mod/2] <= _S23i24[1];
			s23[mod*i+25] <= _S23i25[0];
			s23[mod*i+25+mod/2] <= _S23i25[1];
			s23[mod*i+26] <= _S23i26[0];
			s23[mod*i+26+mod/2] <= _S23i26[1];
			s23[mod*i+27] <= _S23i27[0];
			s23[mod*i+27+mod/2] <= _S23i27[1];
			s23[mod*i+28] <= _S23i28[0];
			s23[mod*i+28+mod/2] <= _S23i28[1];
			s23[mod*i+29] <= _S23i29[0];
			s23[mod*i+29+mod/2] <= _S23i29[1];
			s23[mod*i+30] <= _S23i30[0];
			s23[mod*i+30+mod/2] <= _S23i30[1];
			s23[mod*i+31] <= _S23i31[0];
			s23[mod*i+31+mod/2] <= _S23i31[1];
		end
		else begin
			s23[mod*i+0] <= _S23i0[1];
			s23[mod*i+0+mod/2] <= _S23i0[0];
			s23[mod*i+1] <= _S23i1[1];
			s23[mod*i+1+mod/2] <= _S23i1[0];
			s23[mod*i+2] <= _S23i2[1];
			s23[mod*i+2+mod/2] <= _S23i2[0];
			s23[mod*i+3] <= _S23i3[1];
			s23[mod*i+3+mod/2] <= _S23i3[0];
			s23[mod*i+4] <= _S23i4[1];
			s23[mod*i+4+mod/2] <= _S23i4[0];
			s23[mod*i+5] <= _S23i5[1];
			s23[mod*i+5+mod/2] <= _S23i5[0];
			s23[mod*i+6] <= _S23i6[1];
			s23[mod*i+6+mod/2] <= _S23i6[0];
			s23[mod*i+7] <= _S23i7[1];
			s23[mod*i+7+mod/2] <= _S23i7[0];
			s23[mod*i+8] <= _S23i8[1];
			s23[mod*i+8+mod/2] <= _S23i8[0];
			s23[mod*i+9] <= _S23i9[1];
			s23[mod*i+9+mod/2] <= _S23i9[0];
			s23[mod*i+10] <= _S23i10[1];
			s23[mod*i+10+mod/2] <= _S23i10[0];
			s23[mod*i+11] <= _S23i11[1];
			s23[mod*i+11+mod/2] <= _S23i11[0];
			s23[mod*i+12] <= _S23i12[1];
			s23[mod*i+12+mod/2] <= _S23i12[0];
			s23[mod*i+13] <= _S23i13[1];
			s23[mod*i+13+mod/2] <= _S23i13[0];
			s23[mod*i+14] <= _S23i14[1];
			s23[mod*i+14+mod/2] <= _S23i14[0];
			s23[mod*i+15] <= _S23i15[1];
			s23[mod*i+15+mod/2] <= _S23i15[0];
			s23[mod*i+16] <= _S23i16[1];
			s23[mod*i+16+mod/2] <= _S23i16[0];
			s23[mod*i+17] <= _S23i17[1];
			s23[mod*i+17+mod/2] <= _S23i17[0];
			s23[mod*i+18] <= _S23i18[1];
			s23[mod*i+18+mod/2] <= _S23i18[0];
			s23[mod*i+19] <= _S23i19[1];
			s23[mod*i+19+mod/2] <= _S23i19[0];
			s23[mod*i+20] <= _S23i20[1];
			s23[mod*i+20+mod/2] <= _S23i20[0];
			s23[mod*i+21] <= _S23i21[1];
			s23[mod*i+21+mod/2] <= _S23i21[0];
			s23[mod*i+22] <= _S23i22[1];
			s23[mod*i+22+mod/2] <= _S23i22[0];
			s23[mod*i+23] <= _S23i23[1];
			s23[mod*i+23+mod/2] <= _S23i23[0];
			s23[mod*i+24] <= _S23i24[1];
			s23[mod*i+24+mod/2] <= _S23i24[0];
			s23[mod*i+25] <= _S23i25[1];
			s23[mod*i+25+mod/2] <= _S23i25[0];
			s23[mod*i+26] <= _S23i26[1];
			s23[mod*i+26+mod/2] <= _S23i26[0];
			s23[mod*i+27] <= _S23i27[1];
			s23[mod*i+27+mod/2] <= _S23i27[0];
			s23[mod*i+28] <= _S23i28[1];
			s23[mod*i+28+mod/2] <= _S23i28[0];
			s23[mod*i+29] <= _S23i29[1];
			s23[mod*i+29+mod/2] <= _S23i29[0];
			s23[mod*i+30] <= _S23i30[1];
			s23[mod*i+30+mod/2] <= _S23i30[0];
			s23[mod*i+31] <= _S23i31[1];
			s23[mod*i+31+mod/2] <= _S23i31[0];
		end
	end
	p23.enq(1);
endrule
rule _Q65;
	p23.deq;
	let mod = 32;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S24i0 = min_max(pack(s23[mod*i+0]) , pack(s23[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S24i1 = min_max(pack(s23[mod*i+1]) , pack(s23[mod*i+1+mod/2]));
			 Vector#(2, Int#(16)) _S24i2 = min_max(pack(s23[mod*i+2]) , pack(s23[mod*i+2+mod/2]));
			 Vector#(2, Int#(16)) _S24i3 = min_max(pack(s23[mod*i+3]) , pack(s23[mod*i+3+mod/2]));
			 Vector#(2, Int#(16)) _S24i4 = min_max(pack(s23[mod*i+4]) , pack(s23[mod*i+4+mod/2]));
			 Vector#(2, Int#(16)) _S24i5 = min_max(pack(s23[mod*i+5]) , pack(s23[mod*i+5+mod/2]));
			 Vector#(2, Int#(16)) _S24i6 = min_max(pack(s23[mod*i+6]) , pack(s23[mod*i+6+mod/2]));
			 Vector#(2, Int#(16)) _S24i7 = min_max(pack(s23[mod*i+7]) , pack(s23[mod*i+7+mod/2]));
			 Vector#(2, Int#(16)) _S24i8 = min_max(pack(s23[mod*i+8]) , pack(s23[mod*i+8+mod/2]));
			 Vector#(2, Int#(16)) _S24i9 = min_max(pack(s23[mod*i+9]) , pack(s23[mod*i+9+mod/2]));
			 Vector#(2, Int#(16)) _S24i10 = min_max(pack(s23[mod*i+10]) , pack(s23[mod*i+10+mod/2]));
			 Vector#(2, Int#(16)) _S24i11 = min_max(pack(s23[mod*i+11]) , pack(s23[mod*i+11+mod/2]));
			 Vector#(2, Int#(16)) _S24i12 = min_max(pack(s23[mod*i+12]) , pack(s23[mod*i+12+mod/2]));
			 Vector#(2, Int#(16)) _S24i13 = min_max(pack(s23[mod*i+13]) , pack(s23[mod*i+13+mod/2]));
			 Vector#(2, Int#(16)) _S24i14 = min_max(pack(s23[mod*i+14]) , pack(s23[mod*i+14+mod/2]));
			 Vector#(2, Int#(16)) _S24i15 = min_max(pack(s23[mod*i+15]) , pack(s23[mod*i+15+mod/2]));
		if ((i/4)%2 == 0) begin
			s24[mod*i+0] <= _S24i0[0];
			s24[mod*i+0+mod/2] <= _S24i0[1];
			s24[mod*i+1] <= _S24i1[0];
			s24[mod*i+1+mod/2] <= _S24i1[1];
			s24[mod*i+2] <= _S24i2[0];
			s24[mod*i+2+mod/2] <= _S24i2[1];
			s24[mod*i+3] <= _S24i3[0];
			s24[mod*i+3+mod/2] <= _S24i3[1];
			s24[mod*i+4] <= _S24i4[0];
			s24[mod*i+4+mod/2] <= _S24i4[1];
			s24[mod*i+5] <= _S24i5[0];
			s24[mod*i+5+mod/2] <= _S24i5[1];
			s24[mod*i+6] <= _S24i6[0];
			s24[mod*i+6+mod/2] <= _S24i6[1];
			s24[mod*i+7] <= _S24i7[0];
			s24[mod*i+7+mod/2] <= _S24i7[1];
			s24[mod*i+8] <= _S24i8[0];
			s24[mod*i+8+mod/2] <= _S24i8[1];
			s24[mod*i+9] <= _S24i9[0];
			s24[mod*i+9+mod/2] <= _S24i9[1];
			s24[mod*i+10] <= _S24i10[0];
			s24[mod*i+10+mod/2] <= _S24i10[1];
			s24[mod*i+11] <= _S24i11[0];
			s24[mod*i+11+mod/2] <= _S24i11[1];
			s24[mod*i+12] <= _S24i12[0];
			s24[mod*i+12+mod/2] <= _S24i12[1];
			s24[mod*i+13] <= _S24i13[0];
			s24[mod*i+13+mod/2] <= _S24i13[1];
			s24[mod*i+14] <= _S24i14[0];
			s24[mod*i+14+mod/2] <= _S24i14[1];
			s24[mod*i+15] <= _S24i15[0];
			s24[mod*i+15+mod/2] <= _S24i15[1];
		end
		else begin
			s24[mod*i+0] <= _S24i0[1];
			s24[mod*i+0+mod/2] <= _S24i0[0];
			s24[mod*i+1] <= _S24i1[1];
			s24[mod*i+1+mod/2] <= _S24i1[0];
			s24[mod*i+2] <= _S24i2[1];
			s24[mod*i+2+mod/2] <= _S24i2[0];
			s24[mod*i+3] <= _S24i3[1];
			s24[mod*i+3+mod/2] <= _S24i3[0];
			s24[mod*i+4] <= _S24i4[1];
			s24[mod*i+4+mod/2] <= _S24i4[0];
			s24[mod*i+5] <= _S24i5[1];
			s24[mod*i+5+mod/2] <= _S24i5[0];
			s24[mod*i+6] <= _S24i6[1];
			s24[mod*i+6+mod/2] <= _S24i6[0];
			s24[mod*i+7] <= _S24i7[1];
			s24[mod*i+7+mod/2] <= _S24i7[0];
			s24[mod*i+8] <= _S24i8[1];
			s24[mod*i+8+mod/2] <= _S24i8[0];
			s24[mod*i+9] <= _S24i9[1];
			s24[mod*i+9+mod/2] <= _S24i9[0];
			s24[mod*i+10] <= _S24i10[1];
			s24[mod*i+10+mod/2] <= _S24i10[0];
			s24[mod*i+11] <= _S24i11[1];
			s24[mod*i+11+mod/2] <= _S24i11[0];
			s24[mod*i+12] <= _S24i12[1];
			s24[mod*i+12+mod/2] <= _S24i12[0];
			s24[mod*i+13] <= _S24i13[1];
			s24[mod*i+13+mod/2] <= _S24i13[0];
			s24[mod*i+14] <= _S24i14[1];
			s24[mod*i+14+mod/2] <= _S24i14[0];
			s24[mod*i+15] <= _S24i15[1];
			s24[mod*i+15+mod/2] <= _S24i15[0];
		end
	end
	p24.enq(1);
endrule
rule _Q64;
	p24.deq;
	let mod = 16;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S25i0 = min_max(pack(s24[mod*i+0]) , pack(s24[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S25i1 = min_max(pack(s24[mod*i+1]) , pack(s24[mod*i+1+mod/2]));
			 Vector#(2, Int#(16)) _S25i2 = min_max(pack(s24[mod*i+2]) , pack(s24[mod*i+2+mod/2]));
			 Vector#(2, Int#(16)) _S25i3 = min_max(pack(s24[mod*i+3]) , pack(s24[mod*i+3+mod/2]));
			 Vector#(2, Int#(16)) _S25i4 = min_max(pack(s24[mod*i+4]) , pack(s24[mod*i+4+mod/2]));
			 Vector#(2, Int#(16)) _S25i5 = min_max(pack(s24[mod*i+5]) , pack(s24[mod*i+5+mod/2]));
			 Vector#(2, Int#(16)) _S25i6 = min_max(pack(s24[mod*i+6]) , pack(s24[mod*i+6+mod/2]));
			 Vector#(2, Int#(16)) _S25i7 = min_max(pack(s24[mod*i+7]) , pack(s24[mod*i+7+mod/2]));
		if ((i/8)%2 == 0) begin
			s25[mod*i+0] <= _S25i0[0];
			s25[mod*i+0+mod/2] <= _S25i0[1];
			s25[mod*i+1] <= _S25i1[0];
			s25[mod*i+1+mod/2] <= _S25i1[1];
			s25[mod*i+2] <= _S25i2[0];
			s25[mod*i+2+mod/2] <= _S25i2[1];
			s25[mod*i+3] <= _S25i3[0];
			s25[mod*i+3+mod/2] <= _S25i3[1];
			s25[mod*i+4] <= _S25i4[0];
			s25[mod*i+4+mod/2] <= _S25i4[1];
			s25[mod*i+5] <= _S25i5[0];
			s25[mod*i+5+mod/2] <= _S25i5[1];
			s25[mod*i+6] <= _S25i6[0];
			s25[mod*i+6+mod/2] <= _S25i6[1];
			s25[mod*i+7] <= _S25i7[0];
			s25[mod*i+7+mod/2] <= _S25i7[1];
		end
		else begin
			s25[mod*i+0] <= _S25i0[1];
			s25[mod*i+0+mod/2] <= _S25i0[0];
			s25[mod*i+1] <= _S25i1[1];
			s25[mod*i+1+mod/2] <= _S25i1[0];
			s25[mod*i+2] <= _S25i2[1];
			s25[mod*i+2+mod/2] <= _S25i2[0];
			s25[mod*i+3] <= _S25i3[1];
			s25[mod*i+3+mod/2] <= _S25i3[0];
			s25[mod*i+4] <= _S25i4[1];
			s25[mod*i+4+mod/2] <= _S25i4[0];
			s25[mod*i+5] <= _S25i5[1];
			s25[mod*i+5+mod/2] <= _S25i5[0];
			s25[mod*i+6] <= _S25i6[1];
			s25[mod*i+6+mod/2] <= _S25i6[0];
			s25[mod*i+7] <= _S25i7[1];
			s25[mod*i+7+mod/2] <= _S25i7[0];
		end
	end
	p25.enq(1);
endrule
rule _Q63;
	p25.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S26i0 = min_max(pack(s25[mod*i+0]) , pack(s25[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S26i1 = min_max(pack(s25[mod*i+1]) , pack(s25[mod*i+1+mod/2]));
			 Vector#(2, Int#(16)) _S26i2 = min_max(pack(s25[mod*i+2]) , pack(s25[mod*i+2+mod/2]));
			 Vector#(2, Int#(16)) _S26i3 = min_max(pack(s25[mod*i+3]) , pack(s25[mod*i+3+mod/2]));
		if ((i/16)%2 == 0) begin
			s26[mod*i+0] <= _S26i0[0];
			s26[mod*i+0+mod/2] <= _S26i0[1];
			s26[mod*i+1] <= _S26i1[0];
			s26[mod*i+1+mod/2] <= _S26i1[1];
			s26[mod*i+2] <= _S26i2[0];
			s26[mod*i+2+mod/2] <= _S26i2[1];
			s26[mod*i+3] <= _S26i3[0];
			s26[mod*i+3+mod/2] <= _S26i3[1];
		end
		else begin
			s26[mod*i+0] <= _S26i0[1];
			s26[mod*i+0+mod/2] <= _S26i0[0];
			s26[mod*i+1] <= _S26i1[1];
			s26[mod*i+1+mod/2] <= _S26i1[0];
			s26[mod*i+2] <= _S26i2[1];
			s26[mod*i+2+mod/2] <= _S26i2[0];
			s26[mod*i+3] <= _S26i3[1];
			s26[mod*i+3+mod/2] <= _S26i3[0];
		end
	end
	p26.enq(1);
endrule
rule _Q62;
	p26.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S27i0 = min_max(pack(s26[mod*i+0]) , pack(s26[mod*i+0+mod/2]));
			 Vector#(2, Int#(16)) _S27i1 = min_max(pack(s26[mod*i+1]) , pack(s26[mod*i+1+mod/2]));
		if ((i/32)%2 == 0) begin
			s27[mod*i+0] <= _S27i0[0];
			s27[mod*i+0+mod/2] <= _S27i0[1];
			s27[mod*i+1] <= _S27i1[0];
			s27[mod*i+1+mod/2] <= _S27i1[1];
		end
		else begin
			s27[mod*i+0] <= _S27i0[1];
			s27[mod*i+0+mod/2] <= _S27i0[0];
			s27[mod*i+1] <= _S27i1[1];
			s27[mod*i+1+mod/2] <= _S27i1[0];
		end
	end
	p27.enq(1);
endrule
rule _Q61;
	p27.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
			 Vector#(2, Int#(16)) _S28i0 = min_max(pack(s27[mod*i+0]) , pack(s27[mod*i+0+mod/2]));
		if ((i/64)%2 == 0) begin
			s28[mod*i+0] <= _S28i0[0];
			s28[mod*i+0+mod/2] <= _S28i0[1];
		end
		else begin
			s28[mod*i+0] <= _S28i0[1];
			s28[mod*i+0+mod/2] <= _S28i0[0];
		end
	end
	p28.enq(1);
endrule

method Action put(Vector#(L0, Int#(16)) datas);
for(int i=0;i<L0;i=i+1)
s0[i] <= datas[i];
p0.enq(1);
endmethod

method ActionValue#(Vector#(L0, Int#(16))) get;
p28.deq;
Vector#(L0,Int#(16)) r = newVector;
for(int i=0; i<L0; i = i + 1)
r[i] = s28[i];
return r;
endmethod
endmodule
endpackage
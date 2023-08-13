package bitonic;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;
#define L0 64

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
rule _Q34;
	p6.deq;
	let mod = 16;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			s7[mod*i+0] <= min(s6[mod*i+0] , s6[mod*i+0+mod/2]);
			s7[mod*i+0+mod/2] <= max(s6[mod*i+0] , s6[mod*i+0+mod/2]);
			s7[mod*i+1] <= min(s6[mod*i+1] , s6[mod*i+1+mod/2]);
			s7[mod*i+1+mod/2] <= max(s6[mod*i+1] , s6[mod*i+1+mod/2]);
			s7[mod*i+2] <= min(s6[mod*i+2] , s6[mod*i+2+mod/2]);
			s7[mod*i+2+mod/2] <= max(s6[mod*i+2] , s6[mod*i+2+mod/2]);
			s7[mod*i+3] <= min(s6[mod*i+3] , s6[mod*i+3+mod/2]);
			s7[mod*i+3+mod/2] <= max(s6[mod*i+3] , s6[mod*i+3+mod/2]);
			s7[mod*i+4] <= min(s6[mod*i+4] , s6[mod*i+4+mod/2]);
			s7[mod*i+4+mod/2] <= max(s6[mod*i+4] , s6[mod*i+4+mod/2]);
			s7[mod*i+5] <= min(s6[mod*i+5] , s6[mod*i+5+mod/2]);
			s7[mod*i+5+mod/2] <= max(s6[mod*i+5] , s6[mod*i+5+mod/2]);
			s7[mod*i+6] <= min(s6[mod*i+6] , s6[mod*i+6+mod/2]);
			s7[mod*i+6+mod/2] <= max(s6[mod*i+6] , s6[mod*i+6+mod/2]);
			s7[mod*i+7] <= min(s6[mod*i+7] , s6[mod*i+7+mod/2]);
			s7[mod*i+7+mod/2] <= max(s6[mod*i+7] , s6[mod*i+7+mod/2]);
		end
		else begin
			s7[mod*i+0] <= max(s6[mod*i+0] , s6[mod*i+0+mod/2]);
			s7[mod*i+0+mod/2] <= min(s6[mod*i+0] , s6[mod*i+0+mod/2]);
			s7[mod*i+1] <= max(s6[mod*i+1] , s6[mod*i+1+mod/2]);
			s7[mod*i+1+mod/2] <= min(s6[mod*i+1] , s6[mod*i+1+mod/2]);
			s7[mod*i+2] <= max(s6[mod*i+2] , s6[mod*i+2+mod/2]);
			s7[mod*i+2+mod/2] <= min(s6[mod*i+2] , s6[mod*i+2+mod/2]);
			s7[mod*i+3] <= max(s6[mod*i+3] , s6[mod*i+3+mod/2]);
			s7[mod*i+3+mod/2] <= min(s6[mod*i+3] , s6[mod*i+3+mod/2]);
			s7[mod*i+4] <= max(s6[mod*i+4] , s6[mod*i+4+mod/2]);
			s7[mod*i+4+mod/2] <= min(s6[mod*i+4] , s6[mod*i+4+mod/2]);
			s7[mod*i+5] <= max(s6[mod*i+5] , s6[mod*i+5+mod/2]);
			s7[mod*i+5+mod/2] <= min(s6[mod*i+5] , s6[mod*i+5+mod/2]);
			s7[mod*i+6] <= max(s6[mod*i+6] , s6[mod*i+6+mod/2]);
			s7[mod*i+6+mod/2] <= min(s6[mod*i+6] , s6[mod*i+6+mod/2]);
			s7[mod*i+7] <= max(s6[mod*i+7] , s6[mod*i+7+mod/2]);
			s7[mod*i+7+mod/2] <= min(s6[mod*i+7] , s6[mod*i+7+mod/2]);
		end
	end
	p7.enq(1);
endrule
rule _Q33;
	p7.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			s8[mod*i+0] <= min(s7[mod*i+0] , s7[mod*i+0+mod/2]);
			s8[mod*i+0+mod/2] <= max(s7[mod*i+0] , s7[mod*i+0+mod/2]);
			s8[mod*i+1] <= min(s7[mod*i+1] , s7[mod*i+1+mod/2]);
			s8[mod*i+1+mod/2] <= max(s7[mod*i+1] , s7[mod*i+1+mod/2]);
			s8[mod*i+2] <= min(s7[mod*i+2] , s7[mod*i+2+mod/2]);
			s8[mod*i+2+mod/2] <= max(s7[mod*i+2] , s7[mod*i+2+mod/2]);
			s8[mod*i+3] <= min(s7[mod*i+3] , s7[mod*i+3+mod/2]);
			s8[mod*i+3+mod/2] <= max(s7[mod*i+3] , s7[mod*i+3+mod/2]);
		end
		else begin
			s8[mod*i+0] <= max(s7[mod*i+0] , s7[mod*i+0+mod/2]);
			s8[mod*i+0+mod/2] <= min(s7[mod*i+0] , s7[mod*i+0+mod/2]);
			s8[mod*i+1] <= max(s7[mod*i+1] , s7[mod*i+1+mod/2]);
			s8[mod*i+1+mod/2] <= min(s7[mod*i+1] , s7[mod*i+1+mod/2]);
			s8[mod*i+2] <= max(s7[mod*i+2] , s7[mod*i+2+mod/2]);
			s8[mod*i+2+mod/2] <= min(s7[mod*i+2] , s7[mod*i+2+mod/2]);
			s8[mod*i+3] <= max(s7[mod*i+3] , s7[mod*i+3+mod/2]);
			s8[mod*i+3+mod/2] <= min(s7[mod*i+3] , s7[mod*i+3+mod/2]);
		end
	end
	p8.enq(1);
endrule
rule _Q32;
	p8.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/4)%2 == 0) begin
			s9[mod*i+0] <= min(s8[mod*i+0] , s8[mod*i+0+mod/2]);
			s9[mod*i+0+mod/2] <= max(s8[mod*i+0] , s8[mod*i+0+mod/2]);
			s9[mod*i+1] <= min(s8[mod*i+1] , s8[mod*i+1+mod/2]);
			s9[mod*i+1+mod/2] <= max(s8[mod*i+1] , s8[mod*i+1+mod/2]);
		end
		else begin
			s9[mod*i+0] <= max(s8[mod*i+0] , s8[mod*i+0+mod/2]);
			s9[mod*i+0+mod/2] <= min(s8[mod*i+0] , s8[mod*i+0+mod/2]);
			s9[mod*i+1] <= max(s8[mod*i+1] , s8[mod*i+1+mod/2]);
			s9[mod*i+1+mod/2] <= min(s8[mod*i+1] , s8[mod*i+1+mod/2]);
		end
	end
	p9.enq(1);
endrule
rule _Q31;
	p9.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/8)%2 == 0) begin
			s10[mod*i+0] <= min(s9[mod*i+0] , s9[mod*i+0+mod/2]);
			s10[mod*i+0+mod/2] <= max(s9[mod*i+0] , s9[mod*i+0+mod/2]);
		end
		else begin
			s10[mod*i+0] <= max(s9[mod*i+0] , s9[mod*i+0+mod/2]);
			s10[mod*i+0+mod/2] <= min(s9[mod*i+0] , s9[mod*i+0+mod/2]);
		end
	end
	p10.enq(1);
endrule
rule _Q45;
	p10.deq;
	let mod = 32;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			s11[mod*i+0] <= min(s10[mod*i+0] , s10[mod*i+0+mod/2]);
			s11[mod*i+0+mod/2] <= max(s10[mod*i+0] , s10[mod*i+0+mod/2]);
			s11[mod*i+1] <= min(s10[mod*i+1] , s10[mod*i+1+mod/2]);
			s11[mod*i+1+mod/2] <= max(s10[mod*i+1] , s10[mod*i+1+mod/2]);
			s11[mod*i+2] <= min(s10[mod*i+2] , s10[mod*i+2+mod/2]);
			s11[mod*i+2+mod/2] <= max(s10[mod*i+2] , s10[mod*i+2+mod/2]);
			s11[mod*i+3] <= min(s10[mod*i+3] , s10[mod*i+3+mod/2]);
			s11[mod*i+3+mod/2] <= max(s10[mod*i+3] , s10[mod*i+3+mod/2]);
			s11[mod*i+4] <= min(s10[mod*i+4] , s10[mod*i+4+mod/2]);
			s11[mod*i+4+mod/2] <= max(s10[mod*i+4] , s10[mod*i+4+mod/2]);
			s11[mod*i+5] <= min(s10[mod*i+5] , s10[mod*i+5+mod/2]);
			s11[mod*i+5+mod/2] <= max(s10[mod*i+5] , s10[mod*i+5+mod/2]);
			s11[mod*i+6] <= min(s10[mod*i+6] , s10[mod*i+6+mod/2]);
			s11[mod*i+6+mod/2] <= max(s10[mod*i+6] , s10[mod*i+6+mod/2]);
			s11[mod*i+7] <= min(s10[mod*i+7] , s10[mod*i+7+mod/2]);
			s11[mod*i+7+mod/2] <= max(s10[mod*i+7] , s10[mod*i+7+mod/2]);
			s11[mod*i+8] <= min(s10[mod*i+8] , s10[mod*i+8+mod/2]);
			s11[mod*i+8+mod/2] <= max(s10[mod*i+8] , s10[mod*i+8+mod/2]);
			s11[mod*i+9] <= min(s10[mod*i+9] , s10[mod*i+9+mod/2]);
			s11[mod*i+9+mod/2] <= max(s10[mod*i+9] , s10[mod*i+9+mod/2]);
			s11[mod*i+10] <= min(s10[mod*i+10] , s10[mod*i+10+mod/2]);
			s11[mod*i+10+mod/2] <= max(s10[mod*i+10] , s10[mod*i+10+mod/2]);
			s11[mod*i+11] <= min(s10[mod*i+11] , s10[mod*i+11+mod/2]);
			s11[mod*i+11+mod/2] <= max(s10[mod*i+11] , s10[mod*i+11+mod/2]);
			s11[mod*i+12] <= min(s10[mod*i+12] , s10[mod*i+12+mod/2]);
			s11[mod*i+12+mod/2] <= max(s10[mod*i+12] , s10[mod*i+12+mod/2]);
			s11[mod*i+13] <= min(s10[mod*i+13] , s10[mod*i+13+mod/2]);
			s11[mod*i+13+mod/2] <= max(s10[mod*i+13] , s10[mod*i+13+mod/2]);
			s11[mod*i+14] <= min(s10[mod*i+14] , s10[mod*i+14+mod/2]);
			s11[mod*i+14+mod/2] <= max(s10[mod*i+14] , s10[mod*i+14+mod/2]);
			s11[mod*i+15] <= min(s10[mod*i+15] , s10[mod*i+15+mod/2]);
			s11[mod*i+15+mod/2] <= max(s10[mod*i+15] , s10[mod*i+15+mod/2]);
		end
		else begin
			s11[mod*i+0] <= max(s10[mod*i+0] , s10[mod*i+0+mod/2]);
			s11[mod*i+0+mod/2] <= min(s10[mod*i+0] , s10[mod*i+0+mod/2]);
			s11[mod*i+1] <= max(s10[mod*i+1] , s10[mod*i+1+mod/2]);
			s11[mod*i+1+mod/2] <= min(s10[mod*i+1] , s10[mod*i+1+mod/2]);
			s11[mod*i+2] <= max(s10[mod*i+2] , s10[mod*i+2+mod/2]);
			s11[mod*i+2+mod/2] <= min(s10[mod*i+2] , s10[mod*i+2+mod/2]);
			s11[mod*i+3] <= max(s10[mod*i+3] , s10[mod*i+3+mod/2]);
			s11[mod*i+3+mod/2] <= min(s10[mod*i+3] , s10[mod*i+3+mod/2]);
			s11[mod*i+4] <= max(s10[mod*i+4] , s10[mod*i+4+mod/2]);
			s11[mod*i+4+mod/2] <= min(s10[mod*i+4] , s10[mod*i+4+mod/2]);
			s11[mod*i+5] <= max(s10[mod*i+5] , s10[mod*i+5+mod/2]);
			s11[mod*i+5+mod/2] <= min(s10[mod*i+5] , s10[mod*i+5+mod/2]);
			s11[mod*i+6] <= max(s10[mod*i+6] , s10[mod*i+6+mod/2]);
			s11[mod*i+6+mod/2] <= min(s10[mod*i+6] , s10[mod*i+6+mod/2]);
			s11[mod*i+7] <= max(s10[mod*i+7] , s10[mod*i+7+mod/2]);
			s11[mod*i+7+mod/2] <= min(s10[mod*i+7] , s10[mod*i+7+mod/2]);
			s11[mod*i+8] <= max(s10[mod*i+8] , s10[mod*i+8+mod/2]);
			s11[mod*i+8+mod/2] <= min(s10[mod*i+8] , s10[mod*i+8+mod/2]);
			s11[mod*i+9] <= max(s10[mod*i+9] , s10[mod*i+9+mod/2]);
			s11[mod*i+9+mod/2] <= min(s10[mod*i+9] , s10[mod*i+9+mod/2]);
			s11[mod*i+10] <= max(s10[mod*i+10] , s10[mod*i+10+mod/2]);
			s11[mod*i+10+mod/2] <= min(s10[mod*i+10] , s10[mod*i+10+mod/2]);
			s11[mod*i+11] <= max(s10[mod*i+11] , s10[mod*i+11+mod/2]);
			s11[mod*i+11+mod/2] <= min(s10[mod*i+11] , s10[mod*i+11+mod/2]);
			s11[mod*i+12] <= max(s10[mod*i+12] , s10[mod*i+12+mod/2]);
			s11[mod*i+12+mod/2] <= min(s10[mod*i+12] , s10[mod*i+12+mod/2]);
			s11[mod*i+13] <= max(s10[mod*i+13] , s10[mod*i+13+mod/2]);
			s11[mod*i+13+mod/2] <= min(s10[mod*i+13] , s10[mod*i+13+mod/2]);
			s11[mod*i+14] <= max(s10[mod*i+14] , s10[mod*i+14+mod/2]);
			s11[mod*i+14+mod/2] <= min(s10[mod*i+14] , s10[mod*i+14+mod/2]);
			s11[mod*i+15] <= max(s10[mod*i+15] , s10[mod*i+15+mod/2]);
			s11[mod*i+15+mod/2] <= min(s10[mod*i+15] , s10[mod*i+15+mod/2]);
		end
	end
	p11.enq(1);
endrule
rule _Q44;
	p11.deq;
	let mod = 16;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			s12[mod*i+0] <= min(s11[mod*i+0] , s11[mod*i+0+mod/2]);
			s12[mod*i+0+mod/2] <= max(s11[mod*i+0] , s11[mod*i+0+mod/2]);
			s12[mod*i+1] <= min(s11[mod*i+1] , s11[mod*i+1+mod/2]);
			s12[mod*i+1+mod/2] <= max(s11[mod*i+1] , s11[mod*i+1+mod/2]);
			s12[mod*i+2] <= min(s11[mod*i+2] , s11[mod*i+2+mod/2]);
			s12[mod*i+2+mod/2] <= max(s11[mod*i+2] , s11[mod*i+2+mod/2]);
			s12[mod*i+3] <= min(s11[mod*i+3] , s11[mod*i+3+mod/2]);
			s12[mod*i+3+mod/2] <= max(s11[mod*i+3] , s11[mod*i+3+mod/2]);
			s12[mod*i+4] <= min(s11[mod*i+4] , s11[mod*i+4+mod/2]);
			s12[mod*i+4+mod/2] <= max(s11[mod*i+4] , s11[mod*i+4+mod/2]);
			s12[mod*i+5] <= min(s11[mod*i+5] , s11[mod*i+5+mod/2]);
			s12[mod*i+5+mod/2] <= max(s11[mod*i+5] , s11[mod*i+5+mod/2]);
			s12[mod*i+6] <= min(s11[mod*i+6] , s11[mod*i+6+mod/2]);
			s12[mod*i+6+mod/2] <= max(s11[mod*i+6] , s11[mod*i+6+mod/2]);
			s12[mod*i+7] <= min(s11[mod*i+7] , s11[mod*i+7+mod/2]);
			s12[mod*i+7+mod/2] <= max(s11[mod*i+7] , s11[mod*i+7+mod/2]);
		end
		else begin
			s12[mod*i+0] <= max(s11[mod*i+0] , s11[mod*i+0+mod/2]);
			s12[mod*i+0+mod/2] <= min(s11[mod*i+0] , s11[mod*i+0+mod/2]);
			s12[mod*i+1] <= max(s11[mod*i+1] , s11[mod*i+1+mod/2]);
			s12[mod*i+1+mod/2] <= min(s11[mod*i+1] , s11[mod*i+1+mod/2]);
			s12[mod*i+2] <= max(s11[mod*i+2] , s11[mod*i+2+mod/2]);
			s12[mod*i+2+mod/2] <= min(s11[mod*i+2] , s11[mod*i+2+mod/2]);
			s12[mod*i+3] <= max(s11[mod*i+3] , s11[mod*i+3+mod/2]);
			s12[mod*i+3+mod/2] <= min(s11[mod*i+3] , s11[mod*i+3+mod/2]);
			s12[mod*i+4] <= max(s11[mod*i+4] , s11[mod*i+4+mod/2]);
			s12[mod*i+4+mod/2] <= min(s11[mod*i+4] , s11[mod*i+4+mod/2]);
			s12[mod*i+5] <= max(s11[mod*i+5] , s11[mod*i+5+mod/2]);
			s12[mod*i+5+mod/2] <= min(s11[mod*i+5] , s11[mod*i+5+mod/2]);
			s12[mod*i+6] <= max(s11[mod*i+6] , s11[mod*i+6+mod/2]);
			s12[mod*i+6+mod/2] <= min(s11[mod*i+6] , s11[mod*i+6+mod/2]);
			s12[mod*i+7] <= max(s11[mod*i+7] , s11[mod*i+7+mod/2]);
			s12[mod*i+7+mod/2] <= min(s11[mod*i+7] , s11[mod*i+7+mod/2]);
		end
	end
	p12.enq(1);
endrule
rule _Q43;
	p12.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/4)%2 == 0) begin
			s13[mod*i+0] <= min(s12[mod*i+0] , s12[mod*i+0+mod/2]);
			s13[mod*i+0+mod/2] <= max(s12[mod*i+0] , s12[mod*i+0+mod/2]);
			s13[mod*i+1] <= min(s12[mod*i+1] , s12[mod*i+1+mod/2]);
			s13[mod*i+1+mod/2] <= max(s12[mod*i+1] , s12[mod*i+1+mod/2]);
			s13[mod*i+2] <= min(s12[mod*i+2] , s12[mod*i+2+mod/2]);
			s13[mod*i+2+mod/2] <= max(s12[mod*i+2] , s12[mod*i+2+mod/2]);
			s13[mod*i+3] <= min(s12[mod*i+3] , s12[mod*i+3+mod/2]);
			s13[mod*i+3+mod/2] <= max(s12[mod*i+3] , s12[mod*i+3+mod/2]);
		end
		else begin
			s13[mod*i+0] <= max(s12[mod*i+0] , s12[mod*i+0+mod/2]);
			s13[mod*i+0+mod/2] <= min(s12[mod*i+0] , s12[mod*i+0+mod/2]);
			s13[mod*i+1] <= max(s12[mod*i+1] , s12[mod*i+1+mod/2]);
			s13[mod*i+1+mod/2] <= min(s12[mod*i+1] , s12[mod*i+1+mod/2]);
			s13[mod*i+2] <= max(s12[mod*i+2] , s12[mod*i+2+mod/2]);
			s13[mod*i+2+mod/2] <= min(s12[mod*i+2] , s12[mod*i+2+mod/2]);
			s13[mod*i+3] <= max(s12[mod*i+3] , s12[mod*i+3+mod/2]);
			s13[mod*i+3+mod/2] <= min(s12[mod*i+3] , s12[mod*i+3+mod/2]);
		end
	end
	p13.enq(1);
endrule
rule _Q42;
	p13.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/8)%2 == 0) begin
			s14[mod*i+0] <= min(s13[mod*i+0] , s13[mod*i+0+mod/2]);
			s14[mod*i+0+mod/2] <= max(s13[mod*i+0] , s13[mod*i+0+mod/2]);
			s14[mod*i+1] <= min(s13[mod*i+1] , s13[mod*i+1+mod/2]);
			s14[mod*i+1+mod/2] <= max(s13[mod*i+1] , s13[mod*i+1+mod/2]);
		end
		else begin
			s14[mod*i+0] <= max(s13[mod*i+0] , s13[mod*i+0+mod/2]);
			s14[mod*i+0+mod/2] <= min(s13[mod*i+0] , s13[mod*i+0+mod/2]);
			s14[mod*i+1] <= max(s13[mod*i+1] , s13[mod*i+1+mod/2]);
			s14[mod*i+1+mod/2] <= min(s13[mod*i+1] , s13[mod*i+1+mod/2]);
		end
	end
	p14.enq(1);
endrule
rule _Q41;
	p14.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/16)%2 == 0) begin
			s15[mod*i+0] <= min(s14[mod*i+0] , s14[mod*i+0+mod/2]);
			s15[mod*i+0+mod/2] <= max(s14[mod*i+0] , s14[mod*i+0+mod/2]);
		end
		else begin
			s15[mod*i+0] <= max(s14[mod*i+0] , s14[mod*i+0+mod/2]);
			s15[mod*i+0+mod/2] <= min(s14[mod*i+0] , s14[mod*i+0+mod/2]);
		end
	end
	p15.enq(1);
endrule
rule _Q56;
	p15.deq;
	let mod = 64;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			s16[mod*i+0] <= min(s15[mod*i+0] , s15[mod*i+0+mod/2]);
			s16[mod*i+0+mod/2] <= max(s15[mod*i+0] , s15[mod*i+0+mod/2]);
			s16[mod*i+1] <= min(s15[mod*i+1] , s15[mod*i+1+mod/2]);
			s16[mod*i+1+mod/2] <= max(s15[mod*i+1] , s15[mod*i+1+mod/2]);
			s16[mod*i+2] <= min(s15[mod*i+2] , s15[mod*i+2+mod/2]);
			s16[mod*i+2+mod/2] <= max(s15[mod*i+2] , s15[mod*i+2+mod/2]);
			s16[mod*i+3] <= min(s15[mod*i+3] , s15[mod*i+3+mod/2]);
			s16[mod*i+3+mod/2] <= max(s15[mod*i+3] , s15[mod*i+3+mod/2]);
			s16[mod*i+4] <= min(s15[mod*i+4] , s15[mod*i+4+mod/2]);
			s16[mod*i+4+mod/2] <= max(s15[mod*i+4] , s15[mod*i+4+mod/2]);
			s16[mod*i+5] <= min(s15[mod*i+5] , s15[mod*i+5+mod/2]);
			s16[mod*i+5+mod/2] <= max(s15[mod*i+5] , s15[mod*i+5+mod/2]);
			s16[mod*i+6] <= min(s15[mod*i+6] , s15[mod*i+6+mod/2]);
			s16[mod*i+6+mod/2] <= max(s15[mod*i+6] , s15[mod*i+6+mod/2]);
			s16[mod*i+7] <= min(s15[mod*i+7] , s15[mod*i+7+mod/2]);
			s16[mod*i+7+mod/2] <= max(s15[mod*i+7] , s15[mod*i+7+mod/2]);
			s16[mod*i+8] <= min(s15[mod*i+8] , s15[mod*i+8+mod/2]);
			s16[mod*i+8+mod/2] <= max(s15[mod*i+8] , s15[mod*i+8+mod/2]);
			s16[mod*i+9] <= min(s15[mod*i+9] , s15[mod*i+9+mod/2]);
			s16[mod*i+9+mod/2] <= max(s15[mod*i+9] , s15[mod*i+9+mod/2]);
			s16[mod*i+10] <= min(s15[mod*i+10] , s15[mod*i+10+mod/2]);
			s16[mod*i+10+mod/2] <= max(s15[mod*i+10] , s15[mod*i+10+mod/2]);
			s16[mod*i+11] <= min(s15[mod*i+11] , s15[mod*i+11+mod/2]);
			s16[mod*i+11+mod/2] <= max(s15[mod*i+11] , s15[mod*i+11+mod/2]);
			s16[mod*i+12] <= min(s15[mod*i+12] , s15[mod*i+12+mod/2]);
			s16[mod*i+12+mod/2] <= max(s15[mod*i+12] , s15[mod*i+12+mod/2]);
			s16[mod*i+13] <= min(s15[mod*i+13] , s15[mod*i+13+mod/2]);
			s16[mod*i+13+mod/2] <= max(s15[mod*i+13] , s15[mod*i+13+mod/2]);
			s16[mod*i+14] <= min(s15[mod*i+14] , s15[mod*i+14+mod/2]);
			s16[mod*i+14+mod/2] <= max(s15[mod*i+14] , s15[mod*i+14+mod/2]);
			s16[mod*i+15] <= min(s15[mod*i+15] , s15[mod*i+15+mod/2]);
			s16[mod*i+15+mod/2] <= max(s15[mod*i+15] , s15[mod*i+15+mod/2]);
			s16[mod*i+16] <= min(s15[mod*i+16] , s15[mod*i+16+mod/2]);
			s16[mod*i+16+mod/2] <= max(s15[mod*i+16] , s15[mod*i+16+mod/2]);
			s16[mod*i+17] <= min(s15[mod*i+17] , s15[mod*i+17+mod/2]);
			s16[mod*i+17+mod/2] <= max(s15[mod*i+17] , s15[mod*i+17+mod/2]);
			s16[mod*i+18] <= min(s15[mod*i+18] , s15[mod*i+18+mod/2]);
			s16[mod*i+18+mod/2] <= max(s15[mod*i+18] , s15[mod*i+18+mod/2]);
			s16[mod*i+19] <= min(s15[mod*i+19] , s15[mod*i+19+mod/2]);
			s16[mod*i+19+mod/2] <= max(s15[mod*i+19] , s15[mod*i+19+mod/2]);
			s16[mod*i+20] <= min(s15[mod*i+20] , s15[mod*i+20+mod/2]);
			s16[mod*i+20+mod/2] <= max(s15[mod*i+20] , s15[mod*i+20+mod/2]);
			s16[mod*i+21] <= min(s15[mod*i+21] , s15[mod*i+21+mod/2]);
			s16[mod*i+21+mod/2] <= max(s15[mod*i+21] , s15[mod*i+21+mod/2]);
			s16[mod*i+22] <= min(s15[mod*i+22] , s15[mod*i+22+mod/2]);
			s16[mod*i+22+mod/2] <= max(s15[mod*i+22] , s15[mod*i+22+mod/2]);
			s16[mod*i+23] <= min(s15[mod*i+23] , s15[mod*i+23+mod/2]);
			s16[mod*i+23+mod/2] <= max(s15[mod*i+23] , s15[mod*i+23+mod/2]);
			s16[mod*i+24] <= min(s15[mod*i+24] , s15[mod*i+24+mod/2]);
			s16[mod*i+24+mod/2] <= max(s15[mod*i+24] , s15[mod*i+24+mod/2]);
			s16[mod*i+25] <= min(s15[mod*i+25] , s15[mod*i+25+mod/2]);
			s16[mod*i+25+mod/2] <= max(s15[mod*i+25] , s15[mod*i+25+mod/2]);
			s16[mod*i+26] <= min(s15[mod*i+26] , s15[mod*i+26+mod/2]);
			s16[mod*i+26+mod/2] <= max(s15[mod*i+26] , s15[mod*i+26+mod/2]);
			s16[mod*i+27] <= min(s15[mod*i+27] , s15[mod*i+27+mod/2]);
			s16[mod*i+27+mod/2] <= max(s15[mod*i+27] , s15[mod*i+27+mod/2]);
			s16[mod*i+28] <= min(s15[mod*i+28] , s15[mod*i+28+mod/2]);
			s16[mod*i+28+mod/2] <= max(s15[mod*i+28] , s15[mod*i+28+mod/2]);
			s16[mod*i+29] <= min(s15[mod*i+29] , s15[mod*i+29+mod/2]);
			s16[mod*i+29+mod/2] <= max(s15[mod*i+29] , s15[mod*i+29+mod/2]);
			s16[mod*i+30] <= min(s15[mod*i+30] , s15[mod*i+30+mod/2]);
			s16[mod*i+30+mod/2] <= max(s15[mod*i+30] , s15[mod*i+30+mod/2]);
			s16[mod*i+31] <= min(s15[mod*i+31] , s15[mod*i+31+mod/2]);
			s16[mod*i+31+mod/2] <= max(s15[mod*i+31] , s15[mod*i+31+mod/2]);
		end
		else begin
			s16[mod*i+0] <= max(s15[mod*i+0] , s15[mod*i+0+mod/2]);
			s16[mod*i+0+mod/2] <= min(s15[mod*i+0] , s15[mod*i+0+mod/2]);
			s16[mod*i+1] <= max(s15[mod*i+1] , s15[mod*i+1+mod/2]);
			s16[mod*i+1+mod/2] <= min(s15[mod*i+1] , s15[mod*i+1+mod/2]);
			s16[mod*i+2] <= max(s15[mod*i+2] , s15[mod*i+2+mod/2]);
			s16[mod*i+2+mod/2] <= min(s15[mod*i+2] , s15[mod*i+2+mod/2]);
			s16[mod*i+3] <= max(s15[mod*i+3] , s15[mod*i+3+mod/2]);
			s16[mod*i+3+mod/2] <= min(s15[mod*i+3] , s15[mod*i+3+mod/2]);
			s16[mod*i+4] <= max(s15[mod*i+4] , s15[mod*i+4+mod/2]);
			s16[mod*i+4+mod/2] <= min(s15[mod*i+4] , s15[mod*i+4+mod/2]);
			s16[mod*i+5] <= max(s15[mod*i+5] , s15[mod*i+5+mod/2]);
			s16[mod*i+5+mod/2] <= min(s15[mod*i+5] , s15[mod*i+5+mod/2]);
			s16[mod*i+6] <= max(s15[mod*i+6] , s15[mod*i+6+mod/2]);
			s16[mod*i+6+mod/2] <= min(s15[mod*i+6] , s15[mod*i+6+mod/2]);
			s16[mod*i+7] <= max(s15[mod*i+7] , s15[mod*i+7+mod/2]);
			s16[mod*i+7+mod/2] <= min(s15[mod*i+7] , s15[mod*i+7+mod/2]);
			s16[mod*i+8] <= max(s15[mod*i+8] , s15[mod*i+8+mod/2]);
			s16[mod*i+8+mod/2] <= min(s15[mod*i+8] , s15[mod*i+8+mod/2]);
			s16[mod*i+9] <= max(s15[mod*i+9] , s15[mod*i+9+mod/2]);
			s16[mod*i+9+mod/2] <= min(s15[mod*i+9] , s15[mod*i+9+mod/2]);
			s16[mod*i+10] <= max(s15[mod*i+10] , s15[mod*i+10+mod/2]);
			s16[mod*i+10+mod/2] <= min(s15[mod*i+10] , s15[mod*i+10+mod/2]);
			s16[mod*i+11] <= max(s15[mod*i+11] , s15[mod*i+11+mod/2]);
			s16[mod*i+11+mod/2] <= min(s15[mod*i+11] , s15[mod*i+11+mod/2]);
			s16[mod*i+12] <= max(s15[mod*i+12] , s15[mod*i+12+mod/2]);
			s16[mod*i+12+mod/2] <= min(s15[mod*i+12] , s15[mod*i+12+mod/2]);
			s16[mod*i+13] <= max(s15[mod*i+13] , s15[mod*i+13+mod/2]);
			s16[mod*i+13+mod/2] <= min(s15[mod*i+13] , s15[mod*i+13+mod/2]);
			s16[mod*i+14] <= max(s15[mod*i+14] , s15[mod*i+14+mod/2]);
			s16[mod*i+14+mod/2] <= min(s15[mod*i+14] , s15[mod*i+14+mod/2]);
			s16[mod*i+15] <= max(s15[mod*i+15] , s15[mod*i+15+mod/2]);
			s16[mod*i+15+mod/2] <= min(s15[mod*i+15] , s15[mod*i+15+mod/2]);
			s16[mod*i+16] <= max(s15[mod*i+16] , s15[mod*i+16+mod/2]);
			s16[mod*i+16+mod/2] <= min(s15[mod*i+16] , s15[mod*i+16+mod/2]);
			s16[mod*i+17] <= max(s15[mod*i+17] , s15[mod*i+17+mod/2]);
			s16[mod*i+17+mod/2] <= min(s15[mod*i+17] , s15[mod*i+17+mod/2]);
			s16[mod*i+18] <= max(s15[mod*i+18] , s15[mod*i+18+mod/2]);
			s16[mod*i+18+mod/2] <= min(s15[mod*i+18] , s15[mod*i+18+mod/2]);
			s16[mod*i+19] <= max(s15[mod*i+19] , s15[mod*i+19+mod/2]);
			s16[mod*i+19+mod/2] <= min(s15[mod*i+19] , s15[mod*i+19+mod/2]);
			s16[mod*i+20] <= max(s15[mod*i+20] , s15[mod*i+20+mod/2]);
			s16[mod*i+20+mod/2] <= min(s15[mod*i+20] , s15[mod*i+20+mod/2]);
			s16[mod*i+21] <= max(s15[mod*i+21] , s15[mod*i+21+mod/2]);
			s16[mod*i+21+mod/2] <= min(s15[mod*i+21] , s15[mod*i+21+mod/2]);
			s16[mod*i+22] <= max(s15[mod*i+22] , s15[mod*i+22+mod/2]);
			s16[mod*i+22+mod/2] <= min(s15[mod*i+22] , s15[mod*i+22+mod/2]);
			s16[mod*i+23] <= max(s15[mod*i+23] , s15[mod*i+23+mod/2]);
			s16[mod*i+23+mod/2] <= min(s15[mod*i+23] , s15[mod*i+23+mod/2]);
			s16[mod*i+24] <= max(s15[mod*i+24] , s15[mod*i+24+mod/2]);
			s16[mod*i+24+mod/2] <= min(s15[mod*i+24] , s15[mod*i+24+mod/2]);
			s16[mod*i+25] <= max(s15[mod*i+25] , s15[mod*i+25+mod/2]);
			s16[mod*i+25+mod/2] <= min(s15[mod*i+25] , s15[mod*i+25+mod/2]);
			s16[mod*i+26] <= max(s15[mod*i+26] , s15[mod*i+26+mod/2]);
			s16[mod*i+26+mod/2] <= min(s15[mod*i+26] , s15[mod*i+26+mod/2]);
			s16[mod*i+27] <= max(s15[mod*i+27] , s15[mod*i+27+mod/2]);
			s16[mod*i+27+mod/2] <= min(s15[mod*i+27] , s15[mod*i+27+mod/2]);
			s16[mod*i+28] <= max(s15[mod*i+28] , s15[mod*i+28+mod/2]);
			s16[mod*i+28+mod/2] <= min(s15[mod*i+28] , s15[mod*i+28+mod/2]);
			s16[mod*i+29] <= max(s15[mod*i+29] , s15[mod*i+29+mod/2]);
			s16[mod*i+29+mod/2] <= min(s15[mod*i+29] , s15[mod*i+29+mod/2]);
			s16[mod*i+30] <= max(s15[mod*i+30] , s15[mod*i+30+mod/2]);
			s16[mod*i+30+mod/2] <= min(s15[mod*i+30] , s15[mod*i+30+mod/2]);
			s16[mod*i+31] <= max(s15[mod*i+31] , s15[mod*i+31+mod/2]);
			s16[mod*i+31+mod/2] <= min(s15[mod*i+31] , s15[mod*i+31+mod/2]);
		end
	end
	p16.enq(1);
endrule
rule _Q55;
	p16.deq;
	let mod = 32;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			s17[mod*i+0] <= min(s16[mod*i+0] , s16[mod*i+0+mod/2]);
			s17[mod*i+0+mod/2] <= max(s16[mod*i+0] , s16[mod*i+0+mod/2]);
			s17[mod*i+1] <= min(s16[mod*i+1] , s16[mod*i+1+mod/2]);
			s17[mod*i+1+mod/2] <= max(s16[mod*i+1] , s16[mod*i+1+mod/2]);
			s17[mod*i+2] <= min(s16[mod*i+2] , s16[mod*i+2+mod/2]);
			s17[mod*i+2+mod/2] <= max(s16[mod*i+2] , s16[mod*i+2+mod/2]);
			s17[mod*i+3] <= min(s16[mod*i+3] , s16[mod*i+3+mod/2]);
			s17[mod*i+3+mod/2] <= max(s16[mod*i+3] , s16[mod*i+3+mod/2]);
			s17[mod*i+4] <= min(s16[mod*i+4] , s16[mod*i+4+mod/2]);
			s17[mod*i+4+mod/2] <= max(s16[mod*i+4] , s16[mod*i+4+mod/2]);
			s17[mod*i+5] <= min(s16[mod*i+5] , s16[mod*i+5+mod/2]);
			s17[mod*i+5+mod/2] <= max(s16[mod*i+5] , s16[mod*i+5+mod/2]);
			s17[mod*i+6] <= min(s16[mod*i+6] , s16[mod*i+6+mod/2]);
			s17[mod*i+6+mod/2] <= max(s16[mod*i+6] , s16[mod*i+6+mod/2]);
			s17[mod*i+7] <= min(s16[mod*i+7] , s16[mod*i+7+mod/2]);
			s17[mod*i+7+mod/2] <= max(s16[mod*i+7] , s16[mod*i+7+mod/2]);
			s17[mod*i+8] <= min(s16[mod*i+8] , s16[mod*i+8+mod/2]);
			s17[mod*i+8+mod/2] <= max(s16[mod*i+8] , s16[mod*i+8+mod/2]);
			s17[mod*i+9] <= min(s16[mod*i+9] , s16[mod*i+9+mod/2]);
			s17[mod*i+9+mod/2] <= max(s16[mod*i+9] , s16[mod*i+9+mod/2]);
			s17[mod*i+10] <= min(s16[mod*i+10] , s16[mod*i+10+mod/2]);
			s17[mod*i+10+mod/2] <= max(s16[mod*i+10] , s16[mod*i+10+mod/2]);
			s17[mod*i+11] <= min(s16[mod*i+11] , s16[mod*i+11+mod/2]);
			s17[mod*i+11+mod/2] <= max(s16[mod*i+11] , s16[mod*i+11+mod/2]);
			s17[mod*i+12] <= min(s16[mod*i+12] , s16[mod*i+12+mod/2]);
			s17[mod*i+12+mod/2] <= max(s16[mod*i+12] , s16[mod*i+12+mod/2]);
			s17[mod*i+13] <= min(s16[mod*i+13] , s16[mod*i+13+mod/2]);
			s17[mod*i+13+mod/2] <= max(s16[mod*i+13] , s16[mod*i+13+mod/2]);
			s17[mod*i+14] <= min(s16[mod*i+14] , s16[mod*i+14+mod/2]);
			s17[mod*i+14+mod/2] <= max(s16[mod*i+14] , s16[mod*i+14+mod/2]);
			s17[mod*i+15] <= min(s16[mod*i+15] , s16[mod*i+15+mod/2]);
			s17[mod*i+15+mod/2] <= max(s16[mod*i+15] , s16[mod*i+15+mod/2]);
		end
		else begin
			s17[mod*i+0] <= max(s16[mod*i+0] , s16[mod*i+0+mod/2]);
			s17[mod*i+0+mod/2] <= min(s16[mod*i+0] , s16[mod*i+0+mod/2]);
			s17[mod*i+1] <= max(s16[mod*i+1] , s16[mod*i+1+mod/2]);
			s17[mod*i+1+mod/2] <= min(s16[mod*i+1] , s16[mod*i+1+mod/2]);
			s17[mod*i+2] <= max(s16[mod*i+2] , s16[mod*i+2+mod/2]);
			s17[mod*i+2+mod/2] <= min(s16[mod*i+2] , s16[mod*i+2+mod/2]);
			s17[mod*i+3] <= max(s16[mod*i+3] , s16[mod*i+3+mod/2]);
			s17[mod*i+3+mod/2] <= min(s16[mod*i+3] , s16[mod*i+3+mod/2]);
			s17[mod*i+4] <= max(s16[mod*i+4] , s16[mod*i+4+mod/2]);
			s17[mod*i+4+mod/2] <= min(s16[mod*i+4] , s16[mod*i+4+mod/2]);
			s17[mod*i+5] <= max(s16[mod*i+5] , s16[mod*i+5+mod/2]);
			s17[mod*i+5+mod/2] <= min(s16[mod*i+5] , s16[mod*i+5+mod/2]);
			s17[mod*i+6] <= max(s16[mod*i+6] , s16[mod*i+6+mod/2]);
			s17[mod*i+6+mod/2] <= min(s16[mod*i+6] , s16[mod*i+6+mod/2]);
			s17[mod*i+7] <= max(s16[mod*i+7] , s16[mod*i+7+mod/2]);
			s17[mod*i+7+mod/2] <= min(s16[mod*i+7] , s16[mod*i+7+mod/2]);
			s17[mod*i+8] <= max(s16[mod*i+8] , s16[mod*i+8+mod/2]);
			s17[mod*i+8+mod/2] <= min(s16[mod*i+8] , s16[mod*i+8+mod/2]);
			s17[mod*i+9] <= max(s16[mod*i+9] , s16[mod*i+9+mod/2]);
			s17[mod*i+9+mod/2] <= min(s16[mod*i+9] , s16[mod*i+9+mod/2]);
			s17[mod*i+10] <= max(s16[mod*i+10] , s16[mod*i+10+mod/2]);
			s17[mod*i+10+mod/2] <= min(s16[mod*i+10] , s16[mod*i+10+mod/2]);
			s17[mod*i+11] <= max(s16[mod*i+11] , s16[mod*i+11+mod/2]);
			s17[mod*i+11+mod/2] <= min(s16[mod*i+11] , s16[mod*i+11+mod/2]);
			s17[mod*i+12] <= max(s16[mod*i+12] , s16[mod*i+12+mod/2]);
			s17[mod*i+12+mod/2] <= min(s16[mod*i+12] , s16[mod*i+12+mod/2]);
			s17[mod*i+13] <= max(s16[mod*i+13] , s16[mod*i+13+mod/2]);
			s17[mod*i+13+mod/2] <= min(s16[mod*i+13] , s16[mod*i+13+mod/2]);
			s17[mod*i+14] <= max(s16[mod*i+14] , s16[mod*i+14+mod/2]);
			s17[mod*i+14+mod/2] <= min(s16[mod*i+14] , s16[mod*i+14+mod/2]);
			s17[mod*i+15] <= max(s16[mod*i+15] , s16[mod*i+15+mod/2]);
			s17[mod*i+15+mod/2] <= min(s16[mod*i+15] , s16[mod*i+15+mod/2]);
		end
	end
	p17.enq(1);
endrule
rule _Q54;
	p17.deq;
	let mod = 16;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/4)%2 == 0) begin
			s18[mod*i+0] <= min(s17[mod*i+0] , s17[mod*i+0+mod/2]);
			s18[mod*i+0+mod/2] <= max(s17[mod*i+0] , s17[mod*i+0+mod/2]);
			s18[mod*i+1] <= min(s17[mod*i+1] , s17[mod*i+1+mod/2]);
			s18[mod*i+1+mod/2] <= max(s17[mod*i+1] , s17[mod*i+1+mod/2]);
			s18[mod*i+2] <= min(s17[mod*i+2] , s17[mod*i+2+mod/2]);
			s18[mod*i+2+mod/2] <= max(s17[mod*i+2] , s17[mod*i+2+mod/2]);
			s18[mod*i+3] <= min(s17[mod*i+3] , s17[mod*i+3+mod/2]);
			s18[mod*i+3+mod/2] <= max(s17[mod*i+3] , s17[mod*i+3+mod/2]);
			s18[mod*i+4] <= min(s17[mod*i+4] , s17[mod*i+4+mod/2]);
			s18[mod*i+4+mod/2] <= max(s17[mod*i+4] , s17[mod*i+4+mod/2]);
			s18[mod*i+5] <= min(s17[mod*i+5] , s17[mod*i+5+mod/2]);
			s18[mod*i+5+mod/2] <= max(s17[mod*i+5] , s17[mod*i+5+mod/2]);
			s18[mod*i+6] <= min(s17[mod*i+6] , s17[mod*i+6+mod/2]);
			s18[mod*i+6+mod/2] <= max(s17[mod*i+6] , s17[mod*i+6+mod/2]);
			s18[mod*i+7] <= min(s17[mod*i+7] , s17[mod*i+7+mod/2]);
			s18[mod*i+7+mod/2] <= max(s17[mod*i+7] , s17[mod*i+7+mod/2]);
		end
		else begin
			s18[mod*i+0] <= max(s17[mod*i+0] , s17[mod*i+0+mod/2]);
			s18[mod*i+0+mod/2] <= min(s17[mod*i+0] , s17[mod*i+0+mod/2]);
			s18[mod*i+1] <= max(s17[mod*i+1] , s17[mod*i+1+mod/2]);
			s18[mod*i+1+mod/2] <= min(s17[mod*i+1] , s17[mod*i+1+mod/2]);
			s18[mod*i+2] <= max(s17[mod*i+2] , s17[mod*i+2+mod/2]);
			s18[mod*i+2+mod/2] <= min(s17[mod*i+2] , s17[mod*i+2+mod/2]);
			s18[mod*i+3] <= max(s17[mod*i+3] , s17[mod*i+3+mod/2]);
			s18[mod*i+3+mod/2] <= min(s17[mod*i+3] , s17[mod*i+3+mod/2]);
			s18[mod*i+4] <= max(s17[mod*i+4] , s17[mod*i+4+mod/2]);
			s18[mod*i+4+mod/2] <= min(s17[mod*i+4] , s17[mod*i+4+mod/2]);
			s18[mod*i+5] <= max(s17[mod*i+5] , s17[mod*i+5+mod/2]);
			s18[mod*i+5+mod/2] <= min(s17[mod*i+5] , s17[mod*i+5+mod/2]);
			s18[mod*i+6] <= max(s17[mod*i+6] , s17[mod*i+6+mod/2]);
			s18[mod*i+6+mod/2] <= min(s17[mod*i+6] , s17[mod*i+6+mod/2]);
			s18[mod*i+7] <= max(s17[mod*i+7] , s17[mod*i+7+mod/2]);
			s18[mod*i+7+mod/2] <= min(s17[mod*i+7] , s17[mod*i+7+mod/2]);
		end
	end
	p18.enq(1);
endrule
rule _Q53;
	p18.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/8)%2 == 0) begin
			s19[mod*i+0] <= min(s18[mod*i+0] , s18[mod*i+0+mod/2]);
			s19[mod*i+0+mod/2] <= max(s18[mod*i+0] , s18[mod*i+0+mod/2]);
			s19[mod*i+1] <= min(s18[mod*i+1] , s18[mod*i+1+mod/2]);
			s19[mod*i+1+mod/2] <= max(s18[mod*i+1] , s18[mod*i+1+mod/2]);
			s19[mod*i+2] <= min(s18[mod*i+2] , s18[mod*i+2+mod/2]);
			s19[mod*i+2+mod/2] <= max(s18[mod*i+2] , s18[mod*i+2+mod/2]);
			s19[mod*i+3] <= min(s18[mod*i+3] , s18[mod*i+3+mod/2]);
			s19[mod*i+3+mod/2] <= max(s18[mod*i+3] , s18[mod*i+3+mod/2]);
		end
		else begin
			s19[mod*i+0] <= max(s18[mod*i+0] , s18[mod*i+0+mod/2]);
			s19[mod*i+0+mod/2] <= min(s18[mod*i+0] , s18[mod*i+0+mod/2]);
			s19[mod*i+1] <= max(s18[mod*i+1] , s18[mod*i+1+mod/2]);
			s19[mod*i+1+mod/2] <= min(s18[mod*i+1] , s18[mod*i+1+mod/2]);
			s19[mod*i+2] <= max(s18[mod*i+2] , s18[mod*i+2+mod/2]);
			s19[mod*i+2+mod/2] <= min(s18[mod*i+2] , s18[mod*i+2+mod/2]);
			s19[mod*i+3] <= max(s18[mod*i+3] , s18[mod*i+3+mod/2]);
			s19[mod*i+3+mod/2] <= min(s18[mod*i+3] , s18[mod*i+3+mod/2]);
		end
	end
	p19.enq(1);
endrule
rule _Q52;
	p19.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/16)%2 == 0) begin
			s20[mod*i+0] <= min(s19[mod*i+0] , s19[mod*i+0+mod/2]);
			s20[mod*i+0+mod/2] <= max(s19[mod*i+0] , s19[mod*i+0+mod/2]);
			s20[mod*i+1] <= min(s19[mod*i+1] , s19[mod*i+1+mod/2]);
			s20[mod*i+1+mod/2] <= max(s19[mod*i+1] , s19[mod*i+1+mod/2]);
		end
		else begin
			s20[mod*i+0] <= max(s19[mod*i+0] , s19[mod*i+0+mod/2]);
			s20[mod*i+0+mod/2] <= min(s19[mod*i+0] , s19[mod*i+0+mod/2]);
			s20[mod*i+1] <= max(s19[mod*i+1] , s19[mod*i+1+mod/2]);
			s20[mod*i+1+mod/2] <= min(s19[mod*i+1] , s19[mod*i+1+mod/2]);
		end
	end
	p20.enq(1);
endrule
rule _Q51;
	p20.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/32)%2 == 0) begin
			s21[mod*i+0] <= min(s20[mod*i+0] , s20[mod*i+0+mod/2]);
			s21[mod*i+0+mod/2] <= max(s20[mod*i+0] , s20[mod*i+0+mod/2]);
		end
		else begin
			s21[mod*i+0] <= max(s20[mod*i+0] , s20[mod*i+0+mod/2]);
			s21[mod*i+0+mod/2] <= min(s20[mod*i+0] , s20[mod*i+0+mod/2]);
		end
	end
	p21.enq(1);
endrule

method Action put(Vector#(L0, Int#(16)) datas);
for(int i=0;i<L0;i=i+1)
s0[i] <= datas[i];
p0.enq(1);
endmethod

method ActionValue#(Vector#(L0, Int#(16))) get;
p21.deq;
Vector#(L0,Int#(16)) r = newVector;
for(int i=0; i<L0; i = i + 1)
r[i] = s21[i];
return r;
endmethod
endmodule
endpackage
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
		if ((i/1)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s1[mod*i+j] <= min(s0[mod*i+j] , s0[mod*i+j+mod/2]);
			s1[mod*i+j+mod/2] <= max(s0[mod*i+j] , s0[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s1[mod*i+j] <= max(s0[mod*i+j] , s0[mod*i+j+mod/2]);
			s1[mod*i+j+mod/2] <= min(s0[mod*i+j] , s0[mod*i+j+mod/2]);
			end
		end
	end
	p1.enq(1);
endrule
rule _Q12;
	p1.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s2[mod*i+j] <= min(s1[mod*i+j] , s1[mod*i+j+mod/2]);
			s2[mod*i+j+mod/2] <= max(s1[mod*i+j] , s1[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s2[mod*i+j] <= max(s1[mod*i+j] , s1[mod*i+j+mod/2]);
			s2[mod*i+j+mod/2] <= min(s1[mod*i+j] , s1[mod*i+j+mod/2]);
			end
		end
	end
	p2.enq(1);
endrule
rule _Q11;
	p2.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s3[mod*i+j] <= min(s2[mod*i+j] , s2[mod*i+j+mod/2]);
			s3[mod*i+j+mod/2] <= max(s2[mod*i+j] , s2[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s3[mod*i+j] <= max(s2[mod*i+j] , s2[mod*i+j+mod/2]);
			s3[mod*i+j+mod/2] <= min(s2[mod*i+j] , s2[mod*i+j+mod/2]);
			end
		end
	end
	p3.enq(1);
endrule
rule _Q23;
	p3.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s4[mod*i+j] <= min(s3[mod*i+j] , s3[mod*i+j+mod/2]);
			s4[mod*i+j+mod/2] <= max(s3[mod*i+j] , s3[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s4[mod*i+j] <= max(s3[mod*i+j] , s3[mod*i+j+mod/2]);
			s4[mod*i+j+mod/2] <= min(s3[mod*i+j] , s3[mod*i+j+mod/2]);
			end
		end
	end
	p4.enq(1);
endrule
rule _Q22;
	p4.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s5[mod*i+j] <= min(s4[mod*i+j] , s4[mod*i+j+mod/2]);
			s5[mod*i+j+mod/2] <= max(s4[mod*i+j] , s4[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s5[mod*i+j] <= max(s4[mod*i+j] , s4[mod*i+j+mod/2]);
			s5[mod*i+j+mod/2] <= min(s4[mod*i+j] , s4[mod*i+j+mod/2]);
			end
		end
	end
	p5.enq(1);
endrule
rule _Q21;
	p5.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/4)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s6[mod*i+j] <= min(s5[mod*i+j] , s5[mod*i+j+mod/2]);
			s6[mod*i+j+mod/2] <= max(s5[mod*i+j] , s5[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s6[mod*i+j] <= max(s5[mod*i+j] , s5[mod*i+j+mod/2]);
			s6[mod*i+j+mod/2] <= min(s5[mod*i+j] , s5[mod*i+j+mod/2]);
			end
		end
	end
	p6.enq(1);
endrule
rule _Q34;
	p6.deq;
	let mod = 16;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s7[mod*i+j] <= min(s6[mod*i+j] , s6[mod*i+j+mod/2]);
			s7[mod*i+j+mod/2] <= max(s6[mod*i+j] , s6[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s7[mod*i+j] <= max(s6[mod*i+j] , s6[mod*i+j+mod/2]);
			s7[mod*i+j+mod/2] <= min(s6[mod*i+j] , s6[mod*i+j+mod/2]);
			end
		end
	end
	p7.enq(1);
endrule
rule _Q33;
	p7.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s8[mod*i+j] <= min(s7[mod*i+j] , s7[mod*i+j+mod/2]);
			s8[mod*i+j+mod/2] <= max(s7[mod*i+j] , s7[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s8[mod*i+j] <= max(s7[mod*i+j] , s7[mod*i+j+mod/2]);
			s8[mod*i+j+mod/2] <= min(s7[mod*i+j] , s7[mod*i+j+mod/2]);
			end
		end
	end
	p8.enq(1);
endrule
rule _Q32;
	p8.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/4)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s9[mod*i+j] <= min(s8[mod*i+j] , s8[mod*i+j+mod/2]);
			s9[mod*i+j+mod/2] <= max(s8[mod*i+j] , s8[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s9[mod*i+j] <= max(s8[mod*i+j] , s8[mod*i+j+mod/2]);
			s9[mod*i+j+mod/2] <= min(s8[mod*i+j] , s8[mod*i+j+mod/2]);
			end
		end
	end
	p9.enq(1);
endrule
rule _Q31;
	p9.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/8)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s10[mod*i+j] <= min(s9[mod*i+j] , s9[mod*i+j+mod/2]);
			s10[mod*i+j+mod/2] <= max(s9[mod*i+j] , s9[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s10[mod*i+j] <= max(s9[mod*i+j] , s9[mod*i+j+mod/2]);
			s10[mod*i+j+mod/2] <= min(s9[mod*i+j] , s9[mod*i+j+mod/2]);
			end
		end
	end
	p10.enq(1);
endrule
rule _Q45;
	p10.deq;
	let mod = 32;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s11[mod*i+j] <= min(s10[mod*i+j] , s10[mod*i+j+mod/2]);
			s11[mod*i+j+mod/2] <= max(s10[mod*i+j] , s10[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s11[mod*i+j] <= max(s10[mod*i+j] , s10[mod*i+j+mod/2]);
			s11[mod*i+j+mod/2] <= min(s10[mod*i+j] , s10[mod*i+j+mod/2]);
			end
		end
	end
	p11.enq(1);
endrule
rule _Q44;
	p11.deq;
	let mod = 16;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s12[mod*i+j] <= min(s11[mod*i+j] , s11[mod*i+j+mod/2]);
			s12[mod*i+j+mod/2] <= max(s11[mod*i+j] , s11[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s12[mod*i+j] <= max(s11[mod*i+j] , s11[mod*i+j+mod/2]);
			s12[mod*i+j+mod/2] <= min(s11[mod*i+j] , s11[mod*i+j+mod/2]);
			end
		end
	end
	p12.enq(1);
endrule
rule _Q43;
	p12.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/4)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s13[mod*i+j] <= min(s12[mod*i+j] , s12[mod*i+j+mod/2]);
			s13[mod*i+j+mod/2] <= max(s12[mod*i+j] , s12[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s13[mod*i+j] <= max(s12[mod*i+j] , s12[mod*i+j+mod/2]);
			s13[mod*i+j+mod/2] <= min(s12[mod*i+j] , s12[mod*i+j+mod/2]);
			end
		end
	end
	p13.enq(1);
endrule
rule _Q42;
	p13.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/8)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s14[mod*i+j] <= min(s13[mod*i+j] , s13[mod*i+j+mod/2]);
			s14[mod*i+j+mod/2] <= max(s13[mod*i+j] , s13[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s14[mod*i+j] <= max(s13[mod*i+j] , s13[mod*i+j+mod/2]);
			s14[mod*i+j+mod/2] <= min(s13[mod*i+j] , s13[mod*i+j+mod/2]);
			end
		end
	end
	p14.enq(1);
endrule
rule _Q41;
	p14.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/16)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s15[mod*i+j] <= min(s14[mod*i+j] , s14[mod*i+j+mod/2]);
			s15[mod*i+j+mod/2] <= max(s14[mod*i+j] , s14[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s15[mod*i+j] <= max(s14[mod*i+j] , s14[mod*i+j+mod/2]);
			s15[mod*i+j+mod/2] <= min(s14[mod*i+j] , s14[mod*i+j+mod/2]);
			end
		end
	end
	p15.enq(1);
endrule
rule _Q56;
	p15.deq;
	let mod = 64;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s16[mod*i+j] <= min(s15[mod*i+j] , s15[mod*i+j+mod/2]);
			s16[mod*i+j+mod/2] <= max(s15[mod*i+j] , s15[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s16[mod*i+j] <= max(s15[mod*i+j] , s15[mod*i+j+mod/2]);
			s16[mod*i+j+mod/2] <= min(s15[mod*i+j] , s15[mod*i+j+mod/2]);
			end
		end
	end
	p16.enq(1);
endrule
rule _Q55;
	p16.deq;
	let mod = 32;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s17[mod*i+j] <= min(s16[mod*i+j] , s16[mod*i+j+mod/2]);
			s17[mod*i+j+mod/2] <= max(s16[mod*i+j] , s16[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s17[mod*i+j] <= max(s16[mod*i+j] , s16[mod*i+j+mod/2]);
			s17[mod*i+j+mod/2] <= min(s16[mod*i+j] , s16[mod*i+j+mod/2]);
			end
		end
	end
	p17.enq(1);
endrule
rule _Q54;
	p17.deq;
	let mod = 16;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/4)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s18[mod*i+j] <= min(s17[mod*i+j] , s17[mod*i+j+mod/2]);
			s18[mod*i+j+mod/2] <= max(s17[mod*i+j] , s17[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s18[mod*i+j] <= max(s17[mod*i+j] , s17[mod*i+j+mod/2]);
			s18[mod*i+j+mod/2] <= min(s17[mod*i+j] , s17[mod*i+j+mod/2]);
			end
		end
	end
	p18.enq(1);
endrule
rule _Q53;
	p18.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/8)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s19[mod*i+j] <= min(s18[mod*i+j] , s18[mod*i+j+mod/2]);
			s19[mod*i+j+mod/2] <= max(s18[mod*i+j] , s18[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s19[mod*i+j] <= max(s18[mod*i+j] , s18[mod*i+j+mod/2]);
			s19[mod*i+j+mod/2] <= min(s18[mod*i+j] , s18[mod*i+j+mod/2]);
			end
		end
	end
	p19.enq(1);
endrule
rule _Q52;
	p19.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/16)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s20[mod*i+j] <= min(s19[mod*i+j] , s19[mod*i+j+mod/2]);
			s20[mod*i+j+mod/2] <= max(s19[mod*i+j] , s19[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s20[mod*i+j] <= max(s19[mod*i+j] , s19[mod*i+j+mod/2]);
			s20[mod*i+j+mod/2] <= min(s19[mod*i+j] , s19[mod*i+j+mod/2]);
			end
		end
	end
	p20.enq(1);
endrule
rule _Q51;
	p20.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/32)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s21[mod*i+j] <= min(s20[mod*i+j] , s20[mod*i+j+mod/2]);
			s21[mod*i+j+mod/2] <= max(s20[mod*i+j] , s20[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s21[mod*i+j] <= max(s20[mod*i+j] , s20[mod*i+j+mod/2]);
			s21[mod*i+j+mod/2] <= min(s20[mod*i+j] , s20[mod*i+j+mod/2]);
			end
		end
	end
	p21.enq(1);
endrule
rule _Q67;
	p21.deq;
	let mod = 128;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s22[mod*i+j] <= min(s21[mod*i+j] , s21[mod*i+j+mod/2]);
			s22[mod*i+j+mod/2] <= max(s21[mod*i+j] , s21[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s22[mod*i+j] <= max(s21[mod*i+j] , s21[mod*i+j+mod/2]);
			s22[mod*i+j+mod/2] <= min(s21[mod*i+j] , s21[mod*i+j+mod/2]);
			end
		end
	end
	p22.enq(1);
endrule
rule _Q66;
	p22.deq;
	let mod = 64;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s23[mod*i+j] <= min(s22[mod*i+j] , s22[mod*i+j+mod/2]);
			s23[mod*i+j+mod/2] <= max(s22[mod*i+j] , s22[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s23[mod*i+j] <= max(s22[mod*i+j] , s22[mod*i+j+mod/2]);
			s23[mod*i+j+mod/2] <= min(s22[mod*i+j] , s22[mod*i+j+mod/2]);
			end
		end
	end
	p23.enq(1);
endrule
rule _Q65;
	p23.deq;
	let mod = 32;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/4)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s24[mod*i+j] <= min(s23[mod*i+j] , s23[mod*i+j+mod/2]);
			s24[mod*i+j+mod/2] <= max(s23[mod*i+j] , s23[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s24[mod*i+j] <= max(s23[mod*i+j] , s23[mod*i+j+mod/2]);
			s24[mod*i+j+mod/2] <= min(s23[mod*i+j] , s23[mod*i+j+mod/2]);
			end
		end
	end
	p24.enq(1);
endrule
rule _Q64;
	p24.deq;
	let mod = 16;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/8)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s25[mod*i+j] <= min(s24[mod*i+j] , s24[mod*i+j+mod/2]);
			s25[mod*i+j+mod/2] <= max(s24[mod*i+j] , s24[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s25[mod*i+j] <= max(s24[mod*i+j] , s24[mod*i+j+mod/2]);
			s25[mod*i+j+mod/2] <= min(s24[mod*i+j] , s24[mod*i+j+mod/2]);
			end
		end
	end
	p25.enq(1);
endrule
rule _Q63;
	p25.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/16)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s26[mod*i+j] <= min(s25[mod*i+j] , s25[mod*i+j+mod/2]);
			s26[mod*i+j+mod/2] <= max(s25[mod*i+j] , s25[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s26[mod*i+j] <= max(s25[mod*i+j] , s25[mod*i+j+mod/2]);
			s26[mod*i+j+mod/2] <= min(s25[mod*i+j] , s25[mod*i+j+mod/2]);
			end
		end
	end
	p26.enq(1);
endrule
rule _Q62;
	p26.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/32)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s27[mod*i+j] <= min(s26[mod*i+j] , s26[mod*i+j+mod/2]);
			s27[mod*i+j+mod/2] <= max(s26[mod*i+j] , s26[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s27[mod*i+j] <= max(s26[mod*i+j] , s26[mod*i+j+mod/2]);
			s27[mod*i+j+mod/2] <= min(s26[mod*i+j] , s26[mod*i+j+mod/2]);
			end
		end
	end
	p27.enq(1);
endrule
rule _Q61;
	p27.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/64)%2 == 0) begin
			for(int j=0; j< mod/2; j=j+1) begin
			s28[mod*i+j] <= min(s27[mod*i+j] , s27[mod*i+j+mod/2]);
			s28[mod*i+j+mod/2] <= max(s27[mod*i+j] , s27[mod*i+j+mod/2]);
			end
		end
		else begin
			for(int j=0; j< mod/2; j=j+1) begin
			s28[mod*i+j] <= max(s27[mod*i+j] , s27[mod*i+j+mod/2]);
			s28[mod*i+j+mod/2] <= min(s27[mod*i+j] , s27[mod*i+j+mod/2]);
			end
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
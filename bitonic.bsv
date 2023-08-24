package bitonic;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;
#define L0 64

interface Bitonic;
        method Action put(Vector#(L0, Int#(32)) datas);
        method ActionValue#(Vector#(L0, Int#(32))) get;
endinterface


function Int#(32) _min(Bit#(32) pkt1, Bit#(32) pkt2);
	Int#(8)  p1_partition = unpack(pkt1[7:0]);
	Int#(8)  p2_partition = unpack(pkt2[7:0]);
	Int#(8)  p1_conv      = unpack(pkt1[15:8]);
	Int#(8)  p2_conv      = unpack(pkt2[15:8]);
	Int#(16) p1_val       = unpack(pkt1[31:16]);
	Int#(16) p2_val       = unpack(pkt2[31:16]);
	Vector#(2,Int#(32)) sort = newVector;
	if (p1_partition < p2_partition || (p1_partition == p2_partition && p1_conv < p2_conv) /*|| (p1_partition == p2_partition && p1_conv == p2_conv && p1_val < p2_val)*/)
		return unpack(pkt1);
	else
		return unpack(pkt2);
endfunction


function  Int#(32) _max(Bit#(32) pkt1, Bit#(32) pkt2);
	Int#(8)  p1_partition = unpack(pkt1[7:0]);
	Int#(8)  p2_partition = unpack(pkt2[7:0]);
	Int#(8)  p1_conv      = unpack(pkt1[15:8]);
	Int#(8)  p2_conv      = unpack(pkt2[15:8]);
	Int#(16) p1_val       = unpack(pkt1[31:16]);
	Int#(16) p2_val       = unpack(pkt2[31:16]);
	Vector#(2,Int#(32)) sort = newVector;
	if (p1_partition < p2_partition || (p1_partition == p2_partition && p1_conv < p2_conv) /*||(p1_partition == p2_partition && p1_conv == p2_conv && p1_val < p2_val)*/)
		return unpack(pkt2);
	else
		return  unpack(pkt1);
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
Reg#(Int#(32)) s11[L0];
Reg#(Int#(32)) s12[L0];
Reg#(Int#(32)) s13[L0];
Reg#(Int#(32)) s14[L0];
Reg#(Int#(32)) s15[L0];
Reg#(Int#(32)) s16[L0];
Reg#(Int#(32)) s17[L0];
Reg#(Int#(32)) s18[L0];
Reg#(Int#(32)) s19[L0];
Reg#(Int#(32)) s20[L0];
Reg#(Int#(32)) s21[L0];

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
			s1[mod*i+0] <= _min(pack(s0[mod*i+0]) , pack(s0[mod*i+0+mod/2]));
			s1[mod*i+0+mod/2] <= _max(pack(s0[mod*i+0]) , pack(s0[mod*i+0+mod/2]));
		end
		else begin
			s1[mod*i+0] <= _max(pack(s0[mod*i+0]) , pack(s0[mod*i+0+mod/2]));
			s1[mod*i+0+mod/2] <= _min(pack(s0[mod*i+0]), pack(s0[mod*i+0+mod/2]));
		end
	end
	p1.enq(1);
endrule
rule _Q12;
	p1.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			s2[mod*i+0] <= _min(pack(s1[mod*i+0]) , pack(s1[mod*i+0+mod/2]));
			s2[mod*i+0+mod/2] <= _max(pack(s1[mod*i+0]) , pack(s1[mod*i+0+mod/2]));
			s2[mod*i+1] <= _min(pack(s1[mod*i+1]) , pack(s1[mod*i+1+mod/2]));
			s2[mod*i+1+mod/2] <= _max(pack(s1[mod*i+1]) , pack(s1[mod*i+1+mod/2]));
		end
		else begin
			s2[mod*i+0] <= _max(pack(s1[mod*i+0]) , pack(s1[mod*i+0+mod/2]));
			s2[mod*i+0+mod/2] <= _min(pack(s1[mod*i+0]), pack(s1[mod*i+0+mod/2]));
			s2[mod*i+1] <= _max(pack(s1[mod*i+1]) , pack(s1[mod*i+1+mod/2]));
			s2[mod*i+1+mod/2] <= _min(pack(s1[mod*i+1]), pack(s1[mod*i+1+mod/2]));
		end
	end
	p2.enq(1);
endrule
rule _Q11;
	p2.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			s3[mod*i+0] <= _min(pack(s2[mod*i+0]) , pack(s2[mod*i+0+mod/2]));
			s3[mod*i+0+mod/2] <= _max(pack(s2[mod*i+0]) , pack(s2[mod*i+0+mod/2]));
		end
		else begin
			s3[mod*i+0] <= _max(pack(s2[mod*i+0]) , pack(s2[mod*i+0+mod/2]));
			s3[mod*i+0+mod/2] <= _min(pack(s2[mod*i+0]), pack(s2[mod*i+0+mod/2]));
		end
	end
	p3.enq(1);
endrule
rule _Q23;
	p3.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			s4[mod*i+0] <= _min(pack(s3[mod*i+0]) , pack(s3[mod*i+0+mod/2]));
			s4[mod*i+0+mod/2] <= _max(pack(s3[mod*i+0]) , pack(s3[mod*i+0+mod/2]));
			s4[mod*i+1] <= _min(pack(s3[mod*i+1]) , pack(s3[mod*i+1+mod/2]));
			s4[mod*i+1+mod/2] <= _max(pack(s3[mod*i+1]) , pack(s3[mod*i+1+mod/2]));
			s4[mod*i+2] <= _min(pack(s3[mod*i+2]) , pack(s3[mod*i+2+mod/2]));
			s4[mod*i+2+mod/2] <= _max(pack(s3[mod*i+2]) , pack(s3[mod*i+2+mod/2]));
			s4[mod*i+3] <= _min(pack(s3[mod*i+3]) , pack(s3[mod*i+3+mod/2]));
			s4[mod*i+3+mod/2] <= _max(pack(s3[mod*i+3]) , pack(s3[mod*i+3+mod/2]));
		end
		else begin
			s4[mod*i+0] <= _max(pack(s3[mod*i+0]) , pack(s3[mod*i+0+mod/2]));
			s4[mod*i+0+mod/2] <= _min(pack(s3[mod*i+0]), pack(s3[mod*i+0+mod/2]));
			s4[mod*i+1] <= _max(pack(s3[mod*i+1]) , pack(s3[mod*i+1+mod/2]));
			s4[mod*i+1+mod/2] <= _min(pack(s3[mod*i+1]), pack(s3[mod*i+1+mod/2]));
			s4[mod*i+2] <= _max(pack(s3[mod*i+2]) , pack(s3[mod*i+2+mod/2]));
			s4[mod*i+2+mod/2] <= _min(pack(s3[mod*i+2]), pack(s3[mod*i+2+mod/2]));
			s4[mod*i+3] <= _max(pack(s3[mod*i+3]) , pack(s3[mod*i+3+mod/2]));
			s4[mod*i+3+mod/2] <= _min(pack(s3[mod*i+3]), pack(s3[mod*i+3+mod/2]));
		end
	end
	p4.enq(1);
endrule
rule _Q22;
	p4.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			s5[mod*i+0] <= _min(pack(s4[mod*i+0]) , pack(s4[mod*i+0+mod/2]));
			s5[mod*i+0+mod/2] <= _max(pack(s4[mod*i+0]) , pack(s4[mod*i+0+mod/2]));
			s5[mod*i+1] <= _min(pack(s4[mod*i+1]) , pack(s4[mod*i+1+mod/2]));
			s5[mod*i+1+mod/2] <= _max(pack(s4[mod*i+1]) , pack(s4[mod*i+1+mod/2]));
		end
		else begin
			s5[mod*i+0] <= _max(pack(s4[mod*i+0]) , pack(s4[mod*i+0+mod/2]));
			s5[mod*i+0+mod/2] <= _min(pack(s4[mod*i+0]), pack(s4[mod*i+0+mod/2]));
			s5[mod*i+1] <= _max(pack(s4[mod*i+1]) , pack(s4[mod*i+1+mod/2]));
			s5[mod*i+1+mod/2] <= _min(pack(s4[mod*i+1]), pack(s4[mod*i+1+mod/2]));
		end
	end
	p5.enq(1);
endrule
rule _Q21;
	p5.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/4)%2 == 0) begin
			s6[mod*i+0] <= _min(pack(s5[mod*i+0]) , pack(s5[mod*i+0+mod/2]));
			s6[mod*i+0+mod/2] <= _max(pack(s5[mod*i+0]) , pack(s5[mod*i+0+mod/2]));
		end
		else begin
			s6[mod*i+0] <= _max(pack(s5[mod*i+0]) , pack(s5[mod*i+0+mod/2]));
			s6[mod*i+0+mod/2] <= _min(pack(s5[mod*i+0]), pack(s5[mod*i+0+mod/2]));
		end
	end
	p6.enq(1);
endrule
rule _Q34;
	p6.deq;
	let mod = 16;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			s7[mod*i+0] <= _min(pack(s6[mod*i+0]) , pack(s6[mod*i+0+mod/2]));
			s7[mod*i+0+mod/2] <= _max(pack(s6[mod*i+0]) , pack(s6[mod*i+0+mod/2]));
			s7[mod*i+1] <= _min(pack(s6[mod*i+1]) , pack(s6[mod*i+1+mod/2]));
			s7[mod*i+1+mod/2] <= _max(pack(s6[mod*i+1]) , pack(s6[mod*i+1+mod/2]));
			s7[mod*i+2] <= _min(pack(s6[mod*i+2]) , pack(s6[mod*i+2+mod/2]));
			s7[mod*i+2+mod/2] <= _max(pack(s6[mod*i+2]) , pack(s6[mod*i+2+mod/2]));
			s7[mod*i+3] <= _min(pack(s6[mod*i+3]) , pack(s6[mod*i+3+mod/2]));
			s7[mod*i+3+mod/2] <= _max(pack(s6[mod*i+3]) , pack(s6[mod*i+3+mod/2]));
			s7[mod*i+4] <= _min(pack(s6[mod*i+4]) , pack(s6[mod*i+4+mod/2]));
			s7[mod*i+4+mod/2] <= _max(pack(s6[mod*i+4]) , pack(s6[mod*i+4+mod/2]));
			s7[mod*i+5] <= _min(pack(s6[mod*i+5]) , pack(s6[mod*i+5+mod/2]));
			s7[mod*i+5+mod/2] <= _max(pack(s6[mod*i+5]) , pack(s6[mod*i+5+mod/2]));
			s7[mod*i+6] <= _min(pack(s6[mod*i+6]) , pack(s6[mod*i+6+mod/2]));
			s7[mod*i+6+mod/2] <= _max(pack(s6[mod*i+6]) , pack(s6[mod*i+6+mod/2]));
			s7[mod*i+7] <= _min(pack(s6[mod*i+7]) , pack(s6[mod*i+7+mod/2]));
			s7[mod*i+7+mod/2] <= _max(pack(s6[mod*i+7]) , pack(s6[mod*i+7+mod/2]));
		end
		else begin
			s7[mod*i+0] <= _max(pack(s6[mod*i+0]) , pack(s6[mod*i+0+mod/2]));
			s7[mod*i+0+mod/2] <= _min(pack(s6[mod*i+0]), pack(s6[mod*i+0+mod/2]));
			s7[mod*i+1] <= _max(pack(s6[mod*i+1]) , pack(s6[mod*i+1+mod/2]));
			s7[mod*i+1+mod/2] <= _min(pack(s6[mod*i+1]), pack(s6[mod*i+1+mod/2]));
			s7[mod*i+2] <= _max(pack(s6[mod*i+2]) , pack(s6[mod*i+2+mod/2]));
			s7[mod*i+2+mod/2] <= _min(pack(s6[mod*i+2]), pack(s6[mod*i+2+mod/2]));
			s7[mod*i+3] <= _max(pack(s6[mod*i+3]) , pack(s6[mod*i+3+mod/2]));
			s7[mod*i+3+mod/2] <= _min(pack(s6[mod*i+3]), pack(s6[mod*i+3+mod/2]));
			s7[mod*i+4] <= _max(pack(s6[mod*i+4]) , pack(s6[mod*i+4+mod/2]));
			s7[mod*i+4+mod/2] <= _min(pack(s6[mod*i+4]), pack(s6[mod*i+4+mod/2]));
			s7[mod*i+5] <= _max(pack(s6[mod*i+5]) , pack(s6[mod*i+5+mod/2]));
			s7[mod*i+5+mod/2] <= _min(pack(s6[mod*i+5]), pack(s6[mod*i+5+mod/2]));
			s7[mod*i+6] <= _max(pack(s6[mod*i+6]) , pack(s6[mod*i+6+mod/2]));
			s7[mod*i+6+mod/2] <= _min(pack(s6[mod*i+6]), pack(s6[mod*i+6+mod/2]));
			s7[mod*i+7] <= _max(pack(s6[mod*i+7]) , pack(s6[mod*i+7+mod/2]));
			s7[mod*i+7+mod/2] <= _min(pack(s6[mod*i+7]), pack(s6[mod*i+7+mod/2]));
		end
	end
	p7.enq(1);
endrule
rule _Q33;
	p7.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			s8[mod*i+0] <= _min(pack(s7[mod*i+0]) , pack(s7[mod*i+0+mod/2]));
			s8[mod*i+0+mod/2] <= _max(pack(s7[mod*i+0]) , pack(s7[mod*i+0+mod/2]));
			s8[mod*i+1] <= _min(pack(s7[mod*i+1]) , pack(s7[mod*i+1+mod/2]));
			s8[mod*i+1+mod/2] <= _max(pack(s7[mod*i+1]) , pack(s7[mod*i+1+mod/2]));
			s8[mod*i+2] <= _min(pack(s7[mod*i+2]) , pack(s7[mod*i+2+mod/2]));
			s8[mod*i+2+mod/2] <= _max(pack(s7[mod*i+2]) , pack(s7[mod*i+2+mod/2]));
			s8[mod*i+3] <= _min(pack(s7[mod*i+3]) , pack(s7[mod*i+3+mod/2]));
			s8[mod*i+3+mod/2] <= _max(pack(s7[mod*i+3]) , pack(s7[mod*i+3+mod/2]));
		end
		else begin
			s8[mod*i+0] <= _max(pack(s7[mod*i+0]) , pack(s7[mod*i+0+mod/2]));
			s8[mod*i+0+mod/2] <= _min(pack(s7[mod*i+0]), pack(s7[mod*i+0+mod/2]));
			s8[mod*i+1] <= _max(pack(s7[mod*i+1]) , pack(s7[mod*i+1+mod/2]));
			s8[mod*i+1+mod/2] <= _min(pack(s7[mod*i+1]), pack(s7[mod*i+1+mod/2]));
			s8[mod*i+2] <= _max(pack(s7[mod*i+2]) , pack(s7[mod*i+2+mod/2]));
			s8[mod*i+2+mod/2] <= _min(pack(s7[mod*i+2]), pack(s7[mod*i+2+mod/2]));
			s8[mod*i+3] <= _max(pack(s7[mod*i+3]) , pack(s7[mod*i+3+mod/2]));
			s8[mod*i+3+mod/2] <= _min(pack(s7[mod*i+3]), pack(s7[mod*i+3+mod/2]));
		end
	end
	p8.enq(1);
endrule
rule _Q32;
	p8.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/4)%2 == 0) begin
			s9[mod*i+0] <= _min(pack(s8[mod*i+0]) , pack(s8[mod*i+0+mod/2]));
			s9[mod*i+0+mod/2] <= _max(pack(s8[mod*i+0]) , pack(s8[mod*i+0+mod/2]));
			s9[mod*i+1] <= _min(pack(s8[mod*i+1]) , pack(s8[mod*i+1+mod/2]));
			s9[mod*i+1+mod/2] <= _max(pack(s8[mod*i+1]) , pack(s8[mod*i+1+mod/2]));
		end
		else begin
			s9[mod*i+0] <= _max(pack(s8[mod*i+0]) , pack(s8[mod*i+0+mod/2]));
			s9[mod*i+0+mod/2] <= _min(pack(s8[mod*i+0]), pack(s8[mod*i+0+mod/2]));
			s9[mod*i+1] <= _max(pack(s8[mod*i+1]) , pack(s8[mod*i+1+mod/2]));
			s9[mod*i+1+mod/2] <= _min(pack(s8[mod*i+1]), pack(s8[mod*i+1+mod/2]));
		end
	end
	p9.enq(1);
endrule
rule _Q31;
	p9.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/8)%2 == 0) begin
			s10[mod*i+0] <= _min(pack(s9[mod*i+0]) , pack(s9[mod*i+0+mod/2]));
			s10[mod*i+0+mod/2] <= _max(pack(s9[mod*i+0]) , pack(s9[mod*i+0+mod/2]));
		end
		else begin
			s10[mod*i+0] <= _max(pack(s9[mod*i+0]) , pack(s9[mod*i+0+mod/2]));
			s10[mod*i+0+mod/2] <= _min(pack(s9[mod*i+0]), pack(s9[mod*i+0+mod/2]));
		end
	end
	p10.enq(1);
endrule
rule _Q45;
	p10.deq;
	let mod = 32;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			s11[mod*i+0] <= _min(pack(s10[mod*i+0]) , pack(s10[mod*i+0+mod/2]));
			s11[mod*i+0+mod/2] <= _max(pack(s10[mod*i+0]) , pack(s10[mod*i+0+mod/2]));
			s11[mod*i+1] <= _min(pack(s10[mod*i+1]) , pack(s10[mod*i+1+mod/2]));
			s11[mod*i+1+mod/2] <= _max(pack(s10[mod*i+1]) , pack(s10[mod*i+1+mod/2]));
			s11[mod*i+2] <= _min(pack(s10[mod*i+2]) , pack(s10[mod*i+2+mod/2]));
			s11[mod*i+2+mod/2] <= _max(pack(s10[mod*i+2]) , pack(s10[mod*i+2+mod/2]));
			s11[mod*i+3] <= _min(pack(s10[mod*i+3]) , pack(s10[mod*i+3+mod/2]));
			s11[mod*i+3+mod/2] <= _max(pack(s10[mod*i+3]) , pack(s10[mod*i+3+mod/2]));
			s11[mod*i+4] <= _min(pack(s10[mod*i+4]) , pack(s10[mod*i+4+mod/2]));
			s11[mod*i+4+mod/2] <= _max(pack(s10[mod*i+4]) , pack(s10[mod*i+4+mod/2]));
			s11[mod*i+5] <= _min(pack(s10[mod*i+5]) , pack(s10[mod*i+5+mod/2]));
			s11[mod*i+5+mod/2] <= _max(pack(s10[mod*i+5]) , pack(s10[mod*i+5+mod/2]));
			s11[mod*i+6] <= _min(pack(s10[mod*i+6]) , pack(s10[mod*i+6+mod/2]));
			s11[mod*i+6+mod/2] <= _max(pack(s10[mod*i+6]) , pack(s10[mod*i+6+mod/2]));
			s11[mod*i+7] <= _min(pack(s10[mod*i+7]) , pack(s10[mod*i+7+mod/2]));
			s11[mod*i+7+mod/2] <= _max(pack(s10[mod*i+7]) , pack(s10[mod*i+7+mod/2]));
			s11[mod*i+8] <= _min(pack(s10[mod*i+8]) , pack(s10[mod*i+8+mod/2]));
			s11[mod*i+8+mod/2] <= _max(pack(s10[mod*i+8]) , pack(s10[mod*i+8+mod/2]));
			s11[mod*i+9] <= _min(pack(s10[mod*i+9]) , pack(s10[mod*i+9+mod/2]));
			s11[mod*i+9+mod/2] <= _max(pack(s10[mod*i+9]) , pack(s10[mod*i+9+mod/2]));
			s11[mod*i+10] <= _min(pack(s10[mod*i+10]) , pack(s10[mod*i+10+mod/2]));
			s11[mod*i+10+mod/2] <= _max(pack(s10[mod*i+10]) , pack(s10[mod*i+10+mod/2]));
			s11[mod*i+11] <= _min(pack(s10[mod*i+11]) , pack(s10[mod*i+11+mod/2]));
			s11[mod*i+11+mod/2] <= _max(pack(s10[mod*i+11]) , pack(s10[mod*i+11+mod/2]));
			s11[mod*i+12] <= _min(pack(s10[mod*i+12]) , pack(s10[mod*i+12+mod/2]));
			s11[mod*i+12+mod/2] <= _max(pack(s10[mod*i+12]) , pack(s10[mod*i+12+mod/2]));
			s11[mod*i+13] <= _min(pack(s10[mod*i+13]) , pack(s10[mod*i+13+mod/2]));
			s11[mod*i+13+mod/2] <= _max(pack(s10[mod*i+13]) , pack(s10[mod*i+13+mod/2]));
			s11[mod*i+14] <= _min(pack(s10[mod*i+14]) , pack(s10[mod*i+14+mod/2]));
			s11[mod*i+14+mod/2] <= _max(pack(s10[mod*i+14]) , pack(s10[mod*i+14+mod/2]));
			s11[mod*i+15] <= _min(pack(s10[mod*i+15]) , pack(s10[mod*i+15+mod/2]));
			s11[mod*i+15+mod/2] <= _max(pack(s10[mod*i+15]) , pack(s10[mod*i+15+mod/2]));
		end
		else begin
			s11[mod*i+0] <= _max(pack(s10[mod*i+0]) , pack(s10[mod*i+0+mod/2]));
			s11[mod*i+0+mod/2] <= _min(pack(s10[mod*i+0]), pack(s10[mod*i+0+mod/2]));
			s11[mod*i+1] <= _max(pack(s10[mod*i+1]) , pack(s10[mod*i+1+mod/2]));
			s11[mod*i+1+mod/2] <= _min(pack(s10[mod*i+1]), pack(s10[mod*i+1+mod/2]));
			s11[mod*i+2] <= _max(pack(s10[mod*i+2]) , pack(s10[mod*i+2+mod/2]));
			s11[mod*i+2+mod/2] <= _min(pack(s10[mod*i+2]), pack(s10[mod*i+2+mod/2]));
			s11[mod*i+3] <= _max(pack(s10[mod*i+3]) , pack(s10[mod*i+3+mod/2]));
			s11[mod*i+3+mod/2] <= _min(pack(s10[mod*i+3]), pack(s10[mod*i+3+mod/2]));
			s11[mod*i+4] <= _max(pack(s10[mod*i+4]) , pack(s10[mod*i+4+mod/2]));
			s11[mod*i+4+mod/2] <= _min(pack(s10[mod*i+4]), pack(s10[mod*i+4+mod/2]));
			s11[mod*i+5] <= _max(pack(s10[mod*i+5]) , pack(s10[mod*i+5+mod/2]));
			s11[mod*i+5+mod/2] <= _min(pack(s10[mod*i+5]), pack(s10[mod*i+5+mod/2]));
			s11[mod*i+6] <= _max(pack(s10[mod*i+6]) , pack(s10[mod*i+6+mod/2]));
			s11[mod*i+6+mod/2] <= _min(pack(s10[mod*i+6]), pack(s10[mod*i+6+mod/2]));
			s11[mod*i+7] <= _max(pack(s10[mod*i+7]) , pack(s10[mod*i+7+mod/2]));
			s11[mod*i+7+mod/2] <= _min(pack(s10[mod*i+7]), pack(s10[mod*i+7+mod/2]));
			s11[mod*i+8] <= _max(pack(s10[mod*i+8]) , pack(s10[mod*i+8+mod/2]));
			s11[mod*i+8+mod/2] <= _min(pack(s10[mod*i+8]), pack(s10[mod*i+8+mod/2]));
			s11[mod*i+9] <= _max(pack(s10[mod*i+9]) , pack(s10[mod*i+9+mod/2]));
			s11[mod*i+9+mod/2] <= _min(pack(s10[mod*i+9]), pack(s10[mod*i+9+mod/2]));
			s11[mod*i+10] <= _max(pack(s10[mod*i+10]) , pack(s10[mod*i+10+mod/2]));
			s11[mod*i+10+mod/2] <= _min(pack(s10[mod*i+10]), pack(s10[mod*i+10+mod/2]));
			s11[mod*i+11] <= _max(pack(s10[mod*i+11]) , pack(s10[mod*i+11+mod/2]));
			s11[mod*i+11+mod/2] <= _min(pack(s10[mod*i+11]), pack(s10[mod*i+11+mod/2]));
			s11[mod*i+12] <= _max(pack(s10[mod*i+12]) , pack(s10[mod*i+12+mod/2]));
			s11[mod*i+12+mod/2] <= _min(pack(s10[mod*i+12]), pack(s10[mod*i+12+mod/2]));
			s11[mod*i+13] <= _max(pack(s10[mod*i+13]) , pack(s10[mod*i+13+mod/2]));
			s11[mod*i+13+mod/2] <= _min(pack(s10[mod*i+13]), pack(s10[mod*i+13+mod/2]));
			s11[mod*i+14] <= _max(pack(s10[mod*i+14]) , pack(s10[mod*i+14+mod/2]));
			s11[mod*i+14+mod/2] <= _min(pack(s10[mod*i+14]), pack(s10[mod*i+14+mod/2]));
			s11[mod*i+15] <= _max(pack(s10[mod*i+15]) , pack(s10[mod*i+15+mod/2]));
			s11[mod*i+15+mod/2] <= _min(pack(s10[mod*i+15]), pack(s10[mod*i+15+mod/2]));
		end
	end
	p11.enq(1);
endrule
rule _Q44;
	p11.deq;
	let mod = 16;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			s12[mod*i+0] <= _min(pack(s11[mod*i+0]) , pack(s11[mod*i+0+mod/2]));
			s12[mod*i+0+mod/2] <= _max(pack(s11[mod*i+0]) , pack(s11[mod*i+0+mod/2]));
			s12[mod*i+1] <= _min(pack(s11[mod*i+1]) , pack(s11[mod*i+1+mod/2]));
			s12[mod*i+1+mod/2] <= _max(pack(s11[mod*i+1]) , pack(s11[mod*i+1+mod/2]));
			s12[mod*i+2] <= _min(pack(s11[mod*i+2]) , pack(s11[mod*i+2+mod/2]));
			s12[mod*i+2+mod/2] <= _max(pack(s11[mod*i+2]) , pack(s11[mod*i+2+mod/2]));
			s12[mod*i+3] <= _min(pack(s11[mod*i+3]) , pack(s11[mod*i+3+mod/2]));
			s12[mod*i+3+mod/2] <= _max(pack(s11[mod*i+3]) , pack(s11[mod*i+3+mod/2]));
			s12[mod*i+4] <= _min(pack(s11[mod*i+4]) , pack(s11[mod*i+4+mod/2]));
			s12[mod*i+4+mod/2] <= _max(pack(s11[mod*i+4]) , pack(s11[mod*i+4+mod/2]));
			s12[mod*i+5] <= _min(pack(s11[mod*i+5]) , pack(s11[mod*i+5+mod/2]));
			s12[mod*i+5+mod/2] <= _max(pack(s11[mod*i+5]) , pack(s11[mod*i+5+mod/2]));
			s12[mod*i+6] <= _min(pack(s11[mod*i+6]) , pack(s11[mod*i+6+mod/2]));
			s12[mod*i+6+mod/2] <= _max(pack(s11[mod*i+6]) , pack(s11[mod*i+6+mod/2]));
			s12[mod*i+7] <= _min(pack(s11[mod*i+7]) , pack(s11[mod*i+7+mod/2]));
			s12[mod*i+7+mod/2] <= _max(pack(s11[mod*i+7]) , pack(s11[mod*i+7+mod/2]));
		end
		else begin
			s12[mod*i+0] <= _max(pack(s11[mod*i+0]) , pack(s11[mod*i+0+mod/2]));
			s12[mod*i+0+mod/2] <= _min(pack(s11[mod*i+0]), pack(s11[mod*i+0+mod/2]));
			s12[mod*i+1] <= _max(pack(s11[mod*i+1]) , pack(s11[mod*i+1+mod/2]));
			s12[mod*i+1+mod/2] <= _min(pack(s11[mod*i+1]), pack(s11[mod*i+1+mod/2]));
			s12[mod*i+2] <= _max(pack(s11[mod*i+2]) , pack(s11[mod*i+2+mod/2]));
			s12[mod*i+2+mod/2] <= _min(pack(s11[mod*i+2]), pack(s11[mod*i+2+mod/2]));
			s12[mod*i+3] <= _max(pack(s11[mod*i+3]) , pack(s11[mod*i+3+mod/2]));
			s12[mod*i+3+mod/2] <= _min(pack(s11[mod*i+3]), pack(s11[mod*i+3+mod/2]));
			s12[mod*i+4] <= _max(pack(s11[mod*i+4]) , pack(s11[mod*i+4+mod/2]));
			s12[mod*i+4+mod/2] <= _min(pack(s11[mod*i+4]), pack(s11[mod*i+4+mod/2]));
			s12[mod*i+5] <= _max(pack(s11[mod*i+5]) , pack(s11[mod*i+5+mod/2]));
			s12[mod*i+5+mod/2] <= _min(pack(s11[mod*i+5]), pack(s11[mod*i+5+mod/2]));
			s12[mod*i+6] <= _max(pack(s11[mod*i+6]) , pack(s11[mod*i+6+mod/2]));
			s12[mod*i+6+mod/2] <= _min(pack(s11[mod*i+6]), pack(s11[mod*i+6+mod/2]));
			s12[mod*i+7] <= _max(pack(s11[mod*i+7]) , pack(s11[mod*i+7+mod/2]));
			s12[mod*i+7+mod/2] <= _min(pack(s11[mod*i+7]), pack(s11[mod*i+7+mod/2]));
		end
	end
	p12.enq(1);
endrule
rule _Q43;
	p12.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/4)%2 == 0) begin
			s13[mod*i+0] <= _min(pack(s12[mod*i+0]) , pack(s12[mod*i+0+mod/2]));
			s13[mod*i+0+mod/2] <= _max(pack(s12[mod*i+0]) , pack(s12[mod*i+0+mod/2]));
			s13[mod*i+1] <= _min(pack(s12[mod*i+1]) , pack(s12[mod*i+1+mod/2]));
			s13[mod*i+1+mod/2] <= _max(pack(s12[mod*i+1]) , pack(s12[mod*i+1+mod/2]));
			s13[mod*i+2] <= _min(pack(s12[mod*i+2]) , pack(s12[mod*i+2+mod/2]));
			s13[mod*i+2+mod/2] <= _max(pack(s12[mod*i+2]) , pack(s12[mod*i+2+mod/2]));
			s13[mod*i+3] <= _min(pack(s12[mod*i+3]) , pack(s12[mod*i+3+mod/2]));
			s13[mod*i+3+mod/2] <= _max(pack(s12[mod*i+3]) , pack(s12[mod*i+3+mod/2]));
		end
		else begin
			s13[mod*i+0] <= _max(pack(s12[mod*i+0]) , pack(s12[mod*i+0+mod/2]));
			s13[mod*i+0+mod/2] <= _min(pack(s12[mod*i+0]), pack(s12[mod*i+0+mod/2]));
			s13[mod*i+1] <= _max(pack(s12[mod*i+1]) , pack(s12[mod*i+1+mod/2]));
			s13[mod*i+1+mod/2] <= _min(pack(s12[mod*i+1]), pack(s12[mod*i+1+mod/2]));
			s13[mod*i+2] <= _max(pack(s12[mod*i+2]) , pack(s12[mod*i+2+mod/2]));
			s13[mod*i+2+mod/2] <= _min(pack(s12[mod*i+2]), pack(s12[mod*i+2+mod/2]));
			s13[mod*i+3] <= _max(pack(s12[mod*i+3]) , pack(s12[mod*i+3+mod/2]));
			s13[mod*i+3+mod/2] <= _min(pack(s12[mod*i+3]), pack(s12[mod*i+3+mod/2]));
		end
	end
	p13.enq(1);
endrule
rule _Q42;
	p13.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/8)%2 == 0) begin
			s14[mod*i+0] <= _min(pack(s13[mod*i+0]) , pack(s13[mod*i+0+mod/2]));
			s14[mod*i+0+mod/2] <= _max(pack(s13[mod*i+0]) , pack(s13[mod*i+0+mod/2]));
			s14[mod*i+1] <= _min(pack(s13[mod*i+1]) , pack(s13[mod*i+1+mod/2]));
			s14[mod*i+1+mod/2] <= _max(pack(s13[mod*i+1]) , pack(s13[mod*i+1+mod/2]));
		end
		else begin
			s14[mod*i+0] <= _max(pack(s13[mod*i+0]) , pack(s13[mod*i+0+mod/2]));
			s14[mod*i+0+mod/2] <= _min(pack(s13[mod*i+0]), pack(s13[mod*i+0+mod/2]));
			s14[mod*i+1] <= _max(pack(s13[mod*i+1]) , pack(s13[mod*i+1+mod/2]));
			s14[mod*i+1+mod/2] <= _min(pack(s13[mod*i+1]), pack(s13[mod*i+1+mod/2]));
		end
	end
	p14.enq(1);
endrule
rule _Q41;
	p14.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/16)%2 == 0) begin
			s15[mod*i+0] <= _min(pack(s14[mod*i+0]) , pack(s14[mod*i+0+mod/2]));
			s15[mod*i+0+mod/2] <= _max(pack(s14[mod*i+0]) , pack(s14[mod*i+0+mod/2]));
		end
		else begin
			s15[mod*i+0] <= _max(pack(s14[mod*i+0]) , pack(s14[mod*i+0+mod/2]));
			s15[mod*i+0+mod/2] <= _min(pack(s14[mod*i+0]), pack(s14[mod*i+0+mod/2]));
		end
	end
	p15.enq(1);
endrule
rule _Q56;
	p15.deq;
	let mod = 64;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/1)%2 == 0) begin
			s16[mod*i+0] <= _min(pack(s15[mod*i+0]) , pack(s15[mod*i+0+mod/2]));
			s16[mod*i+0+mod/2] <= _max(pack(s15[mod*i+0]) , pack(s15[mod*i+0+mod/2]));
			s16[mod*i+1] <= _min(pack(s15[mod*i+1]) , pack(s15[mod*i+1+mod/2]));
			s16[mod*i+1+mod/2] <= _max(pack(s15[mod*i+1]) , pack(s15[mod*i+1+mod/2]));
			s16[mod*i+2] <= _min(pack(s15[mod*i+2]) , pack(s15[mod*i+2+mod/2]));
			s16[mod*i+2+mod/2] <= _max(pack(s15[mod*i+2]) , pack(s15[mod*i+2+mod/2]));
			s16[mod*i+3] <= _min(pack(s15[mod*i+3]) , pack(s15[mod*i+3+mod/2]));
			s16[mod*i+3+mod/2] <= _max(pack(s15[mod*i+3]) , pack(s15[mod*i+3+mod/2]));
			s16[mod*i+4] <= _min(pack(s15[mod*i+4]) , pack(s15[mod*i+4+mod/2]));
			s16[mod*i+4+mod/2] <= _max(pack(s15[mod*i+4]) , pack(s15[mod*i+4+mod/2]));
			s16[mod*i+5] <= _min(pack(s15[mod*i+5]) , pack(s15[mod*i+5+mod/2]));
			s16[mod*i+5+mod/2] <= _max(pack(s15[mod*i+5]) , pack(s15[mod*i+5+mod/2]));
			s16[mod*i+6] <= _min(pack(s15[mod*i+6]) , pack(s15[mod*i+6+mod/2]));
			s16[mod*i+6+mod/2] <= _max(pack(s15[mod*i+6]) , pack(s15[mod*i+6+mod/2]));
			s16[mod*i+7] <= _min(pack(s15[mod*i+7]) , pack(s15[mod*i+7+mod/2]));
			s16[mod*i+7+mod/2] <= _max(pack(s15[mod*i+7]) , pack(s15[mod*i+7+mod/2]));
			s16[mod*i+8] <= _min(pack(s15[mod*i+8]) , pack(s15[mod*i+8+mod/2]));
			s16[mod*i+8+mod/2] <= _max(pack(s15[mod*i+8]) , pack(s15[mod*i+8+mod/2]));
			s16[mod*i+9] <= _min(pack(s15[mod*i+9]) , pack(s15[mod*i+9+mod/2]));
			s16[mod*i+9+mod/2] <= _max(pack(s15[mod*i+9]) , pack(s15[mod*i+9+mod/2]));
			s16[mod*i+10] <= _min(pack(s15[mod*i+10]) , pack(s15[mod*i+10+mod/2]));
			s16[mod*i+10+mod/2] <= _max(pack(s15[mod*i+10]) , pack(s15[mod*i+10+mod/2]));
			s16[mod*i+11] <= _min(pack(s15[mod*i+11]) , pack(s15[mod*i+11+mod/2]));
			s16[mod*i+11+mod/2] <= _max(pack(s15[mod*i+11]) , pack(s15[mod*i+11+mod/2]));
			s16[mod*i+12] <= _min(pack(s15[mod*i+12]) , pack(s15[mod*i+12+mod/2]));
			s16[mod*i+12+mod/2] <= _max(pack(s15[mod*i+12]) , pack(s15[mod*i+12+mod/2]));
			s16[mod*i+13] <= _min(pack(s15[mod*i+13]) , pack(s15[mod*i+13+mod/2]));
			s16[mod*i+13+mod/2] <= _max(pack(s15[mod*i+13]) , pack(s15[mod*i+13+mod/2]));
			s16[mod*i+14] <= _min(pack(s15[mod*i+14]) , pack(s15[mod*i+14+mod/2]));
			s16[mod*i+14+mod/2] <= _max(pack(s15[mod*i+14]) , pack(s15[mod*i+14+mod/2]));
			s16[mod*i+15] <= _min(pack(s15[mod*i+15]) , pack(s15[mod*i+15+mod/2]));
			s16[mod*i+15+mod/2] <= _max(pack(s15[mod*i+15]) , pack(s15[mod*i+15+mod/2]));
			s16[mod*i+16] <= _min(pack(s15[mod*i+16]) , pack(s15[mod*i+16+mod/2]));
			s16[mod*i+16+mod/2] <= _max(pack(s15[mod*i+16]) , pack(s15[mod*i+16+mod/2]));
			s16[mod*i+17] <= _min(pack(s15[mod*i+17]) , pack(s15[mod*i+17+mod/2]));
			s16[mod*i+17+mod/2] <= _max(pack(s15[mod*i+17]) , pack(s15[mod*i+17+mod/2]));
			s16[mod*i+18] <= _min(pack(s15[mod*i+18]) , pack(s15[mod*i+18+mod/2]));
			s16[mod*i+18+mod/2] <= _max(pack(s15[mod*i+18]) , pack(s15[mod*i+18+mod/2]));
			s16[mod*i+19] <= _min(pack(s15[mod*i+19]) , pack(s15[mod*i+19+mod/2]));
			s16[mod*i+19+mod/2] <= _max(pack(s15[mod*i+19]) , pack(s15[mod*i+19+mod/2]));
			s16[mod*i+20] <= _min(pack(s15[mod*i+20]) , pack(s15[mod*i+20+mod/2]));
			s16[mod*i+20+mod/2] <= _max(pack(s15[mod*i+20]) , pack(s15[mod*i+20+mod/2]));
			s16[mod*i+21] <= _min(pack(s15[mod*i+21]) , pack(s15[mod*i+21+mod/2]));
			s16[mod*i+21+mod/2] <= _max(pack(s15[mod*i+21]) , pack(s15[mod*i+21+mod/2]));
			s16[mod*i+22] <= _min(pack(s15[mod*i+22]) , pack(s15[mod*i+22+mod/2]));
			s16[mod*i+22+mod/2] <= _max(pack(s15[mod*i+22]) , pack(s15[mod*i+22+mod/2]));
			s16[mod*i+23] <= _min(pack(s15[mod*i+23]) , pack(s15[mod*i+23+mod/2]));
			s16[mod*i+23+mod/2] <= _max(pack(s15[mod*i+23]) , pack(s15[mod*i+23+mod/2]));
			s16[mod*i+24] <= _min(pack(s15[mod*i+24]) , pack(s15[mod*i+24+mod/2]));
			s16[mod*i+24+mod/2] <= _max(pack(s15[mod*i+24]) , pack(s15[mod*i+24+mod/2]));
			s16[mod*i+25] <= _min(pack(s15[mod*i+25]) , pack(s15[mod*i+25+mod/2]));
			s16[mod*i+25+mod/2] <= _max(pack(s15[mod*i+25]) , pack(s15[mod*i+25+mod/2]));
			s16[mod*i+26] <= _min(pack(s15[mod*i+26]) , pack(s15[mod*i+26+mod/2]));
			s16[mod*i+26+mod/2] <= _max(pack(s15[mod*i+26]) , pack(s15[mod*i+26+mod/2]));
			s16[mod*i+27] <= _min(pack(s15[mod*i+27]) , pack(s15[mod*i+27+mod/2]));
			s16[mod*i+27+mod/2] <= _max(pack(s15[mod*i+27]) , pack(s15[mod*i+27+mod/2]));
			s16[mod*i+28] <= _min(pack(s15[mod*i+28]) , pack(s15[mod*i+28+mod/2]));
			s16[mod*i+28+mod/2] <= _max(pack(s15[mod*i+28]) , pack(s15[mod*i+28+mod/2]));
			s16[mod*i+29] <= _min(pack(s15[mod*i+29]) , pack(s15[mod*i+29+mod/2]));
			s16[mod*i+29+mod/2] <= _max(pack(s15[mod*i+29]) , pack(s15[mod*i+29+mod/2]));
			s16[mod*i+30] <= _min(pack(s15[mod*i+30]) , pack(s15[mod*i+30+mod/2]));
			s16[mod*i+30+mod/2] <= _max(pack(s15[mod*i+30]) , pack(s15[mod*i+30+mod/2]));
			s16[mod*i+31] <= _min(pack(s15[mod*i+31]) , pack(s15[mod*i+31+mod/2]));
			s16[mod*i+31+mod/2] <= _max(pack(s15[mod*i+31]) , pack(s15[mod*i+31+mod/2]));
		end
		else begin
			s16[mod*i+0] <= _max(pack(s15[mod*i+0]) , pack(s15[mod*i+0+mod/2]));
			s16[mod*i+0+mod/2] <= _min(pack(s15[mod*i+0]), pack(s15[mod*i+0+mod/2]));
			s16[mod*i+1] <= _max(pack(s15[mod*i+1]) , pack(s15[mod*i+1+mod/2]));
			s16[mod*i+1+mod/2] <= _min(pack(s15[mod*i+1]), pack(s15[mod*i+1+mod/2]));
			s16[mod*i+2] <= _max(pack(s15[mod*i+2]) , pack(s15[mod*i+2+mod/2]));
			s16[mod*i+2+mod/2] <= _min(pack(s15[mod*i+2]), pack(s15[mod*i+2+mod/2]));
			s16[mod*i+3] <= _max(pack(s15[mod*i+3]) , pack(s15[mod*i+3+mod/2]));
			s16[mod*i+3+mod/2] <= _min(pack(s15[mod*i+3]), pack(s15[mod*i+3+mod/2]));
			s16[mod*i+4] <= _max(pack(s15[mod*i+4]) , pack(s15[mod*i+4+mod/2]));
			s16[mod*i+4+mod/2] <= _min(pack(s15[mod*i+4]), pack(s15[mod*i+4+mod/2]));
			s16[mod*i+5] <= _max(pack(s15[mod*i+5]) , pack(s15[mod*i+5+mod/2]));
			s16[mod*i+5+mod/2] <= _min(pack(s15[mod*i+5]), pack(s15[mod*i+5+mod/2]));
			s16[mod*i+6] <= _max(pack(s15[mod*i+6]) , pack(s15[mod*i+6+mod/2]));
			s16[mod*i+6+mod/2] <= _min(pack(s15[mod*i+6]), pack(s15[mod*i+6+mod/2]));
			s16[mod*i+7] <= _max(pack(s15[mod*i+7]) , pack(s15[mod*i+7+mod/2]));
			s16[mod*i+7+mod/2] <= _min(pack(s15[mod*i+7]), pack(s15[mod*i+7+mod/2]));
			s16[mod*i+8] <= _max(pack(s15[mod*i+8]) , pack(s15[mod*i+8+mod/2]));
			s16[mod*i+8+mod/2] <= _min(pack(s15[mod*i+8]), pack(s15[mod*i+8+mod/2]));
			s16[mod*i+9] <= _max(pack(s15[mod*i+9]) , pack(s15[mod*i+9+mod/2]));
			s16[mod*i+9+mod/2] <= _min(pack(s15[mod*i+9]), pack(s15[mod*i+9+mod/2]));
			s16[mod*i+10] <= _max(pack(s15[mod*i+10]) , pack(s15[mod*i+10+mod/2]));
			s16[mod*i+10+mod/2] <= _min(pack(s15[mod*i+10]), pack(s15[mod*i+10+mod/2]));
			s16[mod*i+11] <= _max(pack(s15[mod*i+11]) , pack(s15[mod*i+11+mod/2]));
			s16[mod*i+11+mod/2] <= _min(pack(s15[mod*i+11]), pack(s15[mod*i+11+mod/2]));
			s16[mod*i+12] <= _max(pack(s15[mod*i+12]) , pack(s15[mod*i+12+mod/2]));
			s16[mod*i+12+mod/2] <= _min(pack(s15[mod*i+12]), pack(s15[mod*i+12+mod/2]));
			s16[mod*i+13] <= _max(pack(s15[mod*i+13]) , pack(s15[mod*i+13+mod/2]));
			s16[mod*i+13+mod/2] <= _min(pack(s15[mod*i+13]), pack(s15[mod*i+13+mod/2]));
			s16[mod*i+14] <= _max(pack(s15[mod*i+14]) , pack(s15[mod*i+14+mod/2]));
			s16[mod*i+14+mod/2] <= _min(pack(s15[mod*i+14]), pack(s15[mod*i+14+mod/2]));
			s16[mod*i+15] <= _max(pack(s15[mod*i+15]) , pack(s15[mod*i+15+mod/2]));
			s16[mod*i+15+mod/2] <= _min(pack(s15[mod*i+15]), pack(s15[mod*i+15+mod/2]));
			s16[mod*i+16] <= _max(pack(s15[mod*i+16]) , pack(s15[mod*i+16+mod/2]));
			s16[mod*i+16+mod/2] <= _min(pack(s15[mod*i+16]), pack(s15[mod*i+16+mod/2]));
			s16[mod*i+17] <= _max(pack(s15[mod*i+17]) , pack(s15[mod*i+17+mod/2]));
			s16[mod*i+17+mod/2] <= _min(pack(s15[mod*i+17]), pack(s15[mod*i+17+mod/2]));
			s16[mod*i+18] <= _max(pack(s15[mod*i+18]) , pack(s15[mod*i+18+mod/2]));
			s16[mod*i+18+mod/2] <= _min(pack(s15[mod*i+18]), pack(s15[mod*i+18+mod/2]));
			s16[mod*i+19] <= _max(pack(s15[mod*i+19]) , pack(s15[mod*i+19+mod/2]));
			s16[mod*i+19+mod/2] <= _min(pack(s15[mod*i+19]), pack(s15[mod*i+19+mod/2]));
			s16[mod*i+20] <= _max(pack(s15[mod*i+20]) , pack(s15[mod*i+20+mod/2]));
			s16[mod*i+20+mod/2] <= _min(pack(s15[mod*i+20]), pack(s15[mod*i+20+mod/2]));
			s16[mod*i+21] <= _max(pack(s15[mod*i+21]) , pack(s15[mod*i+21+mod/2]));
			s16[mod*i+21+mod/2] <= _min(pack(s15[mod*i+21]), pack(s15[mod*i+21+mod/2]));
			s16[mod*i+22] <= _max(pack(s15[mod*i+22]) , pack(s15[mod*i+22+mod/2]));
			s16[mod*i+22+mod/2] <= _min(pack(s15[mod*i+22]), pack(s15[mod*i+22+mod/2]));
			s16[mod*i+23] <= _max(pack(s15[mod*i+23]) , pack(s15[mod*i+23+mod/2]));
			s16[mod*i+23+mod/2] <= _min(pack(s15[mod*i+23]), pack(s15[mod*i+23+mod/2]));
			s16[mod*i+24] <= _max(pack(s15[mod*i+24]) , pack(s15[mod*i+24+mod/2]));
			s16[mod*i+24+mod/2] <= _min(pack(s15[mod*i+24]), pack(s15[mod*i+24+mod/2]));
			s16[mod*i+25] <= _max(pack(s15[mod*i+25]) , pack(s15[mod*i+25+mod/2]));
			s16[mod*i+25+mod/2] <= _min(pack(s15[mod*i+25]), pack(s15[mod*i+25+mod/2]));
			s16[mod*i+26] <= _max(pack(s15[mod*i+26]) , pack(s15[mod*i+26+mod/2]));
			s16[mod*i+26+mod/2] <= _min(pack(s15[mod*i+26]), pack(s15[mod*i+26+mod/2]));
			s16[mod*i+27] <= _max(pack(s15[mod*i+27]) , pack(s15[mod*i+27+mod/2]));
			s16[mod*i+27+mod/2] <= _min(pack(s15[mod*i+27]), pack(s15[mod*i+27+mod/2]));
			s16[mod*i+28] <= _max(pack(s15[mod*i+28]) , pack(s15[mod*i+28+mod/2]));
			s16[mod*i+28+mod/2] <= _min(pack(s15[mod*i+28]), pack(s15[mod*i+28+mod/2]));
			s16[mod*i+29] <= _max(pack(s15[mod*i+29]) , pack(s15[mod*i+29+mod/2]));
			s16[mod*i+29+mod/2] <= _min(pack(s15[mod*i+29]), pack(s15[mod*i+29+mod/2]));
			s16[mod*i+30] <= _max(pack(s15[mod*i+30]) , pack(s15[mod*i+30+mod/2]));
			s16[mod*i+30+mod/2] <= _min(pack(s15[mod*i+30]), pack(s15[mod*i+30+mod/2]));
			s16[mod*i+31] <= _max(pack(s15[mod*i+31]) , pack(s15[mod*i+31+mod/2]));
			s16[mod*i+31+mod/2] <= _min(pack(s15[mod*i+31]), pack(s15[mod*i+31+mod/2]));
		end
	end
	p16.enq(1);
endrule
rule _Q55;
	p16.deq;
	let mod = 32;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/2)%2 == 0) begin
			s17[mod*i+0] <= _min(pack(s16[mod*i+0]) , pack(s16[mod*i+0+mod/2]));
			s17[mod*i+0+mod/2] <= _max(pack(s16[mod*i+0]) , pack(s16[mod*i+0+mod/2]));
			s17[mod*i+1] <= _min(pack(s16[mod*i+1]) , pack(s16[mod*i+1+mod/2]));
			s17[mod*i+1+mod/2] <= _max(pack(s16[mod*i+1]) , pack(s16[mod*i+1+mod/2]));
			s17[mod*i+2] <= _min(pack(s16[mod*i+2]) , pack(s16[mod*i+2+mod/2]));
			s17[mod*i+2+mod/2] <= _max(pack(s16[mod*i+2]) , pack(s16[mod*i+2+mod/2]));
			s17[mod*i+3] <= _min(pack(s16[mod*i+3]) , pack(s16[mod*i+3+mod/2]));
			s17[mod*i+3+mod/2] <= _max(pack(s16[mod*i+3]) , pack(s16[mod*i+3+mod/2]));
			s17[mod*i+4] <= _min(pack(s16[mod*i+4]) , pack(s16[mod*i+4+mod/2]));
			s17[mod*i+4+mod/2] <= _max(pack(s16[mod*i+4]) , pack(s16[mod*i+4+mod/2]));
			s17[mod*i+5] <= _min(pack(s16[mod*i+5]) , pack(s16[mod*i+5+mod/2]));
			s17[mod*i+5+mod/2] <= _max(pack(s16[mod*i+5]) , pack(s16[mod*i+5+mod/2]));
			s17[mod*i+6] <= _min(pack(s16[mod*i+6]) , pack(s16[mod*i+6+mod/2]));
			s17[mod*i+6+mod/2] <= _max(pack(s16[mod*i+6]) , pack(s16[mod*i+6+mod/2]));
			s17[mod*i+7] <= _min(pack(s16[mod*i+7]) , pack(s16[mod*i+7+mod/2]));
			s17[mod*i+7+mod/2] <= _max(pack(s16[mod*i+7]) , pack(s16[mod*i+7+mod/2]));
			s17[mod*i+8] <= _min(pack(s16[mod*i+8]) , pack(s16[mod*i+8+mod/2]));
			s17[mod*i+8+mod/2] <= _max(pack(s16[mod*i+8]) , pack(s16[mod*i+8+mod/2]));
			s17[mod*i+9] <= _min(pack(s16[mod*i+9]) , pack(s16[mod*i+9+mod/2]));
			s17[mod*i+9+mod/2] <= _max(pack(s16[mod*i+9]) , pack(s16[mod*i+9+mod/2]));
			s17[mod*i+10] <= _min(pack(s16[mod*i+10]) , pack(s16[mod*i+10+mod/2]));
			s17[mod*i+10+mod/2] <= _max(pack(s16[mod*i+10]) , pack(s16[mod*i+10+mod/2]));
			s17[mod*i+11] <= _min(pack(s16[mod*i+11]) , pack(s16[mod*i+11+mod/2]));
			s17[mod*i+11+mod/2] <= _max(pack(s16[mod*i+11]) , pack(s16[mod*i+11+mod/2]));
			s17[mod*i+12] <= _min(pack(s16[mod*i+12]) , pack(s16[mod*i+12+mod/2]));
			s17[mod*i+12+mod/2] <= _max(pack(s16[mod*i+12]) , pack(s16[mod*i+12+mod/2]));
			s17[mod*i+13] <= _min(pack(s16[mod*i+13]) , pack(s16[mod*i+13+mod/2]));
			s17[mod*i+13+mod/2] <= _max(pack(s16[mod*i+13]) , pack(s16[mod*i+13+mod/2]));
			s17[mod*i+14] <= _min(pack(s16[mod*i+14]) , pack(s16[mod*i+14+mod/2]));
			s17[mod*i+14+mod/2] <= _max(pack(s16[mod*i+14]) , pack(s16[mod*i+14+mod/2]));
			s17[mod*i+15] <= _min(pack(s16[mod*i+15]) , pack(s16[mod*i+15+mod/2]));
			s17[mod*i+15+mod/2] <= _max(pack(s16[mod*i+15]) , pack(s16[mod*i+15+mod/2]));
		end
		else begin
			s17[mod*i+0] <= _max(pack(s16[mod*i+0]) , pack(s16[mod*i+0+mod/2]));
			s17[mod*i+0+mod/2] <= _min(pack(s16[mod*i+0]), pack(s16[mod*i+0+mod/2]));
			s17[mod*i+1] <= _max(pack(s16[mod*i+1]) , pack(s16[mod*i+1+mod/2]));
			s17[mod*i+1+mod/2] <= _min(pack(s16[mod*i+1]), pack(s16[mod*i+1+mod/2]));
			s17[mod*i+2] <= _max(pack(s16[mod*i+2]) , pack(s16[mod*i+2+mod/2]));
			s17[mod*i+2+mod/2] <= _min(pack(s16[mod*i+2]), pack(s16[mod*i+2+mod/2]));
			s17[mod*i+3] <= _max(pack(s16[mod*i+3]) , pack(s16[mod*i+3+mod/2]));
			s17[mod*i+3+mod/2] <= _min(pack(s16[mod*i+3]), pack(s16[mod*i+3+mod/2]));
			s17[mod*i+4] <= _max(pack(s16[mod*i+4]) , pack(s16[mod*i+4+mod/2]));
			s17[mod*i+4+mod/2] <= _min(pack(s16[mod*i+4]), pack(s16[mod*i+4+mod/2]));
			s17[mod*i+5] <= _max(pack(s16[mod*i+5]) , pack(s16[mod*i+5+mod/2]));
			s17[mod*i+5+mod/2] <= _min(pack(s16[mod*i+5]), pack(s16[mod*i+5+mod/2]));
			s17[mod*i+6] <= _max(pack(s16[mod*i+6]) , pack(s16[mod*i+6+mod/2]));
			s17[mod*i+6+mod/2] <= _min(pack(s16[mod*i+6]), pack(s16[mod*i+6+mod/2]));
			s17[mod*i+7] <= _max(pack(s16[mod*i+7]) , pack(s16[mod*i+7+mod/2]));
			s17[mod*i+7+mod/2] <= _min(pack(s16[mod*i+7]), pack(s16[mod*i+7+mod/2]));
			s17[mod*i+8] <= _max(pack(s16[mod*i+8]) , pack(s16[mod*i+8+mod/2]));
			s17[mod*i+8+mod/2] <= _min(pack(s16[mod*i+8]), pack(s16[mod*i+8+mod/2]));
			s17[mod*i+9] <= _max(pack(s16[mod*i+9]) , pack(s16[mod*i+9+mod/2]));
			s17[mod*i+9+mod/2] <= _min(pack(s16[mod*i+9]), pack(s16[mod*i+9+mod/2]));
			s17[mod*i+10] <= _max(pack(s16[mod*i+10]) , pack(s16[mod*i+10+mod/2]));
			s17[mod*i+10+mod/2] <= _min(pack(s16[mod*i+10]), pack(s16[mod*i+10+mod/2]));
			s17[mod*i+11] <= _max(pack(s16[mod*i+11]) , pack(s16[mod*i+11+mod/2]));
			s17[mod*i+11+mod/2] <= _min(pack(s16[mod*i+11]), pack(s16[mod*i+11+mod/2]));
			s17[mod*i+12] <= _max(pack(s16[mod*i+12]) , pack(s16[mod*i+12+mod/2]));
			s17[mod*i+12+mod/2] <= _min(pack(s16[mod*i+12]), pack(s16[mod*i+12+mod/2]));
			s17[mod*i+13] <= _max(pack(s16[mod*i+13]) , pack(s16[mod*i+13+mod/2]));
			s17[mod*i+13+mod/2] <= _min(pack(s16[mod*i+13]), pack(s16[mod*i+13+mod/2]));
			s17[mod*i+14] <= _max(pack(s16[mod*i+14]) , pack(s16[mod*i+14+mod/2]));
			s17[mod*i+14+mod/2] <= _min(pack(s16[mod*i+14]), pack(s16[mod*i+14+mod/2]));
			s17[mod*i+15] <= _max(pack(s16[mod*i+15]) , pack(s16[mod*i+15+mod/2]));
			s17[mod*i+15+mod/2] <= _min(pack(s16[mod*i+15]), pack(s16[mod*i+15+mod/2]));
		end
	end
	p17.enq(1);
endrule
rule _Q54;
	p17.deq;
	let mod = 16;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/4)%2 == 0) begin
			s18[mod*i+0] <= _min(pack(s17[mod*i+0]) , pack(s17[mod*i+0+mod/2]));
			s18[mod*i+0+mod/2] <= _max(pack(s17[mod*i+0]) , pack(s17[mod*i+0+mod/2]));
			s18[mod*i+1] <= _min(pack(s17[mod*i+1]) , pack(s17[mod*i+1+mod/2]));
			s18[mod*i+1+mod/2] <= _max(pack(s17[mod*i+1]) , pack(s17[mod*i+1+mod/2]));
			s18[mod*i+2] <= _min(pack(s17[mod*i+2]) , pack(s17[mod*i+2+mod/2]));
			s18[mod*i+2+mod/2] <= _max(pack(s17[mod*i+2]) , pack(s17[mod*i+2+mod/2]));
			s18[mod*i+3] <= _min(pack(s17[mod*i+3]) , pack(s17[mod*i+3+mod/2]));
			s18[mod*i+3+mod/2] <= _max(pack(s17[mod*i+3]) , pack(s17[mod*i+3+mod/2]));
			s18[mod*i+4] <= _min(pack(s17[mod*i+4]) , pack(s17[mod*i+4+mod/2]));
			s18[mod*i+4+mod/2] <= _max(pack(s17[mod*i+4]) , pack(s17[mod*i+4+mod/2]));
			s18[mod*i+5] <= _min(pack(s17[mod*i+5]) , pack(s17[mod*i+5+mod/2]));
			s18[mod*i+5+mod/2] <= _max(pack(s17[mod*i+5]) , pack(s17[mod*i+5+mod/2]));
			s18[mod*i+6] <= _min(pack(s17[mod*i+6]) , pack(s17[mod*i+6+mod/2]));
			s18[mod*i+6+mod/2] <= _max(pack(s17[mod*i+6]) , pack(s17[mod*i+6+mod/2]));
			s18[mod*i+7] <= _min(pack(s17[mod*i+7]) , pack(s17[mod*i+7+mod/2]));
			s18[mod*i+7+mod/2] <= _max(pack(s17[mod*i+7]) , pack(s17[mod*i+7+mod/2]));
		end
		else begin
			s18[mod*i+0] <= _max(pack(s17[mod*i+0]) , pack(s17[mod*i+0+mod/2]));
			s18[mod*i+0+mod/2] <= _min(pack(s17[mod*i+0]), pack(s17[mod*i+0+mod/2]));
			s18[mod*i+1] <= _max(pack(s17[mod*i+1]) , pack(s17[mod*i+1+mod/2]));
			s18[mod*i+1+mod/2] <= _min(pack(s17[mod*i+1]), pack(s17[mod*i+1+mod/2]));
			s18[mod*i+2] <= _max(pack(s17[mod*i+2]) , pack(s17[mod*i+2+mod/2]));
			s18[mod*i+2+mod/2] <= _min(pack(s17[mod*i+2]), pack(s17[mod*i+2+mod/2]));
			s18[mod*i+3] <= _max(pack(s17[mod*i+3]) , pack(s17[mod*i+3+mod/2]));
			s18[mod*i+3+mod/2] <= _min(pack(s17[mod*i+3]), pack(s17[mod*i+3+mod/2]));
			s18[mod*i+4] <= _max(pack(s17[mod*i+4]) , pack(s17[mod*i+4+mod/2]));
			s18[mod*i+4+mod/2] <= _min(pack(s17[mod*i+4]), pack(s17[mod*i+4+mod/2]));
			s18[mod*i+5] <= _max(pack(s17[mod*i+5]) , pack(s17[mod*i+5+mod/2]));
			s18[mod*i+5+mod/2] <= _min(pack(s17[mod*i+5]), pack(s17[mod*i+5+mod/2]));
			s18[mod*i+6] <= _max(pack(s17[mod*i+6]) , pack(s17[mod*i+6+mod/2]));
			s18[mod*i+6+mod/2] <= _min(pack(s17[mod*i+6]), pack(s17[mod*i+6+mod/2]));
			s18[mod*i+7] <= _max(pack(s17[mod*i+7]) , pack(s17[mod*i+7+mod/2]));
			s18[mod*i+7+mod/2] <= _min(pack(s17[mod*i+7]), pack(s17[mod*i+7+mod/2]));
		end
	end
	p18.enq(1);
endrule
rule _Q53;
	p18.deq;
	let mod = 8;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/8)%2 == 0) begin
			s19[mod*i+0] <= _min(pack(s18[mod*i+0]) , pack(s18[mod*i+0+mod/2]));
			s19[mod*i+0+mod/2] <= _max(pack(s18[mod*i+0]) , pack(s18[mod*i+0+mod/2]));
			s19[mod*i+1] <= _min(pack(s18[mod*i+1]) , pack(s18[mod*i+1+mod/2]));
			s19[mod*i+1+mod/2] <= _max(pack(s18[mod*i+1]) , pack(s18[mod*i+1+mod/2]));
			s19[mod*i+2] <= _min(pack(s18[mod*i+2]) , pack(s18[mod*i+2+mod/2]));
			s19[mod*i+2+mod/2] <= _max(pack(s18[mod*i+2]) , pack(s18[mod*i+2+mod/2]));
			s19[mod*i+3] <= _min(pack(s18[mod*i+3]) , pack(s18[mod*i+3+mod/2]));
			s19[mod*i+3+mod/2] <= _max(pack(s18[mod*i+3]) , pack(s18[mod*i+3+mod/2]));
		end
		else begin
			s19[mod*i+0] <= _max(pack(s18[mod*i+0]) , pack(s18[mod*i+0+mod/2]));
			s19[mod*i+0+mod/2] <= _min(pack(s18[mod*i+0]), pack(s18[mod*i+0+mod/2]));
			s19[mod*i+1] <= _max(pack(s18[mod*i+1]) , pack(s18[mod*i+1+mod/2]));
			s19[mod*i+1+mod/2] <= _min(pack(s18[mod*i+1]), pack(s18[mod*i+1+mod/2]));
			s19[mod*i+2] <= _max(pack(s18[mod*i+2]) , pack(s18[mod*i+2+mod/2]));
			s19[mod*i+2+mod/2] <= _min(pack(s18[mod*i+2]), pack(s18[mod*i+2+mod/2]));
			s19[mod*i+3] <= _max(pack(s18[mod*i+3]) , pack(s18[mod*i+3+mod/2]));
			s19[mod*i+3+mod/2] <= _min(pack(s18[mod*i+3]), pack(s18[mod*i+3+mod/2]));
		end
	end
	p19.enq(1);
endrule
rule _Q52;
	p19.deq;
	let mod = 4;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/16)%2 == 0) begin
			s20[mod*i+0] <= _min(pack(s19[mod*i+0]) , pack(s19[mod*i+0+mod/2]));
			s20[mod*i+0+mod/2] <= _max(pack(s19[mod*i+0]) , pack(s19[mod*i+0+mod/2]));
			s20[mod*i+1] <= _min(pack(s19[mod*i+1]) , pack(s19[mod*i+1+mod/2]));
			s20[mod*i+1+mod/2] <= _max(pack(s19[mod*i+1]) , pack(s19[mod*i+1+mod/2]));
		end
		else begin
			s20[mod*i+0] <= _max(pack(s19[mod*i+0]) , pack(s19[mod*i+0+mod/2]));
			s20[mod*i+0+mod/2] <= _min(pack(s19[mod*i+0]), pack(s19[mod*i+0+mod/2]));
			s20[mod*i+1] <= _max(pack(s19[mod*i+1]) , pack(s19[mod*i+1+mod/2]));
			s20[mod*i+1+mod/2] <= _min(pack(s19[mod*i+1]), pack(s19[mod*i+1+mod/2]));
		end
	end
	p20.enq(1);
endrule
rule _Q51;
	p20.deq;
	let mod = 2;
	for(int i=0; i < L0/mod; i = i + 1) begin
		if ((i/32)%2 == 0) begin
			s21[mod*i+0] <= _min(pack(s20[mod*i+0]) , pack(s20[mod*i+0+mod/2]));
			s21[mod*i+0+mod/2] <= _max(pack(s20[mod*i+0]) , pack(s20[mod*i+0+mod/2]));
		end
		else begin
			s21[mod*i+0] <= _max(pack(s20[mod*i+0]) , pack(s20[mod*i+0+mod/2]));
			s21[mod*i+0+mod/2] <= _min(pack(s20[mod*i+0]), pack(s20[mod*i+0+mod/2]));
		end
	end
	p21.enq(1);
endrule

method Action put(Vector#(L0, Int#(32)) datas);
for(int i=0;i<L0;i=i+1)
s0[i] <= datas[i];
p0.enq(1);
endmethod

method ActionValue#(Vector#(L0, Int#(32))) get;
p21.deq;
Vector#(L0,Int#(32)) r = newVector;
for(int i=0; i<L0; i = i + 1)
r[i] = s21[i];
return r;
endmethod
endmodule
endpackage
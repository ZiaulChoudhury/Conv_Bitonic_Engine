package compact;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;
#define L0 2048
#define L1 1024
#define L2 512
#define L3 256
#define L4 128
#define L5 64
#define L6 32
#define L7 16
#define L8 8
#define L9 4
#define L10 2
#define L11 1
#define B0 16
#define B1 32
#define B2 64
#define B3 128
#define B4 256
#define B5 512
#define B6 1024
#define B7 2048
#define B8 4096
#define B9 8192
#define B10 16384
#define B11 32768
interface CompactTree;
        method Action put(Vector#(L0, Bit#(B0)) datas);
        method ActionValue#(Bit#(B11)) get;
endinterface

(*synthesize*)
module mkCompactTree(CompactTree);
	Reg#(Bit#(B0))  s0[L0];
	Reg#(Bit#(B1))  s1[L1];
	Reg#(Bit#(B2))  s2[L2];
	Reg#(Bit#(B3))  s3[L3];
	Reg#(Bit#(B4))  s4[L4];
	Reg#(Bit#(B5))  s5[L5];
	Reg#(Bit#(B6))  s6[L6];
	Reg#(Bit#(B7))  s7[L7];
	Reg#(Bit#(B8))  s8[L8];
	Reg#(Bit#(B9))  s9[L9];
	Reg#(Bit#(B10))  s10[L10];
	Reg#(Bit#(B11))  s11[L11];
	Reg#(Int#(16))  h0[L0];
	Reg#(Int#(16))  h1[L1];
	Reg#(Int#(16))  h2[L2];
	Reg#(Int#(16))  h3[L3];
	Reg#(Int#(16))  h4[L4];
	Reg#(Int#(16))  h5[L5];
	Reg#(Int#(16))  h6[L6];
	Reg#(Int#(16))  h7[L7];
	Reg#(Int#(16))  h8[L8];
	Reg#(Int#(16))  h9[L9];
	Reg#(Int#(16))  h10[L10];
	Reg#(Int#(16))  h11[L11];
	FIFOF#(Bit#(1)) p0<- mkPipelineFIFOF;
	FIFOF#(Bit#(1)) p1<- mkPipelineFIFOF;
	FIFOF#(Bit#(1)) p2<- mkPipelineFIFOF;
	FIFOF#(Bit#(1)) p3<- mkPipelineFIFOF;
	FIFOF#(Bit#(1)) p4<- mkPipelineFIFOF;
	FIFOF#(Bit#(1)) p5<- mkPipelineFIFOF;
	FIFOF#(Bit#(1)) p6<- mkPipelineFIFOF;
	FIFOF#(Bit#(1)) p7<- mkPipelineFIFOF;
	FIFOF#(Bit#(1)) p8<- mkPipelineFIFOF;
	FIFOF#(Bit#(1)) p9<- mkPipelineFIFOF;
	FIFOF#(Bit#(1)) p10<- mkPipelineFIFOF;
	FIFOF#(Bit#(1)) p11<- mkPipelineFIFOF;
	FIFOF#(Bit#(1)) p12<- mkPipelineFIFOF;
	for(int i =0; i<L0; i = i + 1) begin
		s0[i] <- mkReg(0);
		h0[i] <- mkReg(0);
	end
	for(int i =0; i<L1; i = i + 1) begin
		s1[i] <- mkReg(0);
		h1[i] <- mkReg(0);
	end
	for(int i =0; i<L2; i = i + 1) begin
		s2[i] <- mkReg(0);
		h2[i] <- mkReg(0);
	end
	for(int i =0; i<L3; i = i + 1) begin
		s3[i] <- mkReg(0);
		h3[i] <- mkReg(0);
	end
	for(int i =0; i<L4; i = i + 1) begin
		s4[i] <- mkReg(0);
		h4[i] <- mkReg(0);
	end
	for(int i =0; i<L5; i = i + 1) begin
		s5[i] <- mkReg(0);
		h5[i] <- mkReg(0);
	end
	for(int i =0; i<L6; i = i + 1) begin
		s6[i] <- mkReg(0);
		h6[i] <- mkReg(0);
	end
	for(int i =0; i<L7; i = i + 1) begin
		s7[i] <- mkReg(0);
		h7[i] <- mkReg(0);
	end
	for(int i =0; i<L8; i = i + 1) begin
		s8[i] <- mkReg(0);
		h8[i] <- mkReg(0);
	end
	for(int i =0; i<L9; i = i + 1) begin
		s9[i] <- mkReg(0);
		h9[i] <- mkReg(0);
	end
	for(int i =0; i<L10; i = i + 1) begin
		s10[i] <- mkReg(0);
		h10[i] <- mkReg(0);
	end
	for(int i =0; i<L11; i = i + 1) begin
		s11[i] <- mkReg(0);
		h11[i] <- mkReg(0);
	end
	rule _Q0;
	for (int i=0; i<L0; i = i + 1)
	if (s0[i] != 0)
		h0[i] <= 1;
	endrule
	rule _Q1;
		for(int i=0; i < L1; i = i + 1) begin
			h1[i] <= (h0[2*i] + h0[2*i+1]);
			Bit#(B1) a = zeroExtend(s0[2*i]);
			Bit#(B1) b = zeroExtend(s0[2*i+1]);
			Bit#(B1) c = (b << (h0[2*i] << 4)) | a;
			s1[i] <= c;
		end
	endrule
	rule _Q2;
		for(int i=0; i < L2; i = i + 1) begin
			h2[i] <= (h1[2*i] + h1[2*i+1]);
			Bit#(B2) a = zeroExtend(s1[2*i]);
			Bit#(B2) b = zeroExtend(s1[2*i+1]);
			Bit#(B2) c = (b << (h1[2*i] << 4)) | a;
			s2[i] <= c;
		end
	endrule
	rule _Q3;
		for(int i=0; i < L3; i = i + 1) begin
			h3[i] <= (h2[2*i] + h2[2*i+1]);
			Bit#(B3) a = zeroExtend(s2[2*i]);
			Bit#(B3) b = zeroExtend(s2[2*i+1]);
			Bit#(B3) c = (b << (h2[2*i] << 4)) | a;
			s3[i] <= c;
		end
	endrule
	rule _Q4;
		for(int i=0; i < L4; i = i + 1) begin
			h4[i] <= (h3[2*i] + h3[2*i+1]);
			Bit#(B4) a = zeroExtend(s3[2*i]);
			Bit#(B4) b = zeroExtend(s3[2*i+1]);
			Bit#(B4) c = (b << (h3[2*i] << 4)) | a;
			s4[i] <= c;
		end
	endrule
	rule _Q5;
		for(int i=0; i < L5; i = i + 1) begin
			h5[i] <= (h4[2*i] + h4[2*i+1]);
			Bit#(B5) a = zeroExtend(s4[2*i]);
			Bit#(B5) b = zeroExtend(s4[2*i+1]);
			Bit#(B5) c = (b << (h4[2*i] << 4)) | a;
			s5[i] <= c;
		end
	endrule
	rule _Q6;
		for(int i=0; i < L6; i = i + 1) begin
			h6[i] <= (h5[2*i] + h5[2*i+1]);
			Bit#(B6) a = zeroExtend(s5[2*i]);
			Bit#(B6) b = zeroExtend(s5[2*i+1]);
			Bit#(B6) c = (b << (h5[2*i] << 4)) | a;
			s6[i] <= c;
		end
	endrule
	rule _Q7;
		for(int i=0; i < L7; i = i + 1) begin
			h7[i] <= (h6[2*i] + h6[2*i+1]);
			Bit#(B7) a = zeroExtend(s6[2*i]);
			Bit#(B7) b = zeroExtend(s6[2*i+1]);
			Bit#(B7) c = (b << (h6[2*i] << 4)) | a;
			s7[i] <= c;
		end
	endrule
	rule _Q8;
		for(int i=0; i < L8; i = i + 1) begin
			h8[i] <= (h7[2*i] + h7[2*i+1]);
			Bit#(B8) a = zeroExtend(s7[2*i]);
			Bit#(B8) b = zeroExtend(s7[2*i+1]);
			Bit#(B8) c = (b << (h7[2*i] << 4)) | a;
			s8[i] <= c;
		end
	endrule
	rule _Q9;
		for(int i=0; i < L9; i = i + 1) begin
			h9[i] <= (h8[2*i] + h8[2*i+1]);
			Bit#(B9) a = zeroExtend(s8[2*i]);
			Bit#(B9) b = zeroExtend(s8[2*i+1]);
			Bit#(B9) c = (b << (h8[2*i] << 4)) | a;
			s9[i] <= c;
		end
	endrule
	rule _Q10;
		for(int i=0; i < L10; i = i + 1) begin
			h10[i] <= (h9[2*i] + h9[2*i+1]);
			Bit#(B10) a = zeroExtend(s9[2*i]);
			Bit#(B10) b = zeroExtend(s9[2*i+1]);
			Bit#(B10) c = (b << (h9[2*i] << 4)) | a;
			s10[i] <= c;
		end
	endrule
	rule _Q11;
		for(int i=0; i < L11; i = i + 1) begin
			h11[i] <= (h10[2*i] + h10[2*i+1]);
			Bit#(B11) a = zeroExtend(s10[2*i]);
			Bit#(B11) b = zeroExtend(s10[2*i+1]);
			Bit#(B11) c = (b << (h10[2*i] << 4)) | a;
			s11[i] <= c;
		end
	endrule
	rule _act0;
		p0.deq;
		p1.enq(1);
	endrule
	rule _act1;
		p1.deq;
		p2.enq(1);
	endrule
	rule _act2;
		p2.deq;
		p3.enq(1);
	endrule
	rule _act3;
		p3.deq;
		p4.enq(1);
	endrule
	rule _act4;
		p4.deq;
		p5.enq(1);
	endrule
	rule _act5;
		p5.deq;
		p6.enq(1);
	endrule
	rule _act6;
		p6.deq;
		p7.enq(1);
	endrule
	rule _act7;
		p7.deq;
		p8.enq(1);
	endrule
	rule _act8;
		p8.deq;
		p9.enq(1);
	endrule
	rule _act9;
		p9.deq;
		p10.enq(1);
	endrule
	rule _act10;
		p10.deq;
		p11.enq(1);
	endrule
	rule _act11;
		p11.deq;
		p12.enq(1);
	endrule

method Action put(Vector#(L0, Bit#(B0)) datas);
	for(int i=0;i<L0;i=i+1)
	s0[i] <= datas[i];
	p0.enq(1);
endmethod

method ActionValue#(Bit#(B11)) get;
	p12.deq;
	return s11[0];
endmethod
endmodule
endpackage
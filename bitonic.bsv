package bitonic;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;
#define L0 16

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

method Action put(Vector#(L0, Int#(16)) datas);
for(int i=0;i<L0;i=i+1)
s0[i] <= datas[i];
p0.enq(1);
endmethod

method ActionValue#(Vector#(L0, Int#(16))) get;
p10.deq;
Vector#(L0,Int#(16)) r = newVector;
for(int i=0; i<L0; i = i + 1)
r[i] = s10[i];
return r;
endmethod
endmodule
endpackage
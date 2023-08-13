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
        method ActionValue#(Vector#(8, Int#(16))) get;
endinterface

(*synthesize*)
module mkSumTree(SumTree);

Reg#(Int#(16)) s0[L0];
Reg#(Int#(16)) s1[L0];
Reg#(Int#(16)) s2[L0];
Reg#(Int#(16)) s3[L0];
Reg#(Int#(16)) s4[L0];
Reg#(Int#(16)) s5[L0];
Reg#(Int#(16)) s6[L0];

FIFOF#(Bit#(1)) p0 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p1 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p2 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p3 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p4 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p5 <- mkPipelineFIFOF;
FIFOF#(Bit#(1)) p6 <- mkPipelineFIFOF;

for(int i =0; i<L0; i = i + 1) begin
		s0[i] <- mkReg(0);
		s1[i] <- mkReg(0);
		s2[i] <- mkReg(0);
		s3[i] <- mkReg(0);
		s4[i] <- mkReg(0);
		s5[i] <- mkReg(0);
		s6[i] <- mkReg(0);
end
	rule _Q11;
			p0.deq;
			let mod00 = 2;
			for(int i=0; i < 8/mod00; i = i + 1) begin
				if ((i/1)%2 == 0) begin
					for(int j=0; j< mod00/2; j=j+1) begin
					s1[mod00*i+j]       <= min(s0[mod00*i+j] , s0[mod00*i+j+mod00/2]);
					s1[mod00*i+j+mod00/2] <= max(s0[mod00*i+j] , s0[mod00*i+j+mod00/2]);
					end
				end
				else begin
					for(int j=0; j< mod00/2; j=j+1) begin
					s1[mod00*i+j]       <= max(s0[mod00*i+j] , s0[mod00*i+j+mod00/2]);
					s1[mod00*i+j+mod00/2] <= min(s0[mod00*i+j] , s0[mod00*i+j+mod00/2]);
					end
				end
			end
			p1.enq(1);
	endrule

	rule _Q21;
			p1.deq;
			let mod10 = 4;
                        for(int i=0; i < 8/mod10; i = i + 1) begin
                                if ((i/1)%2 == 0) begin
                                        for(int j=0; j< mod10/2; j=j+1) begin
                                        s2[mod10*i+j]         <= min(s1[mod10*i+j] , s1[mod10*i+j+mod10/2]);
                                        s2[mod10*i+j+mod10/2] <= max(s1[mod10*i+j] , s1[mod10*i+j+mod10/2]);
                                        end
                                end
                                else begin
                                        for(int j=0; j< mod10/2; j=j+1) begin
                                        s2[mod10*i+j]         <= max(s1[mod10*i+j] , s1[mod10*i+j+mod10/2]);
                                        s2[mod10*i+j+mod10/2] <= min(s1[mod10*i+j] , s1[mod10*i+j+mod10/2]);
                                        end
                                end
                        end
			p2.enq(1);
	endrule

	rule _Q22;
			p2.deq;
			let mod11 = 2;
                        for(int i=0; i < 8/mod11; i = i + 1) begin
                                if ((i/2)%2 == 0) begin
                                        for(int j=0; j< mod11/2; j=j+1) begin
                                        s3[mod11*i+j]         <= min(s2[mod11*i+j] , s2[mod11*i+j+mod11/2]);
                                        s3[mod11*i+j+mod11/2] <= max(s2[mod11*i+j] , s2[mod11*i+j+mod11/2]);
                                        end
                                end
                                else begin
                                        for(int j=0; j< mod11/2; j=j+1) begin
                                        s3[mod11*i+j]         <= max(s2[mod11*i+j] , s2[mod11*i+j+mod11/2]);
                                        s3[mod11*i+j+mod11/2] <= min(s2[mod11*i+j] , s2[mod11*i+j+mod11/2]);
                                        end
                                end
                        end
			p3.enq(1);
	endrule


	rule _Q31;
		  	p3.deq;
                        let mod20 = 8;
                        for(int i=0; i < 8/mod20; i = i + 1) begin
                                if ((i/1)%2 == 0) begin
                                        for(int j=0; j< mod20/2; j=j+1) begin
                                        s4[mod20*i+j]         <= min(s3[mod20*i+j] , s3[mod20*i+j+mod20/2]);
                                        s4[mod20*i+j+mod20/2] <= max(s3[mod20*i+j] , s3[mod20*i+j+mod20/2]);
                                        end
                                end
                                else begin
                                        for(int j=0; j< mod20/2; j=j+1) begin
                                        s4[mod20*i+j]         <= max(s3[mod20*i+j] , s3[mod20*i+j+mod20/2]);
                                        s4[mod20*i+j+mod20/2] <= min(s3[mod20*i+j] , s3[mod20*i+j+mod20/2]);
                                        end
                                end
                        end
                        p4.enq(1);
	endrule

	rule _Q32;
			p4.deq;
                        let mod21 = 4;
                        for(int i=0; i < 8/mod21; i = i + 1) begin
                                if ((i/2)%2 == 0) begin
                                        for(int j=0; j< mod21/2; j=j+1) begin
                                        s5[mod21*i+j]         <= min(s4[mod21*i+j] , s4[mod21*i+j+mod21/2]);
                                        s5[mod21*i+j+mod21/2] <= max(s4[mod21*i+j] , s4[mod21*i+j+mod21/2]);
                                        end
                                end
                                else begin
                                        for(int j=0; j< mod21/2; j=j+1) begin
                                        s5[mod21*i+j]         <= max(s4[mod21*i+j] , s4[mod21*i+j+mod21/2]);
                                        s5[mod21*i+j+mod21/2] <= min(s4[mod21*i+j] , s4[mod21*i+j+mod21/2]);
                                        end
                                end
                        end                        
                        p5.enq(1);

	endrule
		
	rule _Q33;
			p5.deq;
                        let mod22 = 2;
                        for(int i=0; i < 8/mod22; i = i + 1) begin
                                if ((i/4)%2 == 0) begin
                                        for(int j=0; j< mod22/2; j=j+1) begin
                                        s6[mod22*i+j]         <= min(s5[mod22*i+j] , s5[mod22*i+j+mod22/2]);
                                        s6[mod22*i+j+mod22/2] <= max(s5[mod22*i+j] , s5[mod22*i+j+mod22/2]);
                                        end
                                end
                                else begin    
                                        for(int j=0; j< mod22/2; j=j+1) begin
                                        s6[mod22*i+j]         <= max(s5[mod22*i+j] , s5[mod22*i+j+mod22/2]);
                                        s6[mod22*i+j+mod22/2] <= min(s5[mod22*i+j] , s5[mod22*i+j+mod22/2]);
                                        end
                                end
                        end
                        p6.enq(1);

	endrule

	
        method Action put(Vector#(8, Int#(16)) datas);
		for(int i=0;i<8;i=i+1)
			s0[i] <= datas[i];
		p0.enq(1);
	endmethod
	
        method ActionValue#(Vector#(8, Int#(16))) get;
			p6.deq;
			Vector#(8,Int#(16)) r = newVector;
			for(int i=0; i<8; i = i + 1)
				r[i] = s6[i];
			return r;
	endmethod
endmodule
endpackage

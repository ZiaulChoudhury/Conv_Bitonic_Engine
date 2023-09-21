package flowtest;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;
import bitonic::*;
#define L0 16
(*synthesize*)
module mkFlowTest();

Bitonic px <- mkBitonic;

	rule push_data;
		Vector#(L0,Int#(32)) r = newVector;
		for (Int  # (16) i=0; i<L0; i = i + 1)
		r[0]=17697540;
		r[1]=62129666;
		r[2]=8064514;
		r[3]=29365508;
		r[4]=5178373;
		r[5]=31463941;
		r[6]=3477251;
		r[7]=48498436;
		r[8]=53021443;
		r[9]=7673091;
		r[10]=7802369;
		r[11]=44633605;
		r[12]=4261893;
		r[13]=57351169;
		r[14]=58528257;
		r[15]=38081538;
		px.put(r);
	endrule


	rule get_data;
	let d <- px.get;
		for(int i=0; i<L0; i=i+1) begin
			 Int#(8) dx = unpack(truncate(pack(d[i])));
			 Int#(8) dx1 = unpack(truncate(pack(d[i])>>8));
			$display("%d %d",dx, dx1);
		end
			$finish(0);
	endrule

endmodule
endpackage
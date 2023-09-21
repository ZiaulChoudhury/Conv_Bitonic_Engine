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
		Vector#(L0,Int#(16)) r = newVector;
		for (Int  # (16) i=0; i<L0; i = i + 1)
		r[0]=5701;
		r[1]=22852;
		r[2]=22069;
		r[3]=9524;
		r[4]=8498;
		r[5]=20546;
		r[6]=5138;
		r[7]=17953;
		r[8]=16164;
		r[9]=22579;
		r[10]=12852;
		r[11]=2596;
		r[12]=9010;
		r[13]=12067;
		r[14]=17938;
		r[15]=11589;
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

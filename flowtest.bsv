package flowtest;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;
import bitonic::*;
#define L0 8
(*synthesize*)
module mkFlowTest();

Bitonic px <- mkBitonic;

	rule push_data;
		Vector#(L0,Int#(32)) r = newVector;
		for (Int  # (16) i=0; i<L0; i = i + 1)
		r[0]=22681090;
		r[1]=56696579;
		r[2]=34015746;
		r[3]=35919363;
		r[4]=51060482;
		r[5]=58790658;
		r[6]=58202885;
		r[7]=8395267;
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
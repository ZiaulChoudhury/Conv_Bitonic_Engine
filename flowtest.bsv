package flowtest;
import FixedPoint:: *;
import SpecialFIFOs:: * ;
import Vector:: *;
import FIFO:: *;
import FIFOF:: *;
import bitonic::*;

#define L0 128
(*synthesize*)
module mkFlowTest();

	Bitonic px <- mkBitonic;

	rule push_data;
		Vector#(L0,Int#(16)) r = newVector;
		for(Int#(16) i=0; i<L0; i = i + 1)
			r[i] = L0 - i;
		px.put(r);
	endrule

 	rule get_data;	
		let d <- px.get;
		for(int i=0; i<L0; i=i+1)
		$display("%d",d[i]);
		$finish(0);
        endrule

endmodule
endpackage


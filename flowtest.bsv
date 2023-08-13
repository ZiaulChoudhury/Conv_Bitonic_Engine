package flowtest;
import FixedPoint:: *;
import SpecialFIFOs:: * ;
import Vector:: *;
import FIFO:: *;
import FIFOF:: *;
import bitonic::*;

(*synthesize*)
module mkFlowTest();

	Bitonic px <- mkBitonic;

	rule push_data;
		Vector#(16,Int#(16)) r = newVector;
		r[0] = 16;
		r[1] = 22;
		r[2] = 120;
		r[3] = 40;
		r[4] = 10;
		r[5] = 11;
		r[6] = 90;
		r[7] = 130;		
		r[8] = 32;		
		r[9] = 87;		
		r[10] = 68;		
		r[11] = 19;		
		r[12] = 7;		
		r[13] = 5;		
		r[14] = 45;		
		r[15] = 21;		
		px.put(r);
	endrule

 	rule get_data;	
		let d <- px.get;
		for(int i=0; i<16; i=i+1)
		$display("%d",d[i]);
		$finish(0);
        endrule

endmodule
endpackage


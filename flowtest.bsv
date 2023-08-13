package flowtest;
import FixedPoint:: *;
import SpecialFIFOs:: * ;
import Vector:: *;
import FIFO:: *;
import FIFOF:: *;
import sumTree::*;

(*synthesize*)
module mkFlowTest();

	SumTree px <- mkSumTree;

	rule push_data;
		Vector#(8,Int#(16)) r = newVector;
		r[0] = 16;
		r[1] = 2;
		r[2] = 12;
		r[3] = 4;
		r[4] = 10;
		r[5] = 1;
		r[6] = 9;
		r[7] = 13;		
		px.put(r);
	endrule

 	rule get_data;	
		let d <- px.get;
		for(int i=0; i<8; i=i+1)
		$display("%d",d[i]);
		$finish(0);
        endrule

endmodule
endpackage


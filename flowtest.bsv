package flowtest;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;
import bitonic::*;
#define L0 32
(*synthesize*)
module mkFlowTest();

Bitonic px <- mkBitonic;

	rule push_data;
		Vector#(L0,Int#(16)) r = newVector;
		for (Int  # (16) i=0; i<L0; i = i + 1)
		r[0]=18195;
		r[1]=21778;
		r[2]=12613;
		r[3]=25413;
		r[4]=12325;
		r[5]=16162;
		r[6]=23363;
		r[7]=15681;
		r[8]=5650;
		r[9]=22323;
		r[10]=19233;
		r[11]=5173;
		r[12]=16931;
		r[13]=24645;
		r[14]=12052;
		r[15]=3893;
		r[16]=16930;
		r[17]=21553;
		r[18]=8977;
		r[19]=5156;
		r[20]=21027;
		r[21]=5684;
		r[22]=7441;
		r[23]=3877;
		r[24]=7218;
		r[25]=20770;
		r[26]=4898;
		r[27]=11845;
		r[28]=23313;
		r[29]=11841;
		r[30]=6721;
		r[31]=10789;
		px.put(r);
	endrule


	rule get_data;
	let d <- px.get;
		for(int i=0; i<L0; i=i+1) begin
			 Int#(4) dx = unpack(truncate(pack(d[i])));
			 Int#(4) dx1 = unpack(truncate(pack(d[i])>>4));
			$display("%d %d",dx, dx1);
		end
			$finish(0);
	endrule

endmodule
endpackage
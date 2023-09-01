package flowtest;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;
import bitonic::*;
#define L0 128
(*synthesize*)
module mkFlowTest();

Bitonic px <- mkBitonic;

	rule push_data;
		Vector#(L0,Int#(16)) r = newVector;
		for (Int  # (16) i=0; i<L0; i = i + 1)
		r[0]=13844;
		r[1]=19506;
		r[2]=17970;
		r[3]=22579;
		r[4]=6437;
		r[5]=7746;
		r[6]=5189;
		r[7]=20261;
		r[8]=23587;
		r[9]=3363;
		r[10]=9012;
		r[11]=10802;
		r[12]=8753;
		r[13]=6931;
		r[14]=14657;
		r[15]=22338;
		r[16]=5909;
		r[17]=12050;
		r[18]=12851;
		r[19]=8001;
		r[20]=21314;
		r[21]=17444;
		r[22]=9011;
		r[23]=4676;
		r[24]=2612;
		r[25]=18196;
		r[26]=2581;
		r[27]=12341;
		r[28]=6195;
		r[29]=13090;
		r[30]=2835;
		r[31]=10053;
		r[32]=24853;
		r[33]=15427;
		r[34]=9012;
		r[35]=19763;
		r[36]=6452;
		r[37]=22563;
		r[38]=4371;
		r[39]=11828;
		r[40]=4897;
		r[41]=10292;
		r[42]=2577;
		r[43]=19763;
		r[44]=7972;
		r[45]=6709;
		r[46]=17476;
		r[47]=14386;
		r[48]=16196;
		r[49]=4146;
		r[50]=15891;
		r[51]=8242;
		r[52]=7490;
		r[53]=6689;
		r[54]=13329;
		r[55]=19507;
		r[56]=24611;
		r[57]=20532;
		r[58]=20245;
		r[59]=10773;
		r[60]=14884;
		r[61]=15154;
		r[62]=11539;
		r[63]=19986;
		r[64]=21027;
		r[65]=23315;
		r[66]=15380;
		r[67]=4132;
		r[68]=6930;
		r[69]=16964;
		r[70]=24613;
		r[71]=7460;
		r[72]=10034;
		r[73]=23841;
		r[74]=7731;
		r[75]=8499;
		r[76]=12339;
		r[77]=15666;
		r[78]=14402;
		r[79]=4930;
		r[80]=20545;
		r[81]=7189;
		r[82]=16179;
		r[83]=8244;
		r[84]=10801;
		r[85]=4149;
		r[86]=14643;
		r[87]=13601;
		r[88]=21794;
		r[89]=20277;
		r[90]=7203;
		r[91]=23586;
		r[92]=19778;
		r[93]=22325;
		r[94]=22819;
		r[95]=23877;
		r[96]=11330;
		r[97]=6724;
		r[98]=4673;
		r[99]=16449;
		r[100]=23841;
		r[101]=6164;
		r[102]=23619;
		r[103]=23825;
		r[104]=6421;
		r[105]=24897;
		r[106]=9285;
		r[107]=19265;
		r[108]=18499;
		r[109]=6420;
		r[110]=20019;
		r[111]=13859;
		r[112]=8755;
		r[113]=19524;
		r[114]=20259;
		r[115]=14913;
		r[116]=18980;
		r[117]=15889;
		r[118]=12833;
		r[119]=12820;
		r[120]=3858;
		r[121]=20530;
		r[122]=24897;
		r[123]=20260;
		r[124]=18962;
		r[125]=11843;
		r[126]=9762;
		r[127]=11844;
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
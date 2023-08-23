package flowtest;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;
import compact::*;


#define L0 64 
(*synthesize*)
module mkFlowTest();

CompactTree px <- mkCompactTree;
	rule push_data;
	Vector#(L0,Int#(16)) r = newVector;
		r[0]=0;
		r[1]=0;
		r[2]=0;
		r[3]=0;
		r[4]=0;
		r[5]=0;
		r[6]=0;
		r[7]=0;
		r[8]=139;
		r[9]=185;
		r[10]=0;
		r[11]=0;
		r[12]=183;
		r[13]=0;
		r[14]=51;
		r[15]=118;
		r[16]=123;
		r[17]=83;
		r[18]=79;
		r[19]=44;
		r[20]=0;
		r[21]=47;
		r[22]=72;
		r[23]=116;
		r[24]=141;
		r[25]=84;
		r[26]=87;
		r[27]=0;
		r[28]=81;
		r[29]=0;
		r[30]=177;
		r[31]=166;
		r[32]=176;
		r[33]=0;
		r[34]=146;
		r[35]=0;
		r[36]=0;
		r[37]=0;
		r[38]=78;
		r[39]=20;
		r[40]=32;
		r[41]=0;
		r[42]=0;
		r[43]=0;
		r[44]=155;
		r[45]=85;
		r[46]=0;
		r[47]=90;
		r[48]=0;
		r[49]=31;
		r[50]=84;
		r[51]=79;
		r[52]=0;
		r[53]=0;
		r[54]=25;
		r[55]=169;
		r[56]=0;
		r[57]=30;
		r[58]=31;
		r[59]=152;
		r[60]=129;
		r[61]=0;
		r[62]=0;
		r[63]=0;
	px.put(unpack(pack(r)));
	endrule
	rule get_data;
	let d <- px.get;
	Vector#(L0, Int#(16)) dx = unpack(d);
	for(int i=0; i<L0; i=i+1)
	$display("%d",dx[i]);
	$finish(0);
	endrule
endmodule
endpackage
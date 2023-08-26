package flowtest;
import FIFO::*;
import FIFOF::*;
import datatypes::*;
import SpecialFIFOs:: * ;
import Real::*;
import Vector::*;
import compact::*;
import "BDPI" function Action fill_image();
import "BDPI" function Int#(32) load_data(Int#(32) r_c);


#define L0 2048 
#define B 32768 
(*synthesize*)
module mkFlowTest();

CompactTree px <- mkCompactTree;
Reg#(Bool)  init <- mkReg(False);
Reg#(int)   index <- mkReg(0);
Reg#(Bit#(B))    data <- mkReg(0);
	rule init_data (init == False);
		fill_image();
		init <= True;
	endrule

	rule load_data (index < L0 && init == True);
		Int#(16) dx = truncate(load_data(index));
		index <= index + 1;
		data <= (data << 16) | zeroExtend(pack(dx));
	endrule

	rule push_data (index == L0 && init == True);
		px.put(unpack(pack(data)));
		index <= index + 1;
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
module note(data, clk, pz);
	input clk;
	input [3:0] data;
	output pz;
	wire [3:0] cnt0, cnt1, cnt2;
	wire clr, cl0, cl1;
	wire pressed;
	
	assign pressed = data[3] | data[2] | data[1] | data[0];
	clrctr cctr(data, cnt0, cnt1, cnt2, clr);
	
	clr_counter	ccnt0(pressed, clr, clk, cnt0),
				ccnt1(cl0, clr, clk, cnt1),
				ccnt2(cl1, clr, clk, cnt2);
				
	cntld	CL0({cnt0[3], cnt0[0]}, clk, cl0),
			CL1({cnt1[3], cnt1[0]}, clk, cl1);
	
	pzout pzo(clr, ~pressed, clk, pz);
	
endmodule

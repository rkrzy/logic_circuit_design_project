module piano2(btn, clk, pz);
	input btn, clk;
	output pz;
	wire [3:0] notenum;
	wire [1:0] len;
	wire [3:0] cnt0, cnt1, cnt2, cnt3, cnt4, cnt5;
	wire cl0, cl1, cl2, cl3, cl4;
	wire clr, run;
	
	notes notegen(btn, clr, clk, notenum, len, run);
	
	note playnote(notenum, clk, pz);
	
	clrctr2 cctr2(run, cnt5, cnt4, cnt3, clr);

	clr_counter	ccnt0(1'b1, clr, clk, cnt0),
				ccnt1(cl0, clr, clk, cnt1),
				ccnt2(cl1, clr, clk, cnt2),
				ccnt3(cl2, clr, clk, cnt3),
				ccnt4(cl3, clr, clk, cnt4),
				ccnt5(cl4, clr, clk, cnt5);

	cntld	CL0({cnt0[3], cnt0[0]}, clk, cl0),
			CL1({cnt1[3], cnt1[0]}, clk, cl1),
			CL2({cnt2[3], cnt2[0]}, clk, cl2),
			CL3({cnt3[3], cnt3[0]}, clk, cl3),
			CL4({cnt4[3], cnt4[0]}, clk, cl4);

endmodule

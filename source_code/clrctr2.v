/*
module clrctr2(run, length, cnt0, cnt1, clr);
	input run;
	input [1:0] length;
	input [3:0] cnt0, cnt1;
	output clr;
	
	function control;
		input [1:0] l;
		input [3:0] c2, c1;
		
		case(l)
		2'b00: control =	~c2[3] & c2[2] & c2[1] & c2[0] &	// 0: 2.	=	75
							~c1[3] & c1[2] & ~c1[1] & c1[0];
		2'b01: control =	~c2[3] & c2[2] & ~c2[1] & c2[0] &	// 1: 2		=	50
							~c1[3] & ~c1[2] & ~c1[1] & ~c1[0];
		2'b10: control =	~c2[3] & ~c2[2] & c2[1] & ~c2[0] &	// 2: 1		=	25
							~c1[3] & c1[2] & ~c1[1] & c1[0];
		default: control =	1'b1;
		endcase
	endfunction

	assign clr = control(length, cnt0, cnt1) | ~run;

endmodule
*/
module clrctr2(run, cnt2, cnt1, cnt0, clr);
	input run;
	input [3:0] cnt2, cnt1, cnt0;
	output clr;
	
	assign clr =	~cnt2[3] & ~cnt2[2] & ~cnt2[1] & cnt2[0] &	// 125 -> 8 in 4/4
					~cnt1[3] & ~cnt1[2] & cnt1[1] & ~cnt1[0] &
					~cnt0[3] & cnt0[2] & ~cnt0[1] & cnt0[0] | ~run;

endmodule

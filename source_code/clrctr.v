module clrctr(note, cnt0, cnt1, cnt2, clr);
	input [3:0] note, cnt0, cnt1, cnt2;
	output clr;
	
	function control;
		input [3:0] n, c2, c1, c0;
		
		case(n)
		4'b0001: control =	c2[3] & ~c2[2] & ~c2[1] & c2[0] &	// 1: DO: 956
							~c1[3] & c1[2] & ~c1[1] & c1[0] &
							~c0[3] & c0[2] & c0[1] & ~c0[0];
		4'b0010: control =	c2[3] & ~c2[2] & ~c2[1] & ~c2[0] &	// 2: 851
							~c1[3] & c1[2] & ~c1[1] & c1[0] &
							~c0[3] & ~c0[2] & ~c0[1] & c0[0];
		4'b0011: control =	~c2[3] & c2[2] & c2[1] & c2[0] &	// 3: 758
							~c1[3] & c1[2] & ~c1[1] & c1[0] &
							c0[3] & ~c0[2] & ~c0[1] & ~c0[0];
		4'b0100: control =	~c2[3] & c2[2] & c2[1] & c2[0] &	// 4: 716
							~c1[3] & ~c1[2] & ~c1[1] & c1[0] &
							~c0[3] & c0[2] & c0[1] & ~c0[0];
		4'b0101: control =	~c2[3] & c2[2] & c2[1] & ~c2[0] &	// 5: 638
							~c1[3] & ~c1[2] & c1[1] & c1[0] &
							c0[3] & ~c0[2] & ~c0[1] & ~c0[0];
		4'b0110: control =	~c2[3] & c2[2] & ~c2[1] & c2[0] &	// 6: 568
							~c1[3] & c1[2] & c1[1] & ~c1[0] &
							c0[3] & ~c0[2] & ~c0[1] & ~c0[0];
		4'b0111: control =	~c2[3] & c2[2] & ~c2[1] & c2[0] &	// 7: 506
							~c1[3] & ~c1[2] & ~c1[1] & ~c1[0] &
							~c0[3] & c0[2] & c0[1] & ~c0[0];
		4'b1000: control =	~c2[3] & c2[2] & ~c2[1] & ~c2[0] &	// 8: DO: 478
							~c1[3] & c1[2] & c1[1] & c1[0] &
							c0[3] & ~c0[2] & ~c0[1] & ~c0[0];
		default: control =	1'b1;								// 0: pause
		endcase
	endfunction

	assign clr = control(note, cnt2, cnt1, cnt0);

endmodule

module scancnt(x, clk, cnt);	// by moore machine for sync
	input x, clk;
	output [2:0] cnt;
	wire a, b;

	d_ff da(a, clk, cnt[2]),
		 db(b, clk, cnt[1]);
	
	assign a = (cnt[2] & ~cnt[1] & ~x) | (~cnt[2] & cnt[1] & x);
	assign b = (~cnt[2] & cnt[1] & ~x) | (~cnt[2] & ~cnt[1] & x);
	assign cnt[0] = ~cnt[2] & ~cnt[1];

endmodule

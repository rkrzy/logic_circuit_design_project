module clr_counter(load, clr, clk, cnt);
	input load, clr, clk;
	output [3:0] cnt;
	reg [3:0] cnt;
	
	always@(posedge clk)
		if(clr)
			cnt <= 4'b0000;
		else if(load)
			if(cnt < 9)
				cnt <= cnt + 1;
			else
				cnt <= 0;
	
endmodule

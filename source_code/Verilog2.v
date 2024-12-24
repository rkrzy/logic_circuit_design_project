module counter_for_TEXT(clr, clk, hoho);
	input clr, clk;
	//output [21:0] cnt;
	output hoho;
	reg [10:0] cnt;
	reg hoho;
	

	always@(posedge clk)
		begin
			begin
				cnt <= 11'b00000000000;
				hoho <= 0;
			end
		if(cnt < 11'b11111111111)
			begin
			cnt <= cnt + 1;
			hoho<=0;
			end
		else
				begin
			cnt <= 11'b0;
			hoho <= 1;
				end
	end
endmodule

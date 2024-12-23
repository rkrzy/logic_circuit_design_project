module counter_(clr, clk, hoho);
	input clr, clk;
	//output [21:0] cnt;
	output hoho;
	reg [18:0] cnt;
	reg hoho;
	

	always@(posedge clk)
		begin
			begin
				cnt <= 19'b0000000000000000000;
				hoho <= 0;
			end
		if(cnt < 19'b1111111111111111111)
			begin
			cnt <= cnt + 1;
			hoho<=0;
			end
		else
				begin
			cnt <= 19'b0;
			hoho <= 1;
				end
	end
endmodule

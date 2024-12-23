module pzout(x, rset, clk, pz);
	input x, rset, clk;
	output pz;
	wire da, qa;
	
	assign da = qa ^ x;
	d_ff dff0(da, clk, qa);
	
	assign pz = ~qa & ~rset;
	
endmodule

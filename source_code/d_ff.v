module d_ff(D, CLK, Q);
	input D, CLK;
	output Q;
	reg Q;
	
	always@(posedge CLK)
		Q<=D;

endmodule

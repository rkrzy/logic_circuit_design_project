module cntld(in, clk, load);
	input [1:0] in;
	input clk;
	output load;
	wire x, y, da, db, qa, qb;
	
	assign x = in[1];
	assign y = in[0];
	//assign da = qb & ~x & ~y;
	assign da = x & y;
	//assign db = (qb & ~x & ~y) | (~qb & x & y);
	
//	d_ff	dff0(da, clk, qa),
//			dff1(db, clk, qb);
	d_ff	dff0(da, clk, qa);
	
	//assign load = ~qa & qb & ~x & ~y;
	assign load = qa & ~x & ~y;
	
endmodule

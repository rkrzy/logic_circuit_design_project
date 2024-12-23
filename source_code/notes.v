module notes(load, next, clk, note, length, run);
	input load, next, clk;
	output [3:0] note;
	output [1:0] length;
	output run;
	reg [7:0] notenum;
	reg [3:0] note;
	reg [1:0] length;
	reg run;
	
	always@(posedge clk)
	begin
		if(load)
			run <= 1'b1;

		if(next)
			if(notenum < 64)
				notenum <= notenum + 1;
			else
			begin
				run <= 1;
				notenum <= 0;
			end

		if(run)
		begin
			if(notenum == 0)
				notenum <= notenum + 1;

			case(notenum)
			1: note <= 5;
			2: note <= 0;

			3: note <= 5;
			4: note <= 0;

			5: note <= 6;
			6: note <= 0;

			7: note <= 6;
			8: note <= 0;

			9: note <= 5;
			10: note <= 0;

			11: note <= 5;
			12: note <= 0;

			13: note <= 4;
			14: note <= 4;
			15: note <= 4;
			16: note <= 0;

			17: note <= 5;
			18: note <= 0;

			19: note <= 5;
			20: note <= 0;

			21: note <= 4;
			22: note <= 0;

			23: note <= 4;
			24: note <= 0;

			25: note <= 2;
			26: note <= 2;
			27: note <= 2;
			28: note <= 2;
			29: note <= 2;
			30: note <= 0;

			31: note <= 0;
			32: note <= 0;

			33: note <= 5;
			34: note <= 0;

			35: note <= 5;
			36: note <= 0;

			37: note <= 6;
			38: note <= 0;

			39: note <= 6;
			40: note <= 0;

			41: note <= 5;
			42: note <= 0;

			43: note <= 5;
			44: note <= 0;

			45: note <= 4;
			46: note <= 4;
			47: note <= 4;
			48: note <= 0;

			49: note <= 5;
			50: note <= 0;

			51: note <= 3;
			52: note <= 0;

			53: note <= 2;
			54: note <= 0;

			55: note <= 3;
			56: note <= 0;

			57: note <= 1;
			58: note <= 1;
			59: note <= 1;
			60: note <= 1;
			61: note <= 1;
			62: note <= 0;

			63: note <= 0;
			64: note <= 0;
			endcase

			case(notenum)
			1: length <= 2;
			2: length <= 2;
			3: length <= 2;
			4: length <= 2;
			5: length <= 2;
			6: length <= 2;
			7: length <= 1;
			8: length <= 2;
			9: length <= 2;
			10: length <= 2;
			11: length <= 2;
			12: length <= 0;
			13: length <= 2;
			14: length <= 2;
			15: length <= 2;
			16: length <= 2;
			17: length <= 2;
			18: length <= 2;
			19: length <= 2;
			20: length <= 1;
			21: length <= 2;
			22: length <= 2;
			23: length <= 2;
			24: length <= 2;
			25: length <= 0;
			26: length <= 2;
			endcase
		end
	end
	
endmodule

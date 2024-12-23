module Mole_Game2(CLK, keypad, RESET/*, TEN, SEG_COM, SEG_DATA*/);

input CLK, RESET;
input [7:0]keypad;
/*output [6:0]TEN;
output [7:0] SEG_COM;
output [6:0] SEG_DATA;
*/




reg [7:0] timer = 100;
reg [7:0] mole = 0;
reg [7:0] score = 0;
reg [3:0]i;
reg check;
/*
SevenSeg S1(CLK, score[7:0], RESET, TEN, SEG_COM, SEG_DATA);
*/
always @(posedge CLK)
begin

/*begin
mole <= mole + 8'b01101101;
end
*/
if(RESET)
begin
	score <= 0;
	timer <= 100;
	mole <= 0;
	i <= 0;
	check <= 0;
end

/*else if(timer == 0 && check == 0)
begin
	mole <= 8'b00000000;
	check <= 1;
end

else if(timer == 0 && check == 1)
begin
	mole <= 8'b11111111;
	check <= 0;
end

else
begin
	for(i=0;i<8;i=i+1)
	begin
		if(mole[i]& keypad[i] == 1'b1)
		score[7:0] <= score[7:0]+1'b1;
	end
timer <= timer - 1;
end*/
end

endmodule
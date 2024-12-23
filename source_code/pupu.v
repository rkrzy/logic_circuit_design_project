module pupu(clk, keypad, RESET, mole, SEG_COM, SEG_DATA,pz, LCD_E,LCD_RS,LCD_RW, LCD_DATA,R,G,B);
	input  clk;
	input RESET;
	input [7:0]keypad;

	output [7:0]mole;
	output [7:0] SEG_COM;
	output [6:0] SEG_DATA;
	output pz;
	
	wire [3:0] notenum;
	wire [1:0] len;
	wire [3:0] cnt0, cnt1, cnt2, cnt3, cnt4, cnt5;
	wire cl0, cl1, cl2, cl3, cl4;
	wire clr, run;

	reg [7:0]q;
    wire hoho;
	wire TEXT_DRIVER;
	wire PIC_DRIVER;
	reg [7:0]mole;
	reg [7:0] timer = 45;
	reg [7:0] score = 0;
	reg [3:0]i=0;
	reg check;
	reg [7:0] keypad_temp;
	reg score_trigger = 0;
	output LCD_E;
	output LCD_RS;
	output LCD_RW;
	output [7:0]LCD_DATA;

	output [3:0]R;
	output [3:0]G;
	output [3:0]B;
	
	
	counter_ LETSCOUNT(RESET, clk, hoho);
	counter_for_TEXT TAXI(clr, clk, TEXT_DRIVER);
	counter_for_PIC PICKME(clr, clk, PIC_DRIVER);
	
	HB_CLCD MAN(RESET,TEXT_DRIVER,score,LCD_E,LCD_RS,LCD_RW,LCD_DATA);
	
	HB_FULL_LED(RESETN,PIC_DRIVER,R,G,B);
	
	

	
	
	notes notegen(RESET, clr, clk, notenum, len, run);
	
	note playnote(notenum, clk, pz);
	
	clrctr2 cctr2(run, cnt5, cnt4, cnt3, clr);

	clr_counter	ccnt0(1'b1, clr, clk, cnt0),
				ccnt1(cl0, clr, clk, cnt1),
				ccnt2(cl1, clr, clk, cnt2),
				ccnt3(cl2, clr, clk, cnt3),
				ccnt4(cl3, clr, clk, cnt4),
				ccnt5(cl4, clr, clk, cnt5);

	cntld	CL0({cnt0[3], cnt0[0]}, clk, cl0),
			CL1({cnt1[3], cnt1[0]}, clk, cl1),
			CL2({cnt2[3], cnt2[0]}, clk, cl2),
			CL3({cnt3[3], cnt3[0]}, clk, cl3),
			CL4({cnt4[3], cnt4[0]}, clk, cl4);
			
SevenSeg S1(clk, score[7:0], RESET, SEG_COM, SEG_DATA);

//
	always@(posedge clk or posedge RESET)
		if(RESET) q<=8'b0;
		else
		
		begin
			begin
				q <= 8'b00000000;
			end
		if(q < 8'b11111111)
			begin
			q <= q + 5'b11111;
			end
		else
				begin
			q <= 8'b0;
				end
		end
//

always @(posedge hoho)
begin

if(score_trigger == 1)
begin
	score_trigger = 0;
end
else begin
	score_t
end
begin
    mole <= mole + q;
end

if(RESET)
begin
	score <= 0;
	timer <= 45;
	mole <= 0;
	i <= 0;
	check <= 0;
end

else if(timer == 0 && check == 0)
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
	
if((mole[0] & keypad_temp[0]) == 1'b1) begin
    score[7:0] <= score[7:0]+1'b1; end
    else if((mole[1] & keypad_temp[1]) == 1'b1) begin
    score[7:0] <= score[7:0]+1'b1; end
    else if((mole[2] & keypad_temp[2]) == 1'b1) begin
    score[7:0] <= score[7:0]+1'b1; end
    else if((mole[3] & keypad_temp[3]) == 1'b1) begin
    score[7:0] <= score[7:0]+1'b1; end
    else if((mole[4] & keypad_temp[4]) == 1'b1) begin
    score[7:0] <= score[7:0]+1'b1; end
    else if((mole[5] & keypad_temp[5]) == 1'b1) begin
    score[7:0] <= score[7:0]+1'b1; end
    else if((mole[6] & keypad_temp[6]) == 1'b1) begin
    score[7:0] <= score[7:0]+1'b1; end
    else if((mole[7] & keypad_temp[7]) == 1'b1) begin
    score[7:0] <= score[7:0]+1'b1; end
    else begin end
    
score_trigger = 1;
timer <= timer - 1;
end
	
end

always @(posedge clk)   
begin
    case (keypad) 
    8'b00000001 : begin keypad_temp = 8'b00000001; end 
    8'b00000010 : begin keypad_temp = 8'b00000010; end
    8'b00000100 : begin keypad_temp = 8'b00000100; end
    8'b00001000 : begin keypad_temp = 8'b00001000; end
    8'b00010000 : begin keypad_temp = 8'b00010000; end 
    8'b00100000 : begin keypad_temp = 8'b00100000; end
    8'b01000000 : begin keypad_temp = 8'b01000000; end
    8'b10000000 : begin keypad_temp = 8'b10000000; end
    endcase
if(score_trigger == 1)
begin
	score_trigger = 0;
	 keypad_temp = 8'b00000001;
end

end
			
			
endmodule
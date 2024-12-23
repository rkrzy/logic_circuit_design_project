module HB_FULL_LED(
	RESETN, CLK,//리셋신호와 클럭 신호
	R,G,B //RGB
	);
	
	input RESETN, CLK;
	output [3:0]R,G,B;
	
	integer CNT;//클럭마다 증가하여 특정 조건에서 색상제어에 사용된다.
	integer R_REG,G_REG,B_REG; //CNT값에 따라 특정 색상 레벨을 결정하는 임계값으로 사용된다.
	reg [3:0] R,G,B;
	/*
always @(posedge RESETN or posedge CLK)
begin if(RESETN)
  CNT=0;
  else  CNT<=CNT+1;
 end
*/
always @(posedge RESETN or posedge CLK)
		begin
			if(RESETN)//리셋신호가 들어왔을 경우에 기본값으로 초기화를 수행한다.
				begin
					CNT=0;
					R_REG =100;
					G_REG =0;
					B_REG =0;
				end

			else if(CNT<=4)//RED  		// OKAY 빨간색 계열로 설정
				begin	
					R_REG =100;
					G_REG =0;
					B_REG =0;
				end
			else if(CNT<=7) // JUHWANG //주황색 계열로 설정
				begin
					R_REG =100;
					G_REG =0;
					B_REG =0;
				end
			else if(CNT<=11) // NO 회색쪽으로 설정
				begin
					R_REG =33;
					G_REG =33;
					B_REG =33;
				end
			else if(CNT<=14) //GREEN	//OKAY 초록색으로 설정
				begin	 
					R_REG =0;
					G_REG =100;
					B_REG =0;
				end
			else if(CNT<=16) // BLUE 	//OKAY 바란색으로 설정
				begin	
					R_REG =0;
					G_REG =0;
					B_REG =100;
				end
			else if(CNT<=19) //파란색으로 설정
				begin
					R_REG =0;
					G_REG =0;
					B_REG =100;
				end
			else if(CNT<=22) // PURPLE //OKAY 보라색으로 설정
				begin	
					R_REG =50;
					G_REG =0;
					B_REG =50;
				end
			else if(CNT>=99)
			begin//CNT를 리셋하여 주기를 반복
			CNT=0;
			end
			
			else
			begin // 그 외의 구간에서는 CNT를 증가한다.
			CNT=CNT+1;
			end
		end
		
		
always @(posedge RESETN or posedge CLK)
		begin//일정 기간동안 R LED를 최대 밝기로 켜준다.
			if(RESETN) R=4'b0000;
			else if(CNT<=10) R=4'b1111;	
			else R=R+1;
		end 
	
always @(posedge RESETN or posedge CLK)
		begin
			if(RESETN) G=4'b0000;
			else if(CNT<=G_REG) G=4'b1111;	
			else G=G+1;
		end

always @(posedge RESETN or posedge CLK)
		begin
			if(RESETN) B=4'b0000;
			else if(CNT<=B_REG) B=4'b1111;	
			else B=B+1;
		end
		
	
endmodule
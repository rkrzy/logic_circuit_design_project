
module SevenSeg(CLK,I,N_Reset,SEG_COM,SEG_DATA);

input CLK,N_Reset;
input [7:0] I;
output [7:0] SEG_COM;
output [7:0] SEG_DATA;

wire [9:0] T;
wire A1,B1,C1,D1,E1,F1,G1;
wire A2,B2,C2,D2,E2,F2,G2;
wire A3,B3,C3,D3,E3,F3,G3;


BinarytoBCD8 u1 (I,T);

BCDto7SEG u2_1(T[3],T[2],T[1],T[0], A1,B1,C1,D1,E1,F1,G1); // 1의 자리
BCDto7SEG u2_2(T[7],T[6],T[5],T[4], A2,B2,C2,D2,E2,F2,G2); //10의 자리
BCDto7SEG u2_3(0,0,T[9],T[8], A3,B3,C3,D3,E3,F3,G3); //100의 자리

SevenSeg_CTRL u3(CLK, N_Reset,{A1,B1,C1,D1,E1,F1,G1},{A2,B2,C2,D2,E2,F2,G2},{A3,B3,C3,D3,E3,F3,G3},0,0,0,0,0, SEG_COM, SEG_DATA);

endmodule

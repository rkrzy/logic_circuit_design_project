
module BinarytoBCD8 (A,Out);

input [7:0] A;
output [9:0] Out;
wire [3:0] B1, B2, B3, B4, B5, B6, B7, C1, C2, C3, C4, C5, C6, C7;
wire NULL;
/* B는 디코더 L의 입력, C는 L의 출력 */
assign NULL = 0;

assign B1 = {NULL,A[7],A[6],A[5]};

Linedecoder L1(B1,C1);

assign B2 = {C1[2],C1[1],C1[0],A[4]};

Linedecoder L2(B2, C2);

assign B3 = {C2[2],C2[1],C2[0],A[3]};

Linedecoder L3(B3, C3);

assign B4 = {C3[2],C3[1],C3[0],A[2]};
assign B6 = {NULL,C1[3],C2[3],C3[3]};

Linedecoder L4(B4, C4);

Linedecoder L6(B6, C6);

assign B5 = {C4[2],C4[1],C4[0],A[1]};
assign B7 = {C6[2],C6[1],C6[0],C4[3]};

Linedecoder L5(B5, C5);

Linedecoder L7 (B7, C7);

assign Out = {C6[3],C7[3],C7[2],C7[1],C7[0],C5[3],C5[2],C5[1],C5[0],A[0]};

endmodule

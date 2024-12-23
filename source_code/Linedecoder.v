
module Linedecoder(A,S);

input [3:0] A;
output [3:0] S;
reg [3:0] out;

always @(A[3],A[2],A[1],A[0])
begin
case({A[3],A[2],A[1],A[0]})
4'b0000 : out <= 4'b0000; //0
4'b0001 : out <= 4'b0001; //1
4'b0010 : out <= 4'b0010; //2
4'b0011 : out <= 4'b0011; //3
4'b0100 : out <= 4'b0100; //4
4'b0101 : out <= 4'b1000; //5
4'b0110 : out <= 4'b1001; //6
4'b0111 : out <= 4'b1010; //7
4'b1000 : out <= 4'b1011; //8
4'b1001 : out <= 4'b1100; //9
default : out <= 4'b0000; //NULL
endcase
end

assign {S[3],S[2],S[1],S[0]} = out;

endmodule
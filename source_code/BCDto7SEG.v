
module BCDto7SEG (A3,A2,A1,A0,S6,S5,S4,S3,S2,S1,S0);

input A3,A2,A1,A0;
output S6,S5,S4,S3,S2,S1,S0;

reg [6:0] out;

always @(A3,A2,A1,A0)
begin
case({A3,A2,A1,A0})
4'b0000 : out <= 7'b1111110; //0
4'b0001 : out <= 7'b0110000; //1
4'b0010 : out <= 7'b1101101; //2
4'b0011 : out <= 7'b1111001; //3
4'b0100 : out <= 7'b0110011; //4
4'b0101 : out <= 7'b1011011; //5
4'b0110 : out <= 7'b1011111; //6
4'b0111 : out <= 7'b1110010; //7
4'b1000 : out <= 7'b1111111; //8
4'b1001 : out <= 7'b1111011; //9
default : out <= 7'b0000000; //NULL
endcase
end

assign {S6,S5,S4,S3,S2,S1,S0} = out;

endmodule
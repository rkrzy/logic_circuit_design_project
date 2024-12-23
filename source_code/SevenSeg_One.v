module SevenSegmentDecoder (
    input [3:0] value,        // 입력 값 (0~9)
    output [6:0] segments // 7-segment 출력
);
    always @(*) begin
        case (value)
            4'b0000: segments = 7'b1111110; // 0
            4'b0001: segments = 7'b0110000; // 1
            4'b0010: segments = 7'b1101101; // 2
            4'b0011: segments = 7'b1111001; // 3
            4'b0100: segments = 7'b0110011; // 4
            4'b0101: segments = 7'b1011011; // 5
            4'b0110: segments = 7'b1011111; // 6
            4'b0111: segments = 7'b1110000; // 7
            4'b1000: segments = 7'b1111111; // 8
            4'b1001: segments = 7'b1111011; // 9
            default: segments = 7'b0000000; // OFF
        endcase
    end
endmodule
module notes(load, next, clk, note, length, run, finish);
    input load, next, clk, finish;
    output [3:0] note;
    output [1:0] length;
    output run;
    reg [7:0] notenum;
    reg [3:0] note;
    reg [1:0] length;
    reg run;

    always @(posedge clk) begin
        if (load) 
            run <= 1'b1;

        if (finish == 1) begin
            notenum <= 56;
            end
            
        if (next && finish == 0 ) begin
            if (notenum < 56)
                notenum <= notenum + 1;
            else begin
                notenum <= 0; // 반복을 위해 notenum 초기화
            end
        end
        

        if (run) begin

            case (notenum)
                0: note <= 4'b0001; // 도
                1: note <= 4'b0010; // 레
                2: note <= 4'b0100; // 미
                3: note <= 4'b0101; // 파
                4: note <= 4'b0110; // 솔
                5: note <= 4'b1000; // 라
                6: note <= 4'b0111; // 시
                7: note <= 4'b0000; // Rest

                // 첫 번째 구절
                8: note <= 4'b0001; // 도
                9: note <= 4'b1000; // 라
                10: note <= 4'b0110; // 솔
                11: note <= 4'b0101; // 파
                12: note <= 4'b0001; // 도
                13: note <= 4'b0110; // 솔
                14: note <= 4'b0101; // 파
                15: note <= 4'b0010; // 레

                // 두 번째 구절
                16: note <= 4'b0100; // 미
                17: note <= 4'b0011; // 시
                18: note <= 4'b0110; // 솔
                19: note <= 4'b0001; // 도
                20: note <= 4'b0001; // 도
                21: note <= 4'b0001; // 도
                22: note <= 4'b0001; // 도
                23: note <= 4'b0010; // 레

                // 세 번째 구절
                24: note <= 4'b0100; // 미
                25: note <= 4'b0100; // 미
                26: note <= 4'b0100; // 미
                27: note <= 4'b0100; // 미
                28: note <= 4'b0100; // 미
                29: note <= 4'b0000; // Rest
                30: note <= 4'b0110; // 솔
                31: note <= 4'b0101; // 파

                // 네 번째 구절
                32: note <= 4'b0001; // 도
                33: note <= 4'b0010; // 레
                34: note <= 4'b0110; // 솔
                35: note <= 4'b0101; // 파
                36: note <= 4'b0001; // 도
                37: note <= 4'b0110; // 솔
                38: note <= 4'b0000; // Rest
                39: note <= 4'b0000; // Rest

                // 반복 구절
                40: note <= 4'b0100; // 미
                41: note <= 4'b0110; // 솔
                42: note <= 4'b0110; // 솔
                43: note <= 4'b0110; // 솔
                44: note <= 4'b0110; // 솔
                45: note <= 4'b0000; // Rest
                46: note <= 4'b0110; // 솔
                47: note <= 4'b0101; // 파

                // 마지막 구절
                48: note <= 4'b0110; // 솔
                49: note <= 4'b0101; // 파
                50: note <= 4'b0001; // 도
                51: note <= 4'b0010; // 레
                52: note <= 4'b0110; // 솔
                53: note <= 4'b0101; // 파
                54: note <= 4'b0000; // Rest
                55: note <= 4'b0000; // Rest

                default: note <= 4'b0000; // Rest
            endcase
            
            // 길이 설정: 각 음표에 대한 길이 조정
            case (notenum)
                0: length <= 2; 
                1: length <= 2;
                2: length <= 2;
                3: length <= 2;
                4: length <= 2;
                5: length <= 2;
                6: length <= 2;
                7: length <= 1; // Rest
                8: length <= 2; 
                9: length <= 2; 
                10: length <= 2; 
                11: length <= 2; 
                12: length <= 2; 
                13: length <= 2; 
                14: length <= 2; 
                15: length <= 1; // Rest

                // 각 구절에 맞는 길이 설정
                16: length <= 2; 
                17: length <= 2;
                18: length <= 2;
                19: length <= 2;
                20: length <= 2;
                21: length <= 2;
                22: length <= 2; 
                23: length <= 1; // Rest

                default: length <= 0; // Rest
            endcase
        end
    end
endmodule

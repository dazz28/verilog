module human_counter(
    (* keep = "true" *) input clk,
    (* keep = "true" *) input rst,
    (* keep = "true" *) input [7:0] din,
    (* keep = "true" *) input wire en,
    (* keep = "true" *) output reg [7:0] cnt,
    (* keep = "true" *) output reg cnt_ready,
    (* keep = "true" *) output reg led_rst // Reset signal for the LED module
);

    // 카운트 및 준비 신호 제어
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 0;         // 리셋 시 카운트 초기화
            cnt_ready <= 0;   // 준비 신호 초기화
            led_rst <= 0;     // LED 모듈 리셋 비활성화
        end 
        else if (en) begin
            cnt_ready <= 0;   // 기본적으로 cnt_ready는 0
            led_rst <= 0;     // 기본적으로 LED 리셋 비활성화

            if (din == "@") begin
                cnt <= 0;     // "@" 입력 시 카운트 초기화
                led_rst <= 1; // LED 리셋 신호 활성화
            end 
            else if (din == "h") begin
                cnt <= cnt + 1;   // "h" 입력 시 카운트 증가
                cnt_ready <= 1;   // 카운트 완료 신호 설정
            end
        end
    end
endmodule

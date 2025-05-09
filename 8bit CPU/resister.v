module resister_N_bit_posedge(
    input [7:0] D,
    input clk,
    input reset_p,
    input wr_e_p,
    input rd_e_p,
    output reg [7:0] Q,
    output [7:0] tri_state_Q
    );

    // 레지스터 동작: positive edge에서 동작
    always @(posedge clk or posedge reset_p) begin
        if (reset_p)
            Q <= 0;
        else if (wr_e_p)
            Q <= D;
    end


    // tri-state buffer처럼 동작: rd_e_p가 1일 때만 출력
    assign tri_state_Q = rd_e_p ? Q : {8{1'bz}};

endmodule

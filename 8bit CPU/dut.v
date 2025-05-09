module program_addr_counter(
    input clk,
    input reset_p,
    input pc_inc,
    input load_pc,
    input pc_o_en,
    input [7:0] pc_in,
    output [7:0] pc_out
    );
    
    wire [7:0] data_out, p_addr, p_addr_out;
    
    hadder_n_bit U0 (.A(pc_inc), .data_in(p_addr_out), .data_out(data_out));
    //8비트 adder 모듈

    assign p_addr = (load_pc) ? pc_in : data_out;       //mux를 쓰는 간단한 방법
    //MUX를 거쳐 나온 값을 레지스터의 입력중 하나로 넣어줌
    
    resister_N_bit_posedge U1 (.D(p_addr), .clk(clk), .reset_p(reset_p), .wr_e_p(1'b1), .rd_e_p(pc_o_en), .Q(p_addr_out), .tri_state_Q(pc_out));
    //positive edge에서 동작하는 8bit 레지스터 
    
endmodule

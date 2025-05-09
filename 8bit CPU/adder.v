module hadder_n_bit(
    input [7:0] A,
    input [7:0] data_in,
    output [7:0] data_out
    );
    
    assign data_out = A + data_in;
endmodule

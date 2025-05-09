module top(
    input clk, rx_data, rst, cnt_rst,
    output clk_out,
    output [2:0] led_out
);
wire en;
wire [7:0] data;
wire baud_clk;
wire [7:0] cnt;
wire cnt_ready;
wire led_rst;

prescaler U0(.sys_clk(clk), .rst(rst), .out_clk(baud_clk));
uart_rx U1(.clk(baud_clk), .rx_data(rx_data), .dout(data), .en(en));
//uart_tx u2(.clk(baud_clk), .start(en), .din(data), .tx_data(tx_data)); 
human_counter U3(.clk(baud_clk), .rst(cnt_rst), .din(data), .en(en), .cnt(cnt), .cnt_ready(cnt_ready), .led_rst(led_rst));
led_control U4(.clk(baud_clk) , .led_in(cnt), .led_en(cnt_ready) , .led_out(led_out), .rst(led_rst));
assign clk_out = baud_clk;

endmodule

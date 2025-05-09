module prescaler(
		input sys_clk, rst,
		output reg out_clk);
reg [15:0] cnt;
always@(posedge sys_clk or posedge rst) begin
	if(rst) begin cnt <=0; out_clk <=0; end
		else if(cnt==16'h196e) begin out_clk <=~out_clk; cnt<=0; end // 16진수 196e 은 10진수로 6,510
    			else cnt <=cnt+1; 
end
endmodule

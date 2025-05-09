module led_control (
    input clk,
    (*keep="true"*) input [7:0] led_in,  // 8-bit input signal
    (* keep = "true" *) input led_en,        // Enable signal
    (* keep = "true" *) input rst,              // Reset signal
    output reg [2:0] led_out // 4-bit output to indicate range
);
    reg [2:0] last_led_out; // Register to store last LED state

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset does not change the LED state, only stores the last state
            last_led_out <= last_led_out; 
        end else if (led_en) begin
            // Update LED state based on led_in range
            if (led_in <= 8'd5) 
                led_out = 3'b010; // 0~5
            else if (led_in <= 8'd10) 
                led_out = 3'b110; // 6~10
            else if (led_in <= 8'd15) 
                led_out = 3'b100; // 11~15
            else 
                led_out = 3'b000; // Out of range
        // Store the current LED state
            last_led_out <= led_out;
            
        end else begin
            // Maintain the last LED state when disabled
            led_out <= last_led_out;
        end
    end

endmodule

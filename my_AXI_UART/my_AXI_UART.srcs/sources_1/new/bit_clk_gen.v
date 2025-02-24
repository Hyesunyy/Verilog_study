`timescale 1ns / 1ps

module bit_clk_gen(
    input CLK,
    output reg BIT_CLK
    );
parameter CLK_FREQ = 125_000_000;
parameter BAUD_RATE = 115_200;
parameter CLK_MAX = CLK_FREQ / BAUD_RATE;
reg [20:0] clk_cnt = 21'd0;

always @(posedge CLK)
begin
      if(clk_cnt == (CLK_MAX-1)) begin
            clk_cnt <= 21'd0;
            BIT_CLK <= 1'b1;
        end else begin
            clk_cnt <= clk_cnt + 1;
            BIT_CLK<= 1'b0;
        end    
end // always                                    
     
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/02/20 11:59:03
// Design Name: 
// Module Name: watch_counter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

 module watch_counter_tb( );
 watch_counter uut0 ( . watch_state(w_state), . clk(CLK), . pls_10ms(clk_10) , .under_sec_cnt(usec), .sec_cnt(sec),.min_cnt(min));
 reg [1:0]w_state;
 reg CLK, clk_10;
 wire [6:0] usec;
 wire [5:0] sec;
 wire [5:0] min;
 
 
 parameter CLK_PD = 3;

initial 
    begin
        clk_10<=0;
        w_state <= 0;
    end

always #(CLK_PD/2) clk_10 = ~clk_10;

initial 
    begin
        w_state = 0;
        #(CLK_PD*2);
        w_state = 1;
        #(CLK_PD*950);
        w_state = 2;
        #(CLK_PD*2);
        w_state = 0;

    end
 
 
endmodule

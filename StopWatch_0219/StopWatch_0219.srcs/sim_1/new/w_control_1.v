//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/02/21 12:29:53
// Design Name: 
// Module Name: w_control_1
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


module w_control_1( );

reg btn0,btn1,clk;

 wire [6:0]USEC;
 wire [5:0]SEC;
 wire [5:0] MIN;
 
 wire[1:0] w_state;
 wire high;
 wire low;
 
watch_control uut3( . BTN0(btn0),  . BTN1(btn1),  . usec(USEC), . sec(SEC), . min(MIN), . CLK(clk), . watch_state(w_state), . hex_h(high), . hex_l(low) );
 
parameter CLK_PD = 8.0;

initial 
    begin
        clk<=0;
        btn0 <= 0;
        btn1 <= 0;
    end

always #(CLK_PD/2) clk = ~clk;

initial 
    begin
         #(CLK_PD*2);
        btn0 = 0;
        #(CLK_PD*2);
        btn0 = 1;
        #(CLK_PD);
         btn0 = 0;
        #(CLK_PD*2);
        btn1 = 1;
        #(CLK_PD*2);
    end


endmodule

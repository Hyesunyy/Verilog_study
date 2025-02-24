`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/02/20 17:48:49
// Design Name: 
// Module Name: stopwatch_tb
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


module stopwatch_tb(  );
stopwatch_top uut4 (  );

reg clk,btn0,btn1;

parameter CLK_PD = 8.0;

initial 
    begin
        clk<=0;
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

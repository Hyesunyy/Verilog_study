`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/02/20 14:39:56
// Design Name: 
// Module Name: pulse_10ms_tb
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


module pulse_10ms_tb(  );
pulse_10ms  #(.CLK_FREQ_10ms(10)) uut1 ( . clk(CLK), .pls_10ms(clk_10) );

reg CLK;
wire clk_10;
parameter CLK_PD = 8.0;

initial 
    begin
        CLK<=0;
    end

always #(CLK_PD/2) CLK = ~CLK;

endmodule

//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/02/20 14:38:11
// Design Name: 
// Module Name: pulse_10ms
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


module pulse_10ms( input clk, output reg pls_10ms );
    
    parameter CLK_FREQ_10ms = 1250000;
    reg [20:0]clk_cnt = 0;
    
    //**** gen clk_10ms
    
    initial pls_10ms = 0;
    
    always@(posedge clk)
     begin
        if(clk_cnt == (CLK_FREQ_10ms/2)-1)    begin  pls_10ms <= ~pls_10ms;  clk_cnt <= 0;   end
        else    begin   clk_cnt <= clk_cnt +1;  end
     end

endmodule

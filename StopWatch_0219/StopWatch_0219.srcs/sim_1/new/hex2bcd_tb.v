`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/02/20 10:46:29
// Design Name: 
// Module Name: hex2bcd_tb
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


module hex2bcd_tb( );
hex2bcd uut0( . rst(RST), . clk(CLK), . start(START), . hex(HEX), . BCD(bcd) );

reg RST, CLK ,START ;
reg [6:0]HEX;
wire [7:0] bcd;

parameter CLK_PD = 8.0;

initial 
    begin
        CLK <=0;
    end

always #(CLK_PD/2) CLK = ~CLK;

initial 
    begin
        #(CLK_PD*2);
        HEX = 25;
        #(CLK_PD*5);
        START = 1;
        #(CLK_PD*10);
         START = 1;
    end


endmodule

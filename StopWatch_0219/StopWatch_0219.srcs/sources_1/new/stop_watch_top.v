`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/02/20 15:46:16
// Design Name: 
// Module Name: stop_watch_top
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


module stop_watch_top(

    );
    
    watch_counter(
    .watch_state(),
    . clk(),
    . clk_10ms(),
    
    . under_sec_cnt(),
    . sec_cnt(),
    . min_cnt()
    );
    
    
    
    watch_control(
    . BTN0(), 
    . BTN1(), 
    . usec(),
    . sec,
    . min,
    . CLK,
    . RST,
    
    .] watch_state,
   . hex_h,
    . hex_l
 );
 
 
 
 
 hex2bcd(
    . rst,
    . clk,
   . start,
    . hex,
    
    . BCD
    );
    
    
    
    
endmodule

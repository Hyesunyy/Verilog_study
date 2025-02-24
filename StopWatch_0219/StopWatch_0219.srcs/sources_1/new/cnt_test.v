`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/02/19 14:05:45
// Design Name: 
// Module Name: cnt_test
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


module bcd_cnt_test(
    input pls_10ms,
    input clk,
/*    output [5:0] hex_min,
    output [5:0] hex_sec,
    output [6:0] hex_usec,*/
    output [6:0] bcd_min,
    output [6:0] bcd_sec,
    output [7:0] bcd_usec
    );
    
    reg [3:0] usec_10;
    reg [3:0] usec_1;
    
    reg [2:0] sec_10;
    reg [3:0] sec_1;
    
    reg [2:0] min_10;
    reg [3:0] min_1;
    
    // count usec
   always@(posedge pls_10ms)
    begin
    
        if(usec_1 == 9)
            begin
                usec_1 <= 0;
                usec_10 <= usec_10+1;
            end
         else
            begin
                usec_1 <= usec_1+1;
            end
            
         if(usec_10 == 5)
            begin
                
            end   
            

    end 
    
    
    
    
endmodule

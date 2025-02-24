//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/02/19 12:38:20
// Design Name: 
// Module Name: watch_counter
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


module watch_counter(
    input [1:0]watch_state,
    input clk,
    input pls_10ms,
    output reg [6:0] under_sec_cnt,
    output reg [5:0] sec_cnt,
    output reg [5:0] min_cnt
    );
    
    localparam  clear = 2'b00, count = 2'b01 , pause = 2'b10;
    
    
    //**** counter  control
    always@(posedge pls_10ms, watch_state,under_sec_cnt)
        begin
            if(watch_state == clear) begin  under_sec_cnt <= 0;     sec_cnt <= 0;    min_cnt <= 0;  end
                
            else if(watch_state == count) begin  
                    if(under_sec_cnt == 99)     begin   under_sec_cnt <= 0;     sec_cnt <= sec_cnt +1;
                            if(sec_cnt == 59)   begin   sec_cnt = 0;    min_cnt <= min_cnt +1;
                                    if(min_cnt == 59) begin   under_sec_cnt <= under_sec_cnt;     sec_cnt <= sec_cnt;      min_cnt <= min_cnt;     end
                             end
                    end
                    else begin  under_sec_cnt <= under_sec_cnt +1;  end                       
            end 
              
             else  begin   under_sec_cnt <= under_sec_cnt;  sec_cnt <= sec_cnt;    min_cnt <= min_cnt;     end
       end

endmodule

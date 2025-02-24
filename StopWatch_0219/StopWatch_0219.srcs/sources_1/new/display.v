//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/02/20 09:46:03
// Design Name: 
// Module Name: display
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


module hex2bcd(
    input clk,
    input start,
    input [6:0] hex,
    
    output reg [7:0] BCD
    );
    
    reg [6:0]temp_hex;
    reg [1:0] start_cnt = 0;
    reg st0 = 0, st1 = 0 , temp_st0 = 0, temp_st1 = 0;
    
    reg[3:0] hex_10;
    reg [3:0] hex_1;
    
    
    //**** st0 & st1
    always@(posedge clk) begin     
            if(start) begin     
                    temp_st0 <= 1;   st0 <= temp_st0;     
                      
                    if(st0)
                        begin temp_st1 <= 1;   st1 <= temp_st1;  end
                    
                    else
                        begin temp_st1 <= 0;  st1 <= temp_st1;  end                            
                           
             end else
                begin temp_st0 <= 0; st0  <= temp_st0;  end
              
    end

 
   //****start_cnt
    always@(posedge clk) 
        begin
            
            if(st0 & ~st1)
                begin
                    temp_hex <= hex;
                end
                
            else if((st1)&&(start_cnt < 3))
                start_cnt <= start_cnt +1;
                
        end
    
    
//****hex_10 &hex_1
    always@(posedge clk)
        begin
           
            if(start_cnt == 0)
                begin
                    hex_10 <= temp_hex/10;
                end
           
            else if (start_cnt == 1)
                begin
                    hex_1 <= temp_hex %10;
                end
                
            else
              begin
                BCD <= {hex_10 , hex_1};   
              end
              
        end
   
endmodule

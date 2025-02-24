//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/02/20 12:36:41
// Design Name: 
// Module Name: watch_control
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


module watch_control(
    input BTN0, //clear , start, stop
    input BTN1, //High : min/sec
    
output    [6:0] usec,
output    [5:0] sec,
output    [5:0] min,
    
    input CLK,
    
    output [1:0] watch_state,
    output [7:0] hex_h,
    output [7:0] hex_l
 );
   
  localparam clear = 2'b00, count = 2'b01 , pause = 2'b10;
  parameter CLK_FREQ  = 125_000_000; 
  
  reg [1:0] curr_state;
  reg [1:0] next_state;
 
  reg [1:0] BTN0_cnt = 0;
  reg BTN0_mode = 0;    // 1: count , 0:pause
  reg disp_mode = 0;
  reg CLEAR;
    
  
  //*** watch_state
  initial curr_state = 0;
assign watch_state = curr_state;


  //*** BTN0_mode
  always@(posedge CLK ) begin
    if(BTN0) begin  
        BTN0_mode <= ~BTN0_mode;
        BTN0_cnt <= BTN0_cnt+1; 
        
        if(BTN0_cnt ==2) begin BTN0_cnt <= 0;   CLEAR <= 1; end
        
    end
  end         
  
  
  //*** BTN1 (disp_mod)
  always@(posedge CLK ) begin
     if(BTN1)    disp_mode <= ~disp_mode;
  end
  
  //***disp_mode
  assign hex_h = (disp_mode) ? {0,min} : {0,sec};
  assign hex_l = (disp_mode) ? {0,sec} : usec;
  
//***curr_state 
initial curr_state <= clear;

 always@(posedge CLK ) begin curr_state <= next_state;   end
 
 //***next_state
 always@(curr_state, BTN0_mode, BTN0_cnt) begin
        case (curr_state)
        
            clear :  begin
                disp_mode <= 0; //pull , sec/usec
                
                if(BTN0_mode) 
                    begin   next_state <= count;   end 
                else
                    begin   next_state <= clear;    end   
            end
            
            count : begin
                if(~BTN0_mode)
                    begin   next_state <= pause;   end
                else
                    begin   next_state <= count;   end
             end      
              
             pause : begin
                if(BTN0_mode)              begin   next_state <= count;   end
                else if(CLEAR)   begin  curr_state <= clear;      end
                else                                begin   next_state <= pause;   end
             end
              
        endcase              
   end
   
    wire p_10;
    pulse_10ms  dut2( .clk(CLK), .pls_10ms(p_10) );

    watch_counter dut1(
        .watch_state(watch_state),
        .clk(CLK),
        .pls_10ms(p_10),
        .under_sec_cnt(usec),
        .sec_cnt(sec),
        .min_cnt(min)
        );
       
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/02/20 17:06:34
// Design Name: 
// Module Name: stopwatch_top
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


module stopwatch_top(  
    input clk,
    input btn0,
    input btn1,
    
    output [6:0]an_left,
    output [6:0]an_right,
    output ca_left,
    output ca_right
    );
    
    wire pls_10ms;
    wire [1:0] watch_state;
    wire [7:0]hex_h;
    wire [7:0]hex_l;
    
    wire[6:0]usec;
    wire[5:0]sec;
    wire[5:0]min;
    
pulse_10ms uut1(. clk(clk), . pls_10ms(pls_10ms) );

watch_counter  uut_wcounter( .watch_state(watch_state), . clk(clk), . under_sec_cnt(usec), . sec_cnt(sec), . min_cnt(min)  );

watch_control  uut_wcntrl( . BTN0(btn0),  . BTN1(btn1),   . usec(usec), . sec(sec), . min(min),   . CLK(clk),  . watch_state(watch_state), . hex_h(hex_h), . hex_l(hex_l) );

hex2bcd uut_h2b(.clk(clk), .start(pls_10ms),.hex(hex_h));

my_disp_mod uut_disp_1( . TICK(pls_10ms),   . HIGH(hex_h[7:4]), .LOW(hex_h[3:0]), . CA(ca_left), . AN(an_left) );   
my_disp_mod uut_disp_2( . TICK(pls_10ms),   . HIGH(hex_l[7:4]), .LOW(hex_l[3:0]), . CA(ca_right), . AN(an_right) );     
     
endmodule

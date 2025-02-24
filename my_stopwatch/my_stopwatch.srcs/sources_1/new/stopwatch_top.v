`timescale 1ns / 1ps

module stopwatch_top(
    input CLK,
    input BTN0,
    input BTN1,
    output CA,
    output [6:0] AN
    );
    parameter CLK_FREQ = 125_000_000;
    
    wire tick;
    wire [3:0]digit_10, digit_1;
    
    
    my_stopwatch stopwatch_0(.CLK(CLK), .BTN0(BTN0), .BTN1(BTN1), .TICK(tick), .DIGIT_10(digit_10), .DIGIT_1(digit_1));
    led stopwatch_1(.DIGIT_10(digit_10), .DIGIT_1(digit_1), .TICK(tick), .AN(AN), .CA(CA));
    tick_gen#(.CLK_FREQ(CLK_FREQ))stopwatch_2(.CLK(CLK), .TICK(tick));
    
    
endmodule

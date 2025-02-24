`timescale 1ns / 1ps

module my_stopwatch_tb(

    );
    parameter CLK_PD = 8.00;
    reg clk, btn0, btn1;
    wire ca;
    wire [6:0]an;
    
stopwatch_top #(.CLK_FREQ(300)) uut( .CLK(clk), .BTN0(btn0), .BTN1(btn1), .CA(ca), .AN(an));
    
    initial
    begin
        clk = 0;
        btn0 = 0;
        btn1 = 0;
        #(CLK_PD*50);
        btn0 = 1;
        #(CLK_PD);
        btn0 = 0;
        #(CLK_PD*40);
        btn0 = 1;
        #(CLK_PD);
        btn0 = 0;
        #(CLK_PD*200);
        btn1 = 1;
        #(CLK_PD*650);
        btn1 = 0;
    end
    
    always #(CLK_PD/2) clk = ~clk;
endmodule

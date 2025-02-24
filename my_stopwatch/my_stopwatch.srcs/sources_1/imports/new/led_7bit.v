`timescale 1ns / 1ps

module led(
    input [3:0] DIGIT_10, DIGIT_1,
    input TICK,
    output reg [6:0] AN,
    output reg CA
    );
    
    wire [3:0] DIGIT;
    initial CA = 0;
    always @ (posedge TICK) // 10ms¸¶´Ù Á¡¸ê (ÀÜ»óÇö»ó)
        CA <= ~CA;
    
    assign DIGIT = CA ? DIGIT_10 : DIGIT_1;
    
 always@(DIGIT)
    case(DIGIT)
        4'h0  : AN=7'h7e;
        4'h1  :AN=7'h30;
        4'h2  :AN=7'h6d;
        4'h3  :AN=7'h79;
        4'h4  :AN=7'h33;
        4'h5  :AN=7'h5b;
        4'h6  :AN=7'h5f;
        4'h7  :AN=7'h70;
        4'h8  :AN=7'h7f;
        4'h9  :AN=7'h7b;
        default  AN=7'h00;
endcase                   
endmodule

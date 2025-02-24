`timescale 1ns / 1ps

module my_carryout(input [7:0]a, b, output [7:0]y, output carry );
   
    wire [8:0]sum;
    assign y = a + b;
    assign sum = a + b;
    assign carry = sum[8];
    
endmodule

`timescale 1ns / 1ps

module my_carryout4(input [7:0]a, b, output [7:0]y, output carry );
   
    wire [8:0]sum;
    assign y = sum[7:0];
    assign sum = a + b;
    assign carry = sum[8];
        
endmodule

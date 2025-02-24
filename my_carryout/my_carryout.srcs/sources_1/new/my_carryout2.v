`timescale 1ns / 1ps

module my_carryout2(input [7:0]a, b, output [7:0]y, output carry );
  
    assign y = a + b;
    assign carry = ( (a + b) > 255 ) ? 1 : 0;

endmodule
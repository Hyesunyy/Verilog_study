`timescale 1ns / 1ps

module my_carryout5(input [7:0]a, b, output [7:0]y, output carry );

    assign {carry,y} = a + b;

endmodule

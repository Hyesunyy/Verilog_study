`timescale 1ns / 1ps

module my_carryout3(input [7:0]a, b, output [7:0]y, output reg carry );
   
    assign y = a + b;
    
    always @ (a,b) begin
        if(a + b > 255)
            carry = 1;
        else
            carry = 0;            
    end
    
endmodule

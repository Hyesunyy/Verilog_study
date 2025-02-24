`timescale 1ns / 1ps

module my3bitAdder(
    input [1:0] A,
    input [1:0] B,
    input Ci,
    output [1:0] S,
    output Co
    );
    
    wire ca0;
    
    FA fa0(.a(A[0]), .b(B[0]), .ci(Ci), .s(S[0]), .co(ca0));
    FA fa1(.a(A[1]), .b(B[1]), .ci(ca0), .s(S[1]), .co(Co));
    
endmodule

module FA(
    input a,
    input b,
    input ci,
    output s,
    output co
    );
    
    wire ha0_s, ha0_c, ha1_s, ha1_c;
    
    HA ha0(.a(a), .b(b), .s(ha0_s), .c(ha0_c) );
    HA ha1(.a(ha0_s), .b(ci), .s(ha1_s), .c(ha1_c) );
    
    assign s = ha1_s;
    assign co = ha0_c | ha1_c;
    
endmodule    

module HA(
    input a,
    input b,
    output s,
    output c
    );
    
    assign s = a ^ b;
    assign c = a & b;
    
endmodule 

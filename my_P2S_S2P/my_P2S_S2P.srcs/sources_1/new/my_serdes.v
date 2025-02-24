`timescale 1ns / 1ps

module my_serdes(
    input CLK,
    input RST,
    input SOF_IN,
    input [7:0]PIN,
    output SOF_SOUT,
    output [7:0] DOUT
    );
    
    wire SOUT;
    wire SOF_POUT;

P2S DUT1(.CLK(CLK), .RST(RST), .SOF_IN(SOF_IN), .PIN(PIN), .SOF_POUT(SOF_POUT), .SOUT(SOUT));
S2P DUT2(.CLK(CLK), .RST(RST), .SOF_IN(SOF_POUT), .SIN(SOUT), .SOF_SOUT(SOF_SOUT), .DOUT(DOUT));

endmodule

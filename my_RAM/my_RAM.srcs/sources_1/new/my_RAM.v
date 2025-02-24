`timescale 1ns / 1ps

module my_RAM(
    input CLK,
    input [6:0] ADDR,
    input [7:0] DIN,
    input WEN,
    output reg [7:0] DOUT
    );
    
    reg [7:0]ram[0:127];
    
    //write part
    always @ (posedge CLK) begin
        if(WEN)
        ram[ADDR] <= DIN; 
    end
    
    //read part
    always @ (posedge CLK) begin
        DOUT <= ram[ADDR]; 
    end
    
endmodule

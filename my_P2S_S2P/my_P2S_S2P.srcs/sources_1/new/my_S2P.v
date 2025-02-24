`timescale 1ns / 1ps

module my_S2P(
input RST,
    input CLK,
    output [7:0] SOUT,
    output SOF_SOUT,
    input SIN,
    input SOF_SIN
    );
    
    reg [2:0]bit_cnt;
    reg [7:0]TEMP_SOUT;
    
    assign SOUT = TEMP_SOUT;
    assign SOF_SOUT = (bit_cnt == 3'd7);
    
    always @ (posedge CLK)
    begin
        if(RST)
        begin
            TEMP_SOUT <= 0;
            bit_cnt <= 0;
        end
        else
        begin
            TEMP_SOUT[bit_cnt] <= SIN;
        end            
    end
    
    always @ (posedge CLK)
    if(SOF_SIN || bit_cnt) 
     bit_cnt = bit_cnt + 1;
    
    
    
endmodule

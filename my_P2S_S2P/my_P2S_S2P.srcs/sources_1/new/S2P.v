`timescale 1ns / 1ps

module S2P(
    input CLK,
    input RST,
    input SOF_IN,
    input SIN,
    output reg SOF_SOUT,
    output reg [7:0] DOUT
    );
    
    reg [3:0]SBIT_READY;
    
    always @ (posedge CLK)
        begin
            if(RST)
                begin
                    SOF_SOUT <= 1'b0;
                    DOUT <= 8'b0;
                    SBIT_READY <= 4'b0;
                end
            else
                begin
                    if(SOF_IN)
                        begin
                            SBIT_READY <= 1'b0;
                            SOF_SOUT <= 1'b1;
                        end
                    else
                        if(SBIT_READY < 8)
                            begin
                                DOUT <= {SIN,DOUT[7:1]};
                                SBIT_READY <= SBIT_READY + 1;
                            end
                        else // SBIT_READY = 8�� �Ǿ��� ��
                            begin
                                SOF_SOUT <= 1'b0;
                            end
                end                                                                                                                
        end
endmodule


/*
module S2P(
    input RST, CLK, SOF_IN, SIN,
    output SOF_OUT,
    output [7:0] DOUT
    );
reg [2:0] bit_cnt;
reg [7:0] data;

assign DOUT = data;
assign SOF_OUT = bit_cnt == 3'd7;
 
always @(posedge CLK)
begin
    if(RST)
        data <= 8'd0;
    else
        data[bit_cnt] <= SIN;
end

always @(posedge CLK)
begin
    if(RST)
        bit_cnt <= 3'd0;
    else if(SOF_IN || bit_cnt != 3'd0)
        bit_cnt <= bit_cnt + 1;
end
                                
endmodule
*/

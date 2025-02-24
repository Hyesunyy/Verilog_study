`timescale 1ns / 1ps

module P2S(
    input CLK,
    input RST,
    input SOF_IN,
    input [7:0] PIN,
    output reg SOF_POUT,
    output reg SOUT
    );
    reg [3:0]BIT_READY;
    reg [7:0]TEMP_PIN;
    reg [7:0]TEMP_SIN;
    reg SOUT = 1'b0;
    
    always @ (posedge CLK)
        begin
            if(RST)
                begin
                    BIT_READY <= 4'h0;
                    SOF_POUT <= 1'b0;
                    SOUT <= 1'b0;
                    TEMP_SIN <= 8'h0;
                end                    
            else
                begin
                    if(SOF_IN)
                        begin
                            SOF_POUT <= 1'b1;
                            BIT_READY <= 4'h0;
                            TEMP_PIN <= PIN;
                        end
                    else
                        if(BIT_READY < 8)
                            begin
                                SOF_POUT <= 1'b0;
                                SOUT <= TEMP_PIN[BIT_READY]; // LSB���� ��������
                                BIT_READY <= BIT_READY + 1;  
                            end
                        else // BIT_READY = 8�� �Ǹ�
                            begin
                                SOUT <= 1'b0;
                            end                                                        
                end                               
        end
endmodule


/*
module P2S(
    input RST, CLK, SOF_IN,
    input [7:0] DIN,
    output SOF_OUT, SOUT
    );
reg [7:0] din_d;
reg sof_d;

assign SOUT = din_d[0];
assign SOF_OUT = sof_d;

always @(posedge CLK)
begin
    if(RST)
        din_d <= 8'd0;
    else if(SOF_IN)
        din_d <= DIN;
    else
        din_d <= din_d >> 1;
//      din_d <= {1'b0, din[7:1];                
end

always @(posedge CLK)
    sof_d <= SOF_IN;
                   
endmodule       //P2S
*/

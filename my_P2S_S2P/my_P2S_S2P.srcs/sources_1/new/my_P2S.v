`timescale 1ns / 1ps

module my_P2S(
    input CLK,
    input RST,
    input [7:0] PIN,
    input SOF_PIN,
    output SOF_POUT,
    output POUT
    );
    
    reg [7:0]TEMP_PIN;
    reg TEMP_SOF_POUT;
    
    assign SOF_POUT = TEMP_SOF_POUT;
    assign POUT = TEMP_PIN[0];
    
    always @ (posedge CLK)
    begin
        if(RST)
        begin
            TEMP_PIN <= 0;
        end
        else
        begin
            if(SOF_PIN)
            begin
                TEMP_PIN <= PIN;
            end
            else
            begin
                TEMP_PIN <= (TEMP_PIN >> 1);
            end
        end            
    end
    
    always @ (posedge CLK)
    begin
        TEMP_SOF_POUT <= SOF_PIN;
    end
    
endmodule

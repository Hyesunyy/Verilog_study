`timescale 1ns / 1ps

module my_Cnt2Segment(
    input RST,
    input CLK,
    output reg [6:0] AN,
    output CA
    );
    parameter CLK_FREQ = 125_000_000;
    reg [30:0]count;
    reg [3:0] NUM;
    
    assign CA = 0;
    

    always @ (posedge CLK)
    begin
        if(RST)
        begin
            count <= 0;
            NUM <= 0;
        end            
        else
        begin
            if(count == CLK_FREQ/2)
            begin
                NUM <= NUM + 1;
                count <= 0;
            end
            else
                count <= count + 1;
        end
        if(NUM == 10)
            NUM <= 0;                        
    end
    
    always @ (*)
        case(NUM)
            4'h0: AN <= 7'h7E;
            4'h1: AN <= 7'h30;
            4'h2: AN <= 7'h6D;
            4'h3: AN <= 7'h79;
            4'h4: AN <= 7'h33;
            4'h5: AN <= 7'h5B;
            4'h6: AN <= 7'h5F;
            4'h7: AN <= 7'h72;
            4'h8: AN <= 7'h7F;
            4'h9: AN <= 7'h7B;
            default: AN <= 7'h00;
        endcase    
endmodule

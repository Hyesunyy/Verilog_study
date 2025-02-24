`timescale 1ns / 1ps

module my_Segment(input [3:0] DIGIT, output reg [6:0]AN, output CA);
    
    always @ (*)
    begin
        case(DIGIT)
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
            default: AN <= 7'h7E;
        endcase
    end

endmodule

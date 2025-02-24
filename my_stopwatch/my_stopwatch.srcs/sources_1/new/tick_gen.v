`timescale 1ns / 1ps

module tick_gen(
    input CLK,
    output reg TICK
    );
    parameter CLK_FREQ = 125_000_000;
    parameter TICK_MAX = CLK_FREQ / 100;
    reg [20:0]cnt = 0;
    
    
    always @ (posedge CLK) // 10ms¸¶´Ù TICK
    begin
        if( cnt == (TICK_MAX - 1))
        begin
            cnt <= 0;
            TICK <= 1;
        end
        else
        begin
            cnt <= cnt + 1;
            TICK <= 0;
        end
    end
    
endmodule

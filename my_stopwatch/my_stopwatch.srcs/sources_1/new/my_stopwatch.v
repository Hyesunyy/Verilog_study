`timescale 1ns / 1ps

module my_stopwatch#(parameter CLK_FREQ = 125_000_000)(
    input CLK,
    input BTN0,
    input BTN1,
    input TICK,
    output [3:0] DIGIT_10,
    output [3:0] DIGIT_1
    );
    
    wire CLEAR;
    assign CLEAR = (cnt_clear == 299) ? 1'b1 : 1'b0;
    
    reg enable = 0;
    reg [5:0]cnt = 0;
    reg [8:0]cnt_clear = 0;
    reg [6:0]tick_cnt = 0;
    reg tick_sec = 0;
    
    assign DIGIT_10 = cnt / 10;
    assign DIGIT_1 = cnt % 10;
    
    always @ (posedge CLK) // start&stop
        if(BTN0)
            enable <= ~enable;

    always @ (posedge CLK)
    begin
        if(enable && TICK) // tick_sec 1초마다 1되고 바로 0
        begin
            if(tick_cnt == 49)
            begin
                tick_cnt <= 0;
                tick_sec <= 1;
            end
            else
            begin
                tick_cnt <= tick_cnt + 1;
            end
        end
        else
            tick_sec <= 0;            
    end

    
    always @ (posedge CLK)
        if(BTN1 && TICK)
            cnt_clear <= cnt_clear + 1;
        else if(!BTN1)
            cnt_clear <= 0;                      
    
    always @ (posedge CLK)
    begin
        if(CLEAR)
            cnt <= 0;
        else if(tick_sec)
            if(cnt == 59)
                cnt <= 0;
        else
            cnt <= cnt + 1;                      
    end
endmodule

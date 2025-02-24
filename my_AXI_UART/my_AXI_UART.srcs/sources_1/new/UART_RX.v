`timescale 1ns / 1ps

module UART_RX(
    input RST,
    input CLK,
    input RXD,
    output reg RX_RDY,
    output reg [7:0] RX_DATA,
    output reg [6:0] AN,
    output CA
    );
    parameter CLK_FREQ = 125_000_000;
    parameter BAUD_RATE = 115200;
    parameter CLK_MAX = (CLK_FREQ / (BAUD_RATE * 16));
    
    localparam [1:0]                        IDLE = 2'b00,
                                            START = 2'b01,
                                            RX = 2'b11,
                                            STOP = 2'b10;
    wire [3:0] digit;
    wire [3:0] digit1;
    wire [3:0] digit10;  
    reg enable = 0;
    reg [20:0]cnt_enable = 20'd0;
    reg [1:0]curr_state;
    reg [1:0] next_state;
    reg BAUD_X16_EN = 0;
    reg [15:0]TICK = 15'd0;
    reg [3:0]cnt_baud = 4'd0;
    reg over_sample_cnt_done = 0;
    reg [3:0]bit_cnt;
    reg [9:0]TEMP = 10'd11_1111_1111;
    wire bit_cnt_done;
    wire stop_pass;
    
    assign CA = enable;
    assign bit_cnt_done = (bit_cnt == 9) ? 1 : 0;
    assign stop_pass = (bit_cnt == 10) ? 1 : 0;
    assign digit = (enable) ? digit10 : digit1;
    assign digit1 = RX_DATA[3:0];
    assign digit10 = RX_DATA[7:4];
    
    always @ (posedge CLK) // enable block
    if(cnt_enable == (CLK_FREQ/100)-1) begin
        enable <= ~enable;
        cnt_enable <= 0;
    end        
    else
        cnt_enable <= cnt_enable + 1;
        
    always @ (posedge CLK) // RST block
    if(RST)
        curr_state <= IDLE;
    else
        curr_state <= next_state;
        
    always @ (posedge CLK) begin
        if(RST)
            TICK <= 0;
        else            
        if(curr_state != IDLE)
        if(TICK == (CLK_MAX-1)) begin
            BAUD_X16_EN <= 1;
            TICK <= 0;
        end        
        else begin
            BAUD_X16_EN <= 0;
            TICK <= TICK + 1;
        end
    end        
    
    
    always @ (posedge CLK) // over_sample_cnt_done block
    begin
        if(curr_state != IDLE)begin           
            if(BAUD_X16_EN) begin
            cnt_baud <= cnt_baud + 1;
            if(cnt_baud == 7)
                over_sample_cnt_done <= 1;
            else
                over_sample_cnt_done <= 0;
            end
        end
        else // if(curr_state == IDLE)
            cnt_baud <= 0;
    end
    
    always @ (posedge CLK) begin
        if(curr_state == IDLE)
            bit_cnt <= 0;
        else if(over_sample_cnt_done && BAUD_X16_EN) begin 
            bit_cnt <= bit_cnt + 1;
            TEMP[bit_cnt] <= RXD;                                
        end                                    
    end
    
    always @ (posedge CLK)
    if(curr_state == STOP && over_sample_cnt_done && BAUD_X16_EN) begin
        RX_DATA <= TEMP[8:1];
        RX_RDY <= 1;
    end
    else RX_RDY <= 0;        
    
                                                             
    
    always @ (curr_state, RXD, over_sample_cnt_done, stop_pass, bit_cnt_done) begin
        case (curr_state)
            IDLE:
                if(!RXD)
                    next_state <= START;
                else
                    next_state <= IDLE;
            START:
                if(over_sample_cnt_done)
                    next_state <= RX;
                else
                    next_state <= START;
            RX:
                if(bit_cnt_done)
                    next_state <= STOP;
                else
                    next_state <= RX;
            STOP:
                if(stop_pass)
                    next_state <= IDLE;
                else
                    next_state <= STOP;                                                                                                                      
        endcase
    end
    
    
    
    always @ (*)
    begin
        case(digit)
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
            4'h10: AN <= 7'h7D;
            4'h11: AN <= 7'h1F;
            4'h12: AN <= 7'h4E;
            4'h13: AN <= 7'h3D;
            4'h14: AN <= 7'h6F;
            4'h15: AN <= 7'h47; 
        endcase
    end
    
endmodule

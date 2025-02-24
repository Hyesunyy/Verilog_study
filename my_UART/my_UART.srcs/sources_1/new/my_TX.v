`timescale 1ns / 1ps

module my_TX(
    input CLK,
    input RST,
    input [3:0] SW,
    input BTN,
    output reg Dout,
    output reg Busy
    );
    parameter CLK_FREQ = 125_000_000;
    parameter BAUD_RATE = 115200;
    parameter CLK_MAX = CLK_FREQ / BAUD_RATE;
    
    localparam [1:0]    IDLE = 2'b00,
                                     START = 2'b01,
                                     TX = 2'b10,
                                     STOP = 2'b11;
    
    reg BIT_CLK;
    reg [15:0]bit_cnt;
    reg [3:0]pass_cnt;
    reg bit_pass;
    reg BTN_1, BTN_2;
    reg startbit = 0;
    wire parity;
    wire [7:0]DIN;
    reg [9:0]DATA;
    reg [1:0]curr_state, next_state;
    
    assign SEND = BTN_1 & ~BTN_2;
    assign DIN = {0100,SW}; 
    assign parity = ^DIN;
    // assign DATA = {stopbit, parity, DIN};
    
    always @ (posedge CLK) // 1 CLK만 HIGH가 되는 RISING 신호를 만들기 위한 여정
    begin
        BTN_1 <= BTN;
        BTN_2 <= BTN_1;
    end
    
    always @ (posedge CLK) // BIT_CLK 1 딱 한 CLK만  튕겨주면서~
    begin
        if(curr_state == IDLE)
        begin
            bit_cnt <= 0;
            BIT_CLK <= 0;
        end
        else // curr_state가 IDLE 이 아닐 때 
        begin            
            if(bit_cnt == (CLK_MAX - 1))
            begin
                BIT_CLK <= 1;
                bit_cnt <= 0;
            end
            else
            begin
                bit_cnt <= bit_cnt + 1;
                BIT_CLK <= 0;                
            end                
        end      
    end
    
    always @ (posedge BIT_CLK)
    begin
        Dout <= DATA[0];
        if(curr_state == START)
            DATA <= {parity, DIN,startbit};
        else if(curr_state == TX)
        begin
            if(pass_cnt == 12)
                bit_pass <= 1;
            else
            begin                
                DATA <= {1'b1, DATA[9:1]};
                pass_cnt <= pass_cnt + 1;
            end
        end
        else
        begin            
            bit_pass <= 0;
            pass_cnt <= 0;
        end                    
    end    
    
    always @ (posedge CLK)
    begin
        if(RST)
            curr_state <= IDLE;
        else
            curr_state <= next_state;            
    end
    
    always @ (curr_state, SEND, BIT_CLK, bit_pass, Busy)
    begin
        Busy <= 0;
        case(curr_state)
            IDLE:
                if(SEND)
                    next_state <= START;
                else
                    next_state <= IDLE;                    

            START:
            begin         
                if(BIT_CLK)
                    next_state <= TX;
                else
                    next_state <= START;
            end                                        

            TX:
            begin
                Busy <= 1;                
                if(bit_pass)
                    next_state <= STOP;
                else
                    next_state <= TX;
            end                    
                    
            STOP:
                if(BIT_CLK)
                    next_state <= IDLE;
                else
                    next_state <= STOP;                                      
        endcase            
    end
endmodule

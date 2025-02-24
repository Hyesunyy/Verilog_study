`timescale 1ns / 1ps

module my_FSM(
    input [1:0] Din,
    input RST,
    input CLK,
    output [1:0] DOUT,
    output [6:0] AN,
    output CA
    );
    
    localparam     IDLE = 2'b00, STATE_A = 2'b01, STATE_B = 2'b11, STATE_C = 2'b10;
    
    
    my_Segment dut(.DIGIT(digit), .AN(AN), .CA(CA));
    reg [1:0]curr_state;
    reg [1:0]next_state;
    wire [3:0]digit;
    reg [1:0]state;
    reg enable;
    reg [27:0]cnt;
    
    assign CA = enable;
    assign digit[3:1] = 3'b000;
    assign digit[0] = enable ? state[1] : state[0];
    
    always @ (posedge CLK) begin
        if(cnt == 1_250_000) begin
            cnt <= 0;
            enable <= ~enable;
        end
        else 
            cnt <= cnt + 1;            
    end
    
    always @ (posedge CLK)
    begin
        if(RST)
            curr_state <= IDLE;
        else
            curr_state <= next_state;            
    end
    
    always @ (Din, curr_state)
    begin
        case (Din)
            IDLE:
                begin
                    state = 2'b00;
                    if(Din == 2'b01)
                        next_state <= STATE_A;
                    else if(Din == 2'b10)
                        next_state <= STATE_C;
                    else
                        next_state <= IDLE;
                end                                                        
            
            STATE_A:
                begin
                    state = 2'b01;
                    if(Din == 2'b11)
                        next_state <= STATE_B;
                    else if(Din == 2'b00)
                        next_state <= IDLE;
                    else
                        next_state <= STATE_A;
                end                                
            
            STATE_B:
                begin
                    state = 2'b11;
                    if(Din == 2'b10)
                        next_state <= STATE_C;
                    else if(Din == 2'b01)
                        next_state <= STATE_A;
                    else
                        next_state <= STATE_B;
                end                                      
           
            STATE_C:
                begin
                    state = 2'b10;
                    if(Din == 2'b00)
                        next_state <= IDLE;
                    else if(Din == 2'b11)
                        next_state <= STATE_B;
                    else
                        next_state <= STATE_C;                  
                end            
        endcase
    end
endmodule

`timescale 1ns / 1ps

module stopwatch_another_version(
    input CLEAR,
    input BTN,
    input CLK,
    output [6:0] AN,
    output CA
    );
    
    parameter CLK_FREQ = 125_000_000;
    
    localparam [1:0]    STANDBY = 2'b00,
                                    START = 2'b01,
                                    STOP =2'b10,
                                    SAVE = 2'b11;
      
    
    reg [3:0]digit;
    
    reg [1:0]curr_state, next_state;
    reg enable;
    reg [25:0]cnt_enable, cnt;
    reg [30:0]cnt_clear;
    reg [5:0]sec;
    reg BTN_1, BTN_2, CLEAR_1, CLEAR_2;
    reg [5:0] save_time[3:0];
    reg [2:0] save_point;
    
    assign clear_done = (cnt_clear == (CLK_FREQ*2)) ? 1'b1 : 1'b0;
    assign CLEAR_FALLING = ~CLEAR_1 & CLEAR_2;
    assign BTN_FALLING = ~BTN_1 & BTN_2;
    assign CA = enable;
    my_Segment dut(.DIGIT(digit), .AN(AN), .CA(CA) );
    
    always @ (posedge CLK) // FALLING EDGE�� ����� ���� �賭�� ����
    begin
        CLEAR_1 <= CLEAR;
        CLEAR_2 <= CLEAR_1;
    end
    
    always @ (posedge CLK)// FALLING EDGE�� ����� ���� �賭�� ����
    begin
        BTN_1 <= BTN;
        BTN_2 <= BTN_1;
    end
    
    always @ (posedge CLK) // enable block
    begin
        if(cnt_enable == CLK_FREQ/100)
        begin
            enable <= ~enable;
            cnt_enable <= 0;
        end
        else
            cnt_enable <= cnt_enable + 1;
    end
    
    always @ (posedge CLK)
    begin
        if(curr_state == START)
        begin            
            if(CLEAR_FALLING == 1)
            begin
                save_time[3] <= sec;
                save_time[2] <= save_time[3];
                save_time[1] <= save_time[2];
                save_time[0] <= save_time[1];
            end
        end
        else if(curr_state == STANDBY)
        begin
            save_time[0] <= 0;
            save_time[1] <= 0;
            save_time[2] <= 0;
            save_time[3] <= 0;
        end                
    end
    
    always @ (posedge CLK) // �ð� ���� block
    begin
        if(curr_state == START)
            begin
            cnt <= cnt + 1;
            if(cnt == CLK_FREQ/5)
            begin
                sec <= sec + 1;
                cnt <= 0;
            end
            if(sec == 60)
                sec <= 0;
        end            
            
        if(curr_state == SAVE)
        begin
            if(CLEAR_FALLING == 1)
            begin
                save_point <= save_point + 1;
            end
        end
                    
        else if(curr_state != SAVE)
            save_point <= 0;                                                                   
                
        if(curr_state == STANDBY)
        begin            
            sec <= 0;
        end                            
    end
    
    always @ (posedge CLK) // clear_done = 1 �� ����� ���� �賭�� ����
    begin
            if(curr_state != START)
                begin
                if(CLEAR)
                    cnt_clear <= cnt_clear + 1;
                else
                    cnt_clear <= 0;
            end                            
    end
    
    always @ (posedge CLK) // RST block
    begin
        if(clear_done)
            curr_state <= STANDBY;
        else
            curr_state <= next_state;            
    end
    
    always @ (curr_state, BTN_FALLING, CLEAR_FALLING) //main always : state ����
    begin
        digit = enable ? (sec / 10) : (sec % 10);
        case(curr_state)
            STANDBY:
                    if(BTN_FALLING == 1)
                        next_state <= START;
                    else
                        next_state <= STANDBY;
                        
            START:
                    if(BTN_FALLING == 1)
                        next_state <= STOP;
                    else
                        next_state <= START;
                        
            STOP:
                    if(BTN_FALLING == 1)
                        next_state <= START;
                    else if(CLEAR_FALLING == 1)
                        next_state <= SAVE;
                    else
                        next_state <= STOP;

            SAVE:
                    begin
                        if(save_point == 0)
                        begin
                            next_state <= SAVE;
                            digit = enable ? (save_time[0] / 10) : (save_time[0] % 10);                        
                        end                        
                        else if(save_point == 1)
                        begin
                            next_state <= SAVE;
                            digit = enable ? (save_time[1] / 10) : (save_time[1] % 10);                        
                        end
                        else if(save_point == 2)
                        begin
                            next_state <= SAVE;
                            digit = enable ? (save_time[2] / 10) : (save_time[2] % 10);                        
                        end
                        else if(save_point == 3)
                        begin
                            next_state <= SAVE;
                            digit = enable ? (save_time[3] / 10) : (save_time[3] % 10);                        
                        end                                            
                        else
                            next_state <= STOP;
                    end                                                                                                     
        endcase
    end    
endmodule

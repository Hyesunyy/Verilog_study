`timescale 1ns / 1ps

module my_TrafficLight(
    input CLK,
    input MAINT_RST,
    input PED_CROSSING,
    //output WALK,
    //output DONTWALK,
    output reg RED_LED,
    output reg YELLOW_LED,
    output reg GREEN_LED,
    output [6:0]AN,
    output CA
    );
    
    parameter CLK_FREQ = 125_000_000;
    
    localparam [1:0]        YELLOW_LIGHT = 2'b00,
                                         RED_LIGHT = 2'b01,
                                         PED_CROSS = 2'b11,
                                         GREEN_LIGHT = 2'b10;
                                         
    reg [1:0]curr_state, next_state;
    reg [1:0]state;
    reg [30:0]cnt_enable;
    reg [30:0]cnt_R;
    reg [30:0]cnt_G;
    reg [30:0]cnt_Y;
    reg [30:0]cnt_PED1;
    reg [30:0]cnt_PED2;
    wire [3:0]digit;
    reg enable;
    
    assign count_done = ((cnt_R == (CLK_FREQ*6))||(cnt_G == (CLK_FREQ*6)) || (cnt_PED1 == CLK_FREQ) || (cnt_PED2 == (CLK_FREQ*2)) || (cnt_Y == CLK_FREQ)) ? 1'b1 : 1'b0;
    assign digit[3:1] = 3'b000;
    assign CA = enable;
    assign digit[0] = enable ? state[1] : state[0];
    
    my_Segment uut( .DIGIT(digit), .AN(AN), .CA(CA));
    
    initial enable <= 0;
    always @ (posedge CLK) // enable
    begin
        cnt_enable <= cnt_enable + 1;
        if(cnt_enable == (CLK_FREQ/100))
            begin
                enable <= ~enable;
                cnt_enable <= 0;
            end
    end
    
    always @ (posedge CLK) // MAINT_RST�� ���۵� ��
    begin
        if(MAINT_RST)
            curr_state <= YELLOW_LIGHT;
        else
            curr_state <= next_state;
    end
   
    always @ (posedge CLK) // RED
    begin
        if(state == RED_LIGHT)
        begin
            cnt_R <= cnt_R + 1;                                                        
        end
        else
            cnt_R <= 0;                                                                                          
    end
    
    always @ (posedge CLK) // GREEN
    begin
        if(GREEN_LED)
        begin
            cnt_G <= cnt_G + 1;
        end
        else
            cnt_G <= 0;                                                                 
    end
        
    always @ (posedge CLK) // PED_CROSS ����ϴ� cnt 
    begin
        if(curr_state == PED_CROSS)
        begin
            if(cnt_R >= (CLK_FREQ))
                cnt_PED1 <= cnt_PED1 + 1;                 
            else// if(cnt_R < CLK_FREQ*2)
                    cnt_PED2 <= cnt_PED2 + 1;                                            
        end
        else
            begin
                cnt_PED1 <= 0;
                cnt_PED2 <= 0;
            end                              
    end
    
    always @ (posedge CLK) // YELLOW
    begin
        if(curr_state ==YELLOW_LIGHT)
            cnt_Y <= cnt_Y + 1;
        else
            cnt_Y <= 0;                                                                                       
    end        


                                                     
    always @ (curr_state, count_done, PED_CROSSING, MAINT_RST)
    begin
        RED_LED <= 0;
        GREEN_LED <= 0;
        YELLOW_LED <= 0;
        
        case(curr_state)
            YELLOW_LIGHT:
                begin
                    state <= YELLOW_LIGHT;
                    YELLOW_LED <= 1;
                    if(count_done == 1)
                        next_state <= RED_LIGHT;
                    else
                        next_state <= YELLOW_LIGHT;                                                                                                                                                                                                                                                                                                    
                end
            
            RED_LIGHT:
                begin
                    if(PED_CROSSING == 0)
                        begin
                        state <= RED_LIGHT;
                        RED_LED <= 1;
                        if(count_done == 1)
                            next_state <= GREEN_LIGHT;
                        else
                            next_state <= RED_LIGHT;
                    end                        
                    else
                        next_state <= PED_CROSS;                                                                                                       
                end                                                                             
                
            PED_CROSS:
                begin
                    state <= 2'b11;
                    RED_LED <= 1;
                    if(count_done == 1)
                        next_state <= GREEN_LIGHT;
                    else
                        next_state <= PED_CROSS;                        
                end
                
            GREEN_LIGHT:
                begin
                    state <= GREEN_LIGHT;
                    GREEN_LED <= 1;
                    if(count_done == 1)
                        next_state <= YELLOW_LIGHT;
                    else
                        next_state <= GREEN_LIGHT;                        
                end
        endcase
    end
    
endmodule

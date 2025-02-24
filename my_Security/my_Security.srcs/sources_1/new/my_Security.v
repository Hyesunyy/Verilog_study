`timescale 1ns / 1ps

module my_Security(
    input RST,
    input CLK,
    input [1:0] KEY,
    input [1:0] SENSOR,
    
    output reg ALARM,
    output [6:0] AN,
    output CA
    );

    parameter CLK_FREQ = 125_000_000;

        localparam [1:0]    disarmed = 2'b00,
                            armed = 2'b01,
                            wait_delay = 2'b11,
                            alarm = 2'b10;

                                   
    
    (* MARK_DEBUG="true" *)
    reg [1:0] curr_state;
    reg [1:0] next_state;
    (* MARK_DEBUG="true" *)
    reg alarm_siren, start_count, count_done;
    reg [30:0]cnt;
    reg [30:0]cnt2;
    reg [2:0]sec;
    reg enable;
    wire [3:0] digit;
    reg [1:0] state;
    
    assign digit[3:1] = 3'd0;
    assign digit[0] = enable ? state[1] : state[0];
    assign CA = enable;
    
    my_FSM dut(.DIGIT(digit), .AN(AN), .CA(CA)
    );
    
    
    always @ (posedge CLK)
    begin
        if(RST)
            curr_state <= disarmed;
        else
            curr_state <=next_state;                
    end
    
    always @ (curr_state, KEY, state)
    begin
        case (curr_state)
            disarmed:
            begin
                state <= 2'b00;
                if(KEY == 2'b11)
                    begin
                        next_state <= armed;
                        alarm_siren <= 0;
                        start_count <= 0;                        
                    end                        
                else
                    begin
                        next_state <=disarmed;
                        alarm_siren <= 0;
                        start_count <= 0;                        
                    end                    
            end
            armed:
            begin
                state <= 2'b01;
                if(KEY == 2'b00 && SENSOR == 2'd0)
                begin
                    next_state <= disarmed;
                end                                         
                else if((KEY == 2'b11) && (SENSOR == 2'd0))
                begin
                    next_state <= armed;
                end                   
                else
                    next_state <= wait_delay;
                    alarm_siren <= 0;
                    start_count <= 1;                                                                         
            end
            
            wait_delay: // start_count == 1
            begin
                    state <= 2'b11;        
                    if(count_done == 1)
                    begin
                         next_state <= alarm;
                         start_count <= 0;
                         alarm_siren <= 1;
                    end
                    else if(KEY ==2'b00 && count_done == 0)
                    begin
                        next_state <= disarmed;
                        start_count <= 0;
                    end
                    else
                        next_state <= wait_delay;                                                                                                     
            end
            
            alarm:
            begin
                state <= 2'b10;

                if(KEY == 2'b00)
                begin
                    next_state <= disarmed;
                    alarm_siren <= 0;
                end
                else
                begin
                    next_state <= alarm;
                end
            end 
        endcase            
    end
    
        
    always @ (posedge CLK)
    if(state == 2'b10)
    ALARM <= 1;
    else
    ALARM <= 0;
    
    always @ (posedge CLK)
    begin
            cnt2 <= cnt2 + 1;
            if(cnt2 == ((CLK_FREQ/100) -1))
            begin
                enable <= ~enable;
                cnt2 <= 0;
            end
     end
    
always @ (posedge CLK)
begin
	if(state == 2'b11)
		begin
			cnt <= cnt + 1;
			if(cnt == (CLK_FREQ -1))
				begin
					sec <= sec + 1;
					cnt <= 0;
					if(sec >= 5)
					count_done <= 1;
					else
					count_done <= 0;
		        end
		end
		else
		begin
		  cnt <= 0;
		  sec <= 0;
		  count_done <= 0;
		end
end                 

    
endmodule


/*
module pr1029_test2#(parameter CLK_FREQ = 125_000_000)(
    input KEY,
    input FRONT_DOOR,
    input REAR_DOOR,
    input WINDOW,
    input RST,
    input CLK,
    (* MARK_DEBUG="true" *)
    output  reg ALARM,
    output [6:0] AN,
    output CA
    );
    
    localparam [1:0]            disarmed = 2'b00,
                                             armed = 2'b01,
                                             wait_delay = 2'b11,
                                             alarm = 2'b10;
                                             
    
    my_FSM dut( .DIGIT(DIGIT), .AN(AN), .CA(CA)
    );
    (* MARK_DEBUG="true" *)
    wire [2:0]SENSOR;
    assign SENSOR = {FRONT_DOOR, REAR_DOOR, WINDOW};
    (* MARK_DEBUG="true" *)
    reg [1:0]curr_state;
    reg [1:0]next_state;
    wire [3:0]DIGIT;
    assign DIGIT[3:1] = 3'b000;
    reg enable;
    reg [1:0]state;
    assign CA = enable;
    assign DIGIT[0] = enable ? state[1] : state[0];
    reg [24:0] cnt_enable;
    (* MARK_DEBUG="true" *)
    reg [30:0] cnt_wait;
    (* MARK_DEBUG="true" *)
    reg  start_count;
    (* MARK_DEBUG="true" *)
    wire count_done;
    assign count_done = (cnt_wait == (CLK_FREQ*2)) ? 1'b1 : 1'b0;
 
    
    always @ (posedge CLK) // enable ��ȣ �Դٸ� ���ٸ�
    begin
        cnt_enable <= cnt_enable + 1;
        if(cnt_enable == (CLK_FREQ/100))
        begin
            enable <= ~enable;
            cnt_enable <= 0;
        end        
    end
    
    always @ (posedge CLK) // curr_state�� next_state �ʱⰪ
    begin
        if(RST)
        begin
            curr_state <= disarmed;
            //start_count <= 0;
        end
        else
        begin
            curr_state <= next_state;
        end                             
    end
    
    always @ (curr_state, KEY, SENSOR, count_done)
    begin
        ALARM <= 0;
        start_count <= 0;
        case (curr_state)
            disarmed:
            begin
                state <= 2'b00;                       
                if(KEY == 1)
                    next_state <= armed;
                else
                    next_state <= disarmed;                                
            end
                
            armed:
                begin
                    state <= 2'b01;
                    if(SENSOR != 3'd0)
                    begin
                        next_state <= wait_delay;
                    end                        
                    else if((KEY == 0) && (SENSOR == 3'd0))
                        next_state <= disarmed;
                    else
                        next_state <= armed;                                                
                end
                
            wait_delay:
                begin
                    state <= 2'b11;
                    start_count <= 1;
                    if(count_done == 1)
                    begin
                        next_state <= alarm;
                        start_count <= 0;
                    end                               
                    else if((KEY == 0) && (count_done == 0))
                        next_state <= disarmed;
                    else
                        next_state <= wait_delay;                                               
                end
                
            alarm:
                begin 
                    state <= 2'b10;
                    ALARM <= 1'b1;
                    if(KEY == 0)
                        next_state <= disarmed;
                    else 
                        begin
                        next_state <= alarm;
                        ALARM <= 1'b1;
                        end               
                end       
         endcase                
    end
        
    always @ (posedge CLK)
    begin
        if(start_count == 1)
                cnt_wait <= cnt_wait + 1;                                
        else
            cnt_wait <= 0;                                  
    end
    
endmodule
*/

`timescale 1ns / 1ps

module UART_TX(
    input RST,
    input CLK,
    (* MARK_DEBUG="true" *)
    input START, //0108
    (* MARK_DEBUG="true" *)
    input [7:0]TX_DATA, //0108
    (* MARK_DEBUG="true" *)
    output TXD,
    (* MARK_DEBUG="true" *)
    output BUSY
    );
//------------ parameter -----    
parameter CLK_FREQ = 125_000_000;
parameter BAUD_RATE = 115_200;
localparam [1:0] sidle = 2'b00,
                sstart = 2'b01,
                sdata_send = 2'b10,
                sstop = 2'b11;
//-------------- signal declaration ---
(* MARK_DEBUG="true" *)
reg [1:0] curr_state;
reg [1:0] next_state;
wire    bit_clk;
reg     btn_d, btn_2d = 1'b0;
wire    send;
reg [3:0] bit_cnt;
wire      bit_cnt_done;
(* MARK_DEBUG="true" *)
reg  [7:0] reg_tx_data;
wire  [10:0] tx_data = {1'b1, reg_tx_data, 1'b0, 1'b1};

assign TXD = tx_data[bit_cnt];
assign BUSY = (~(curr_state == sidle) || RST);

// ---- send sigal gen
always @(posedge CLK)
begin
    btn_d <= START; //0108
    btn_2d <= btn_d;
end    
assign send = btn_d & ~btn_2d;

//----- fsm
always @(posedge CLK)
begin
    if (RST)
        curr_state <= sidle;
    else
        curr_state <= next_state;
end // always

always @(curr_state, send, bit_cnt_done, bit_clk)
begin
    case(curr_state)
        sidle : 
            if( send) 
                next_state = sstart;
            else
                next_state = sidle;
        sstart :
            if(bit_clk)
                next_state = sdata_send;
            else
                next_state = sstart;                
        sdata_send : 
            if(bit_cnt_done)
                next_state = sstop;
            else
                next_state = sdata_send;
        sstop : 
            if(bit_clk)
                next_state = sidle;
            else
                next_state = sstop;                
        default : next_state = sidle;
    endcase
end // fsm always   

// bit count gen
always @(posedge CLK)
begin
    if(curr_state == sidle)
        bit_cnt <= 11'd0;
    else if(bit_clk)
        bit_cnt <= bit_cnt + 1;
end
assign bit_cnt_done = bit_cnt == 10;

// bit clk gen instantiation 
bit_clk_gen #(.CLK_FREQ(CLK_FREQ),.BAUD_RATE(BAUD_RATE))
   bit_clk_gen_0 (
    .CLK    (CLK),
    .BIT_CLK    (bit_clk)
    );
always @(posedge CLK)
    if(send)
        reg_tx_data <= TX_DATA; //0108
                                                                                   
endmodule

`timescale 1ns / 1ps

module my_FIFO(input RST, input CLK, input [7:0]DIN, input WEN, input REN, output reg [7:0] DOUT, output FULL, output EMPTY);

reg [7:0]ram[0:127];
reg [7:0]wr_addr;
reg [7:0]rd_addr;

assign EMPTY = ( (wr_addr == rd_addr) );
assign FULL = ( (wr_addr[7] ^ rd_addr[7]) && (wr_addr[6:0] == rd_addr[6:0]) );

always @ (posedge CLK) begin
    if(RST) begin
        wr_addr <= 0;
        rd_addr <= 0;
    end
    else begin
        if(WEN && ~FULL) begin
            wr_addr <= wr_addr + 1;
            ram[wr_addr] <= DIN;
        end
        if(REN && ~EMPTY) begin
            rd_addr <= rd_addr + 1;
            DOUT <= ram[rd_addr];
        end
    end                   
end

endmodule

/*module my_FIFO(
    input RSTB, CLK, WR_EN, RD_EN,
    input [3:0] DIN,
    output [3:0] DOUT,
    output EMPTY, FULL
	);

reg [3:0] ram [3:0];
reg [2:0] wr_addr, rd_addr;

wire addr_pos, addr_equ;

always @(posedge CLK) begin
    if ( !RSTB )             	wr_addr <= 3'd0;
    else if (WR_EN && !FULL)	wr_addr <= wr_addr + 1;
end

always @ (posedge CLK) begin
    if (WR_EN)
    ram [ wr_addr[1:0] ] <= DIN;
end

always @ (posedge CLK) begin
    if ( !RSTB )    			 rd_addr <= 3'd0;
    else if (RD_EN && !EMPTY)    rd_addr <= rd_addr + 1;
end

assign DOUT = ram [ rd_addr[1:0] ];
assign addr_equ = ( wr_addr[1:0] == rd_addr[1:0] );
assign addr_pos = wr_addr[2]^rd_addr[2];
assign FULL = addr_equ & addr_pos;
assign EMPTY = addr_equ & ~addr_pos;

endmodule
*/

/*
`timescale 1ns / 1ps

module pr1225_fifo(
    input RST,
    input CLK,
    input [3:0] DIN,     
    input WR_EN,
    output FULL,
    output [3:0] DOUT,    
    input RD_EN,
    output EMPTY
    );
    
reg [3:0] ram [0:1];   
reg [1:0] wr_addr, rd_addr;  


always @(posedge CLK)
begin
    if (RST)
        wr_addr <= 2'd0;
    else if(WR_EN)
        wr_addr <= wr_addr + 1;  
end

always @(posedge CLK)
    if(WR_EN)
        ram[wr_addr[0]] <= DIN;
        
always @(posedge CLK)
begin
    if (RST)
        rd_addr <= 2'd0;
    else if(RD_EN)
        rd_addr <= rd_addr + 1;
end

assign DOUT = ram[rd_addr[0]]; 

wire addr_eq = (wr_addr[0] == rd_addr[0]);
assign addr_pos = rd_addr[1] ^ wr_addr[1];
assign FULL = addr_eq & addr_pos;
assign EMPTY = addr_eq & (~addr_pos);

endmodule
*/

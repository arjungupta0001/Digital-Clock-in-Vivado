//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2022 12:11:50
// Design Name: 
// Module Name: digital_clock
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module digital_clock(
    input clk_1H,
    input reset,
    input incr_pb, 
    input decr_pb,
    input min_set_switch,
    output [5:0] sec_binary,
    output [5:0] min_binary
);
reg [5:0] sec_count_reg = 0; 
reg [5:0] sec_count_next;    
reg [5:0] min_count_reg = 0; 
reg [5:0] min_count_next = 0; 
always@(posedge clk_1H or posedge reset) begin
    if(reset)
        sec_count_reg <= 0;
    else
        sec_count_reg <= sec_count_next;
end  
always@(*) begin
    if(sec_count_reg == 59)
        sec_count_next = 0;
    else
        sec_count_next = sec_count_reg + 1;
end
always@(posedge clk_1H or posedge reset) begin
    if(reset)
        min_count_reg <= 0;
    else
        min_count_reg <= min_count_next;
end
always@(*) begin
    if((incr_pb && min_set_switch) || sec_count_reg==59)
        min_count_next = min_count_reg + 1; 
    else if(decr_pb && min_set_switch && min_count_reg > 0) 
        min_count_next = min_count_reg - 1; 
    else if(min_count_reg == 59)
        min_count_next = 0;     
    else 
        min_count_next = min_count_reg; 
end

assign sec_binary = sec_count_reg;  
assign min_binary = min_count_reg;   

endmodule
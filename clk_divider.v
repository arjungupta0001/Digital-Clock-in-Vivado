`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2022 13:17:18
// Design Name: 
// Module Name: clk_divider
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

module clk_divider(
    input clk_in,
    output reg clk_out=0
);

parameter div_val=2499999;
reg[31:0] count_reg=0, count_next=0;

always @(posedge clk_in) begin
    if(count_next==div_val)
        count_reg <= 0;
    else
        count_reg <= count_next;
end

always @(*)
    count_next = count_reg+1;
    
always @(posedge clk_in) begin
    if(count_next==div_val)
        clk_out <= ~clk_out;
    else
        clk_out <= clk_out;
end

endmodule
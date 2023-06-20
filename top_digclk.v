`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2022 13:38:33
// Design Name: 
// Module Name: top_digclk
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
//////////////////////////////////////////////////////////////////////////////////=
`timescale 1ns / 1ps

module top_digclk(
    input clk_100M, input reset, input incr_pb,
    input decr_pb, input min_set_switch,
    output [5:0] sec_out, output[5:0] min_out
);

wire clk_5M, clk_1H;
clk_wiz_0 sysclk(.clk_out1(clk_5M), .clk_in1(clk_100M));  
clk_divider clkdiv(.clk_in(clk_5M), .clk_out(clk_1H));
digital_clock digclk(.clk_1H(clk_1H), .reset(reset), .incr_pb(incr_pb), .decr_pb(decr_pb), 
.min_set_switch(min_set_switch), .sec_binary(sec_out), .min_binary(min_out));  
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2022 12:38:41
// Design Name: 
// Module Name: digclk_tb
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
module digclk_tb();
reg clk, reset;
reg incr_pb, decr_pb, min_set_switch;
wire[5:0] sec_out;
wire[5:0] min_out;
digital_clock digclk(.clk_1H(clk), .reset(reset), .incr_pb(incr_pb), .decr_pb(decr_pb), .min_set_switch(min_set_switch), .sec_binary(sec_out), .min_binary(min_out));
initial begin
    clk=1'b0; reset=1'b1;
    incr_pb=1'b0;decr_pb=1'b0;
    min_set_switch=1'b0;
end
initial begin
    #20 reset=1'b0;
    #50 min_set_switch=1'b1;
    #10 incr_pb=1'b1;
    #30 incr_pb=1'b0;
    #20 decr_pb=1'b1;
    #10 decr_pb=1'b0;
    #10 min_set_switch=1'b0;
    #20 incr_pb=1'b1;
    #10 incr_pb=1'b0;
end
always #5 clk=~clk;
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2022 13:58:49
// Design Name: 
// Module Name: vio_wrapper
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

module vio_wrapper(input clk);
wire [5:0] sec_out, min_out;
wire reset, incr_pb, decr_pb, min_set_switch;
vio_0 vio_inst(
  .clk(clk),               
  .probe_in0(sec_out),   
  .probe_in1(min_out),   
  .probe_out0(reset),  
  .probe_out1(incr_pb),  
  .probe_out2(decr_pb),  
  .probe_out3(min_set_switch)  
);
top_digclk digclk_inst(.clk_100M(clk), .reset(reset), .incr_pb(incr_pb),
.decr_pb(decr_pb), .min_set_switch(min_set_switch), .sec_out(sec_out), .min_out(min_out));

endmodule
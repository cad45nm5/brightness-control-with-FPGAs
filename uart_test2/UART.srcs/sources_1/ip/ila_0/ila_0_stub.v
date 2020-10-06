// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Jan 10 23:18:49 2020
// Host        : DADI-20180128YX running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               G:/deverlopboard/a35t_code/UART/UART.srcs/sources_1/ip/ila_0/ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tftg256-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2017.4" *)
module ila_0(clk, probe0)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[19:0]" */;
  input clk;
  input [19:0]probe0;
endmodule

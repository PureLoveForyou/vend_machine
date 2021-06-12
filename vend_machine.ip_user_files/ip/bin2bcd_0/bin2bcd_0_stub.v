// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Mon May 31 22:49:21 2021
// Host        : LAPTOP-6M4VV673 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Documents/Sophomore2/Digital_logic_and_digital_system/DLDS/docs/Experiments/Lab4/vend_machine/vend_machine.srcs/sources_1/ip/bin2bcd_0/bin2bcd_0_stub.v
// Design      : bin2bcd_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tftg256-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "bin2bcd,Vivado 2018.2" *)
module bin2bcd_0(bin, bcd)
/* synthesis syn_black_box black_box_pad_pin="bin[7:0],bcd[7:0]" */;
  input [7:0]bin;
  output [7:0]bcd;
endmodule
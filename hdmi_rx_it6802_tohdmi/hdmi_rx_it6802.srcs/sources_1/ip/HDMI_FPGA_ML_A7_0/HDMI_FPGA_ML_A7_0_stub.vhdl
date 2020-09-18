-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Wed Jun 12 10:14:20 2019
-- Host        : DADI-20180128YX running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               G:/deverlopboard/a35t_code/hdmi1_tx_35t_1080p60hz/08_hdmi_tx.srcs/sources_1/ip/HDMI_FPGA_ML_A7_0/HDMI_FPGA_ML_A7_0_stub.vhdl
-- Design      : HDMI_FPGA_ML_A7_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tftg256-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HDMI_FPGA_ML_A7_0 is
  Port ( 
    PXLCLK_I : in STD_LOGIC;
    PXLCLK_5X_I : in STD_LOGIC;
    LOCKED_I : in STD_LOGIC;
    RST_N : in STD_LOGIC;
    VGA_HS : in STD_LOGIC;
    VGA_VS : in STD_LOGIC;
    VGA_DE : in STD_LOGIC;
    VGA_RGB : in STD_LOGIC_VECTOR ( 23 downto 0 );
    HDMI_CLK_P : out STD_LOGIC;
    HDMI_CLK_N : out STD_LOGIC;
    HDMI_D2_P : out STD_LOGIC;
    HDMI_D2_N : out STD_LOGIC;
    HDMI_D1_P : out STD_LOGIC;
    HDMI_D1_N : out STD_LOGIC;
    HDMI_D0_P : out STD_LOGIC;
    HDMI_D0_N : out STD_LOGIC
  );

end HDMI_FPGA_ML_A7_0;

architecture stub of HDMI_FPGA_ML_A7_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "PXLCLK_I,PXLCLK_5X_I,LOCKED_I,RST_N,VGA_HS,VGA_VS,VGA_DE,VGA_RGB[23:0],HDMI_CLK_P,HDMI_CLK_N,HDMI_D2_P,HDMI_D2_N,HDMI_D1_P,HDMI_D1_N,HDMI_D0_P,HDMI_D0_N";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "HDMI_FPGA_ML_A7,Vivado 2016.4";
begin
end;

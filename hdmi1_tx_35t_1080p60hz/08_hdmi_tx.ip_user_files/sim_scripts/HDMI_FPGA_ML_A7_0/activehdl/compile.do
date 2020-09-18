vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 \
"E:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"E:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93 \
"../../../ipstatic/src/TMDSEncoder.vhd" \
"../../../ipstatic/src/SerializerN_1.vhd" \
"../../../ipstatic/src/DVITransmitter.vhd" \
"../../../ipstatic/src/hdmi_tx.vhd" \
"../../../../HDMI_Display_Demon.srcs/sources_1/ip/HDMI_FPGA_ML_A7_0/sim/HDMI_FPGA_ML_A7_0.vhd" \

vlog -work xil_defaultlib "glbl.v"


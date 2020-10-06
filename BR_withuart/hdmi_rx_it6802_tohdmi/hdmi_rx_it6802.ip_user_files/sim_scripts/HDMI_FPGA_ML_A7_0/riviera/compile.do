vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93 \
"../../../ipstatic/src/TMDSEncoder.vhd" \
"../../../ipstatic/src/SerializerN_1.vhd" \
"../../../ipstatic/src/DVITransmitter.vhd" \
"../../../ipstatic/src/hdmi_tx.vhd" \
"../../../../hdmi_rx_it6802.srcs/sources_1/ip/HDMI_FPGA_ML_A7_0/sim/HDMI_FPGA_ML_A7_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"


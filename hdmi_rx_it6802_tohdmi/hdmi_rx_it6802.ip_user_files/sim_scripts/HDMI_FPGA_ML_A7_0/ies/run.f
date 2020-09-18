-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../ipstatic/src/TMDSEncoder.vhd" \
  "../../../ipstatic/src/SerializerN_1.vhd" \
  "../../../ipstatic/src/DVITransmitter.vhd" \
  "../../../ipstatic/src/hdmi_tx.vhd" \
  "../../../../hdmi_rx_it6802.srcs/sources_1/ip/HDMI_FPGA_ML_A7_0/sim/HDMI_FPGA_ML_A7_0.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib


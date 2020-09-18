-makelib ies/xil_defaultlib -sv \
  "E:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "E:/Xilinx/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../ipstatic/src/TMDSEncoder.vhd" \
  "../../../ipstatic/src/SerializerN_1.vhd" \
  "../../../ipstatic/src/DVITransmitter.vhd" \
  "../../../ipstatic/src/hdmi_tx.vhd" \
  "../../../../HDMI_Display_Demon.srcs/sources_1/ip/HDMI_FPGA_ML_A7_0/sim/HDMI_FPGA_ML_A7_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib


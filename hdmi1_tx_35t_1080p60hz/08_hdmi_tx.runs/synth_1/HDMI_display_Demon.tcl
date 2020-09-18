# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tfgg484-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir F:/my_work/a7_board_code/S01_CH11_HDMI/HDMI_Display_Demon/HDMI_Display_Demon.cache/wt [current_project]
set_property parent.project_path F:/my_work/a7_board_code/S01_CH11_HDMI/HDMI_Display_Demon/HDMI_Display_Demon.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths f:/my_work/a7_board_code/S01_CH11_HDMI/miz_ip_lib/HDMI_FPGA_ML_A7 [current_project]
set_property ip_output_repo f:/my_work/a7_board_code/S01_CH11_HDMI/HDMI_Display_Demon/HDMI_Display_Demon.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files -quiet F:/my_work/a7_board_code/S01_CH11_HDMI/HDMI_Display_Demon/HDMI_Display_Demon.srcs/sources_1/ip/HDMI_FPGA_ML_A7_0/HDMI_FPGA_ML_A7_0.dcp
set_property used_in_implementation false [get_files F:/my_work/a7_board_code/S01_CH11_HDMI/HDMI_Display_Demon/HDMI_Display_Demon.srcs/sources_1/ip/HDMI_FPGA_ML_A7_0/HDMI_FPGA_ML_A7_0.dcp]
add_files -quiet f:/my_work/a7_board_code/S01_CH11_HDMI/HDMI_Display_Demon/HDMI_Display_Demon.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.dcp
set_property used_in_implementation false [get_files f:/my_work/a7_board_code/S01_CH11_HDMI/HDMI_Display_Demon/HDMI_Display_Demon.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.dcp]
read_verilog -library xil_defaultlib {
  F:/my_work/a7_board_code/S01_CH11_HDMI/src/hdmi_data_gen.v
  F:/my_work/a7_board_code/S01_CH11_HDMI/src/HDMI_display_Demon.v
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc F:/my_work/a7_board_code/S01_CH11_HDMI/src/zynq_pin.xdc
set_property used_in_implementation false [get_files F:/my_work/a7_board_code/S01_CH11_HDMI/src/zynq_pin.xdc]


synth_design -top HDMI_display_Demon -part xc7a100tfgg484-2


write_checkpoint -force -noxdef HDMI_display_Demon.dcp

catch { report_utilization -file HDMI_display_Demon_utilization_synth.rpt -pb HDMI_display_Demon_utilization_synth.pb }

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]



set_property IOSTANDARD LVCMOS33 [get_ports clk_i]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rx]
set_property IOSTANDARD LVCMOS33 [get_ports uart_tx]


set_property PACKAGE_PIN N11 [get_ports clk_i]
set_property PACKAGE_PIN R2 [get_ports uart_rx]
set_property PACKAGE_PIN R3 [get_ports uart_tx]


#һ�����ü���FLASH�����ٶȣ���������븴�ƴ˴����±���
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property CONFIG_MODE SPIx1 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
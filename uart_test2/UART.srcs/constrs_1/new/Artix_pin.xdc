set_property IOSTANDARD LVCMOS33 [get_ports clk_i]
set_property IOSTANDARD LVCMOS33 [get_ports uart_rx_i]
set_property IOSTANDARD LVCMOS33 [get_ports uart_tx_o]


set_property PACKAGE_PIN N11 [get_ports clk_i]
set_property PACKAGE_PIN R2 [get_ports uart_rx_i]
set_property PACKAGE_PIN R3 [get_ports uart_tx_o]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_i_IBUF_BUFG]

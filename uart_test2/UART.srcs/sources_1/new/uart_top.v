`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/25 13:37:32
// Design Name: 
// Module Name: uart_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_top(
	input clk_i,
//	input rst_n_i,
	
	input uart_rx_i,
	
	(*mark_debug ="true" *)output uart_tx_o
    );

(*mark_debug ="true" *)wire [7:0] uart_rx_data_o;
(*mark_debug ="true" *)wire uart_rx_done;
    
uart_rx_path uart_rx_path_u (
    .clk_i(clk_i), 
    .uart_rx_i(uart_rx_i), 

    .uart_rx_data_o(uart_rx_data_o), 
    .uart_rx_done(uart_rx_done)
    );
    
uart_tx_path uart_tx_path_u (
    .clk_i(clk_i), 
    .uart_tx_data_i(uart_rx_data_o), 
    .uart_tx_en_i(uart_rx_done), 
    .uart_tx_o(uart_tx_o)
    );

(*mark_debug ="true" *)reg [9:0] cnt;
always @(posedge clk_i)
if(uart_rx_done)
cnt <= cnt+1;

 wire [19:0] probe0;


ila_0 u_ila0 (
	.clk(clk_i), // input wire clk
	.probe0(probe0) // input wire [9:0] probe0
);
    
    assign probe0[7:0] = uart_rx_data_o;
    assign probe0[8] = uart_rx_done;
    assign probe0[9] = uart_tx_o;
    assign probe0[19:10] = cnt;
endmodule


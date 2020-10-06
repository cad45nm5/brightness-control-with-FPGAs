`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/07/25 13:41:50
// Design Name: 
// Module Name: uart_top_TB
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


module uart_top_TB;

reg clk_i;
reg rst_n_i;
reg uart_rx_i;
wire [7:0]  uart_tx_o;

uart_top u_uart_top
(
.clk_i  (clk_i),
.rst_n_i    (rst_n_i),
.uart_rx_i  (uart_rx_i),
.uart_tx_o  (uart_tx_o)
);

initial
begin
        clk_i = 0;
		rst_n_i = 0;
		uart_rx_i = 0;

		// Wait 100 ns for global reset to finish
		#96;
		rst_n_i=1;
		
		#200
		uart_rx_i = 1'b1;
		#10
        uart_rx_i = 1'b0;
        #10
        uart_rx_i = 1'b1;
         #10
         uart_rx_i = 1'b0;
         #10
         uart_rx_i = 1'b1;
         #10
         uart_rx_i = 1'b0;
         #10
          uart_rx_i = 1'b1;
          #10
          uart_rx_i = 1'b0;
          
          #50
                uart_rx_i = 1'b1;
                  #10
                  uart_rx_i = 1'b1;
                  #10
                  uart_rx_i = 1'b1;
                   #10
                   uart_rx_i = 1'b1;
                   #10
                   uart_rx_i = 1'b0;
                   #10
                   uart_rx_i = 1'b0;
                   #10
                    uart_rx_i = 1'b0;
                    #10
                    uart_rx_i = 1'b0;          
end

always 
    begin
        #5 clk_i = ~clk_i;
    end
    
endmodule

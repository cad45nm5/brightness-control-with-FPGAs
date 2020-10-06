`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    uart_test 
// 描述: USB Uart通信测试，默认程序发送"HELLO ALINX AX7101",当串口接收到
//       PC发来的字符串，会把字符串发回给PC。波特率为9600，奇或偶校验，1位停止位。
//////////////////////////////////////////////////////////////////////////////////
module uart_test(
         input clk_i,                     // 开发板上时钟输入时钟: 50Mhz 如果开发板时钟不是50MHZ，那么要进行更改
         input uart_rx,                       // 串口接收
         output uart_tx);                     // 串口发送

////////////////差分时钟转换成单端时钟////////////////////////
wire sys_clk_ibufg;
 BUFG   u_bufg_sys_clk
         (
          .I  (clk_i),
          .O  (sys_clk_ibufg)
          );

wire clk;       //clock for 9600 uart port
wire [7:0] txdata,rxdata;     //串口发送数据和串口接收数据
wire rdsig;                   //串口接收数据有效信号
wire wrsig;                   //串口发送数据有效信号


//产生时钟的频率为16*9600
clkdiv u0 (
		.clk200                  (sys_clk_ibufg),       //50Mhz的晶振输入                     
		.clkout                  (clk)                  //16倍波特率的时钟                        
 );

//串口接收程序
uartrx u1 (
		.clk                     (clk),                 //16倍波特率的时钟 
        .rx	                     (uart_rx),  	        //串口接收
		.dataout                 (rxdata),              //uart 接收到的数据,一个字节                     
        .rdsig                   (rdsig),               //uart 接收到数据有效 
		.dataerror               (),
		.frameerror              ()
);

//串口发送程序
uarttx u2 (
		.clk                     (clk),                  //16倍波特率的时钟  
	    .tx                      (uart_tx),			     //串口发送
		.datain                  (txdata),               //uart 发送的数据   
        .wrsig                   (wrsig),                //uart 发送的数据有效  
        .idle                    () 	
	
 );

//串口数据发送控制程序
uartctrl u3 (
		.clk                     (clk),                           
		.rdsig                   (rdsig),                //uart 接收到数据有效   
        .rxdata                  (rxdata), 		         //uart 接收到的数据 
        .wrsig                   (wrsig),                //uart 发送的数据有效  
        .dataout                 (txdata)	             //uart 发送的数据，一个字节 

	
 );
 

endmodule


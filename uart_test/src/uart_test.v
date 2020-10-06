`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    uart_test 
// ����: USB Uartͨ�Ų��ԣ�Ĭ�ϳ�����"HELLO ALINX AX7101",�����ڽ��յ�
//       PC�������ַ���������ַ������ظ�PC��������Ϊ9600�����żУ�飬1λֹͣλ��
//////////////////////////////////////////////////////////////////////////////////
module uart_test(
         input clk_i,                     // ��������ʱ������ʱ��: 50Mhz ���������ʱ�Ӳ���50MHZ����ôҪ���и���
         input uart_rx,                       // ���ڽ���
         output uart_tx);                     // ���ڷ���

////////////////���ʱ��ת���ɵ���ʱ��////////////////////////
wire sys_clk_ibufg;
 BUFG   u_bufg_sys_clk
         (
          .I  (clk_i),
          .O  (sys_clk_ibufg)
          );

wire clk;       //clock for 9600 uart port
wire [7:0] txdata,rxdata;     //���ڷ������ݺʹ��ڽ�������
wire rdsig;                   //���ڽ���������Ч�ź�
wire wrsig;                   //���ڷ���������Ч�ź�


//����ʱ�ӵ�Ƶ��Ϊ16*9600
clkdiv u0 (
		.clk200                  (sys_clk_ibufg),       //50Mhz�ľ�������                     
		.clkout                  (clk)                  //16�������ʵ�ʱ��                        
 );

//���ڽ��ճ���
uartrx u1 (
		.clk                     (clk),                 //16�������ʵ�ʱ�� 
        .rx	                     (uart_rx),  	        //���ڽ���
		.dataout                 (rxdata),              //uart ���յ�������,һ���ֽ�                     
        .rdsig                   (rdsig),               //uart ���յ�������Ч 
		.dataerror               (),
		.frameerror              ()
);

//���ڷ��ͳ���
uarttx u2 (
		.clk                     (clk),                  //16�������ʵ�ʱ��  
	    .tx                      (uart_tx),			     //���ڷ���
		.datain                  (txdata),               //uart ���͵�����   
        .wrsig                   (wrsig),                //uart ���͵�������Ч  
        .idle                    () 	
	
 );

//�������ݷ��Ϳ��Ƴ���
uartctrl u3 (
		.clk                     (clk),                           
		.rdsig                   (rdsig),                //uart ���յ�������Ч   
        .rxdata                  (rxdata), 		         //uart ���յ������� 
        .wrsig                   (wrsig),                //uart ���͵�������Ч  
        .dataout                 (txdata)	             //uart ���͵����ݣ�һ���ֽ� 

	
 );
 

endmodule


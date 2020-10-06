`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    clkdiv
// ����һ��������9600��16��Ƶ��ʱ�ӣ�9600*16= 153600
// �൱��200MHz��1302��Ƶ��200000000/153600=1302
//////////////////////////////////////////////////////////////////////////////////
module clkdiv(clk200, clkout);
input clk200;              //ϵͳʱ��
output clkout;          //����ʱ�����
reg clkout;
reg [15:0] cnt;

//��Ƶ����,��50Mhz��ʱ��1302��Ƶ
always @(posedge clk200)   
begin
  if(cnt == 16'd162)
  begin
    clkout <= 1'b1;
    cnt <= cnt + 16'd1;
  end
  else if(cnt == 16'd325)
  begin
    clkout <= 1'b0;
    cnt <= 16'd0;
  end
  else
  begin
    cnt <= cnt + 16'd1;
  end
end
endmodule

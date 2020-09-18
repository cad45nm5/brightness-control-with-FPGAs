`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:58:31 09/01/2017 
// Design Name: 
// Module Name:    hdmi_it6802_proc 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//`define vsim

module hdmi_rx(
`ifndef vsim
    input clk_27m,
`endif
    output i2c_clk,
    inout i2c_data,
    input [7:0] r_in,
    input [7:0] g_in,
    input [7:0] b_in,
	 input		pclk,
	 input		hs_in,
	 input		vs_in,
	 input		de_in,
	 input		i2s_sdin,
	 input		i2s_sck,	 
	 input		i2s_ws,
	 input		i2s_mclk,
	 input KEY,
	 output		it6802_rstn	,
	 
	 output      HDMI_CLK_P,
     output      HDMI_CLK_N,
     output      HDMI_D2_P,
     output      HDMI_D2_N,
     output      HDMI_D1_P,
     output      HDMI_D1_N,
     output      HDMI_D0_P,
     output      HDMI_D0_N
    );

  `ifdef vsim
    reg clk_27m = 0;           
    `endif  
    
    
 `ifdef vsim
        initial begin
           while (1) #1  clk_27m = ~clk_27m;
       end
    `endif   
	 
wire clk_27m_bufg;
wire clk_148p5;
wire locked;


BUFG BUFG_inst (
		.O(clk_27m_bufg), // 1-bit output: Clock buffer output
		.I(clk_27m)  // 1-bit input: Clock buffer input
);





reg [25:0] it6802_reset_cnt=0;
reg it6802_rst;
always @ (posedge clk_27m_bufg) begin
	if(it6802_reset_cnt[25]==0)
	it6802_reset_cnt <= it6802_reset_cnt+1'b1;
	else
	it6802_reset_cnt <= it6802_reset_cnt;
	if(it6802_reset_cnt[25])
	it6802_rst <= 1'b1;
	else
	it6802_rst <= 1'b0;
end

assign it6802_rstn = it6802_rst;

reg [7:0] r_dly1,g_dly1,b_dly1;
reg [7:0] r_dly2,g_dly2,b_dly2;
(* mark_debug = "true" *)reg [7:0] r_dly3,g_dly3,b_dly3;
reg hs_dly1,vs_dly1,de_dly1;
(* mark_debug = "true" *)reg hs_dly2,vs_dly2,de_dly2;
reg hs_dly3,vs_dly3,de_dly3;

reg [7:0] tempR,tempG,tempB;

 reg [7:0]Rout,Gout,Bout;
reg[20:0] x_cnt=0;
 reg[20:0] y_cnt=0;
//integer HL=192,HR=1728,VH=108,VL=972;
reg[15:0] HL=20,HR=1900,VH=10,VL=1070;
parameter HBP=148,HFP=88;//148,88
parameter VBP=36,VFP=4;

parameter active_x=1920,active_y=1080;
reg[2:0]state,y_state=3;
reg[10:0]SYNC_CNT,Y_SYNC_CNT;
reg[3:0]edge_case;


reg[30:0]cnt;
reg clk_debounce; 


always@(posedge clk_27m)
    begin
        cnt<=cnt+1;
        if(cnt>=2000000)
            begin
                cnt<=0;
                clk_debounce<=~clk_debounce;
            end
            
    end


always@(posedge clk_debounce)
    begin
         if(KEY==0) edge_case=edge_case+1;
    end





always @ (posedge pclk ) begin

 case(edge_case)
            0:
                begin
                     HL=20;
                     VH=20;
                     HR=1900;
                     VL=1060;
                end
            1:
             begin
                     HL=20;
                     VH=0;
                     HR=1900;
                     VL=1060;
                end
            2:
             begin
                     HL=20;
                     VH=20;
                     HR=1920;
                     VL=1060;
                end
            3:
             begin
                     HL=20;
                     VH=20;
                     HR=1900;
                     VL=1080;
                end
            4:
             begin
                     HL=20;
                     VH=20;
                     HR=1900;
                     VL=1060;
                end
            5:
             begin
                     HL=0;
                     VH=0;
                     HR=1900;
                     VL=1060;
                end
            6:
             begin
                     HL=0;
                     VH=20;
                     HR=1920;
                     VL=1060;
                end
            7:
             begin
                     HL=0;
                     VH=20;
                     HR=1900;
                     VL=1080;
                end
            8:
             begin
                     HL=20;
                     VH=0;
                     HR=1920;
                     VL=1060;
                end
            9:
             begin
                     HL=20;
                     VH=0;
                     HR=1900;
                     VL=1080;
                end
            10:
             begin
                     HL=20;
                     VH=20;
                     HR=1920;
                     VL=1080;
                end
            11:
             begin
                     HL=0;
                     VH=0;
                     HR=1920;
                     VL=1070;
                end
            12:
             begin
                     HL=0;
                     VH=0;
                     HR=1900;
                     VL=1080;
                end
            13:
             begin
                     HL=20;
                     VH=0;
                     HR=1920;
                     VL=1080;
                end
            14:
             begin
                     HL=0;
                     VH=0;
                     HR=1900;
                     VL=1080;
                end
            15:
             begin
                     HL=1920;
                     VH=1080;
                     HR=0;
                     VL=0;//????????????????????????
                end
         endcase


    case(state)
        0:
            begin
                if(hs_dly2==1)
                    begin
                        state=1;
                    end
            end
        1:
            begin
                if(hs_dly2==0)
                    begin
                        state=2;
                    end
            end
         2:
            begin
                SYNC_CNT<=SYNC_CNT+1;
                if(SYNC_CNT>=HBP)
                   begin
                        state<=3;
                        x_cnt<=0;
                        SYNC_CNT<=0;
                        if(y_state==3) y_cnt<=y_cnt+1;
                        if(y_state==2)
                            begin
                                 Y_SYNC_CNT<=Y_SYNC_CNT+1;
                            end
                   end
            end
         3:
            begin
                x_cnt<=x_cnt+1;
                if(x_cnt>=active_x)
                    begin
                        state<=0;
                       
                    end
            end 
    endcase
        
    case(y_state)
       0:
            begin
                if(vs_dly2==1)
                    begin
                        y_state=1;
                    end
            end
        1:
            begin
                if(vs_dly2==0)
                    begin
                        y_state=2;
                    end
            end
         2:
            begin
               
                if(Y_SYNC_CNT>=VBP)
                   begin
                        y_state<=3;
                        y_cnt<=0;
                        Y_SYNC_CNT<=0;
                   end
            end
         3:
            begin
             
                if(y_cnt>=active_y)
                    begin
                        y_state<=0;
                    end
            end 
    endcase



   if(de_dly2==1)
        begin
           tempR<=r_dly2;
           tempG<=g_dly2;
           tempB<=b_dly2;
        end
    else
        begin
           tempR<=0;
           tempG<=0;
           tempB<=0;
        end
         if(y_cnt<VH||y_cnt>VL||x_cnt<HL||x_cnt>HR)
            begin
                 Rout<=tempR;
                 Gout<=tempG;
                 Bout<=tempB;
            end
        else 
            begin
                 Rout<=tempR-tempR/5;
                 Gout<=tempG-tempG/5;
                 Bout<=tempB-tempB/5;
            end
            
            
        //-----------------------------CNT-------------------------------------------------------
     
      


r_dly1 <= r_in;
g_dly1 <= g_in;
b_dly1 <= b_in;

r_dly2 <= r_dly1;
g_dly2 <= g_dly1;
b_dly2 <= b_dly1;

r_dly3 <= Rout;
g_dly3 <= Gout;
b_dly3 <= Bout;

hs_dly1 <= hs_in;
hs_dly2 <= hs_dly1;
hs_dly3 <= hs_dly2;  

vs_dly1 <= vs_in;
vs_dly2 <= vs_dly1;
vs_dly3 <= vs_dly2; 


de_dly1 <= de_in;
de_dly2 <= de_dly1;
de_dly3 <= de_dly2;
end

wire vio;

iic_com	u_iic_com(
			.clk		(clk_27m_bufg),
			.rst_n	(it6802_rst&vio),
			.scl		(i2c_clk),
			.sda		(i2c_data)	
		);

wire pixclk;
wire[7:0]   R,G,B;
wire HS,VS,DE;
wire serclk;
wire lock;
wire[23:0]  RGB;
assign RGB={r_dly3,g_dly3,b_dly3};
assign HS = hs_dly3;
assign VS = vs_dly3;
assign DE = de_dly3;
//assign pixclk = pclk;

sys_pll sys_pll_i
 (
	// Clock in ports
	.clk_in1(pclk),
	// Clock out ports
	.clk_out1(pixclk),
	.clk_out2(serclk),
	// Status and control signals
	.reset(1'b0),
	.locked(locked)
 );

HDMI_FPGA_ML_A7_0 u_HDMI
(
    .PXLCLK_I           (pixclk),
    .PXLCLK_5X_I        (serclk),
    .LOCKED_I           (locked),
    .RST_N              (1'b1),
    .VGA_HS             (HS),
    .VGA_VS             (VS),
    .VGA_DE             (DE),
    .VGA_RGB            (RGB),
    .HDMI_CLK_P         (HDMI_CLK_P),
    .HDMI_CLK_N         (HDMI_CLK_N),
    .HDMI_D2_P          (HDMI_D2_P),
    .HDMI_D2_N          (HDMI_D2_N),
    .HDMI_D1_P          (HDMI_D1_P),
    .HDMI_D1_N          (HDMI_D1_N),
    .HDMI_D0_P          (HDMI_D0_P),
    .HDMI_D0_N          (HDMI_D0_N)
); 


vio_0 u_vio (
  .clk(clk_27m_bufg),                // input wire clk
  .probe_out0(vio)  // output wire [0 : 0] probe_out0
);
		
wire [49:0] probe0;
ila_0 u_ila (
	.clk(pclk), // input wire clk
	.probe0(probe0) // input wire [49:0] probe0
);

assign probe0[0] = i2s_mclk;
assign probe0[1] = hs_dly2;
assign probe0[2] = vs_dly2;
assign probe0[3] = de_dly2;
assign probe0[11:4] = r_dly3;
assign probe0[19:12] = g_dly3;	
assign probe0[27:20] = b_dly3;		
assign probe0[28] =i2s_sdin;
assign probe0[29] =i2s_sck;    
assign probe0[30] =i2s_ws;
assign probe0[31] =i2s_mclk;
endmodule

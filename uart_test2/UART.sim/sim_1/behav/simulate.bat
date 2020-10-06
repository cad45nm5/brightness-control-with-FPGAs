@echo off
set xv_path=D:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xsim uart_top_TB_behav -key {Behavioral:sim_1:Functional:uart_top_TB} -tclbatch uart_top_TB.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

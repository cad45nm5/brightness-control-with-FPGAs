@echo off
set xv_path=D:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 63862a82907e4382b65720b5498b24f3 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot uart_top_TB_behav xil_defaultlib.uart_top_TB xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
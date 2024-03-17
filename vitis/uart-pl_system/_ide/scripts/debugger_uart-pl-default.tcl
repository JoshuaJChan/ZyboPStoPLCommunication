# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\Users\darkr\Documents\vitisProjects2\uart-pl_system\_ide\scripts\debugger_uart-pl-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\Users\darkr\Documents\vitisProjects2\uart-pl_system\_ide\scripts\debugger_uart-pl-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351AB759FA" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351AB759FA-13722093-0"}
fpga -file C:/Users/darkr/Documents/vitisProjects2/uart-pl/_ide/bitstream/uart_pl_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/darkr/Documents/vitisProjects2/uart_pl_wrapper/export/uart_pl_wrapper/hw/uart_pl_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/darkr/Documents/vitisProjects2/uart-pl/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/darkr/Documents/vitisProjects2/uart-pl/Debug/uart-pl.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con

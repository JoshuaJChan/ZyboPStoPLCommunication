# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\darkr\Documents\vitisProjects2\uart_pl_wrapper\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\darkr\Documents\vitisProjects2\uart_pl_wrapper\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {uart_pl_wrapper}\
-hw {C:\Users\darkr\Documents\vivadoProjects\uart-pl\uart_pl_wrapper.xsa}\
-out {C:/Users/darkr/Documents/vitisProjects2}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {hello_world}
platform generate -domains 
platform active {uart_pl_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
platform config -updatehw {C:/Users/darkr/Documents/vivadoProjects/uart-pl/uart_pl_wrapper.xsa}
catch {platform remove pmod_wrapper_1}
catch {platform remove pmod_wrapper}

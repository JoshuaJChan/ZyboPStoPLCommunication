# UART module of FPGA SRM Capstone project
* We receive user input from the PC.
* The input is transported to the Processing System through the UART-USB bridge.
* The numbers are stored in a GPIO.
* The Programming Logic part of the Zybo Z7 reads from the GPIO to then blink that number of times.

## Current Bugs
* unable to make FPGA be programmed properly
  * [Common 17-180] Spawn failed: No error

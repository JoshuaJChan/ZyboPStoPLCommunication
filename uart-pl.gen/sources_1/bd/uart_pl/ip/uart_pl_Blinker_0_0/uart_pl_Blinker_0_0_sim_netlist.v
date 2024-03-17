// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sun Mar 17 06:37:13 2024
// Host        : DESKTOP-N3LNUH3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/darkr/Documents/vivadoProjects/uart-pl/uart-pl.gen/sources_1/bd/uart_pl/ip/uart_pl_Blinker_0_0/uart_pl_Blinker_0_0_sim_netlist.v
// Design      : uart_pl_Blinker_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "uart_pl_Blinker_0_0,Blinker,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "Blinker,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module uart_pl_Blinker_0_0
   (clk,
    num,
    received,
    finish,
    led);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN uart_pl_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  input [7:0]num;
  input received;
  output finish;
  output led;

  wire clk;
  wire finish;
  wire led;
  wire [7:0]num;
  wire received;

  uart_pl_Blinker_0_0_Blinker inst
       (.clk(clk),
        .finish(finish),
        .led(led),
        .num(num),
        .received(received));
endmodule

(* ORIG_REF_NAME = "Blinker" *) 
module uart_pl_Blinker_0_0_Blinker
   (led,
    finish,
    received,
    clk,
    num);
  output led;
  output finish;
  input received;
  input clk;
  input [7:0]num;

  wire FSM_sequential_state_i_1_n_0;
  wire clk;
  wire count;
  wire [5:3]count0;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire \count[5]_i_1_n_0 ;
  wire \count[6]_i_1_n_0 ;
  wire \count[7]_i_1_n_0 ;
  wire \count[7]_i_2_n_0 ;
  wire [7:0]count_reg;
  wire finish;
  wire finish_i_1_n_0;
  wire led;
  wire led_i_1_n_0;
  wire led_i_2_n_0;
  wire led_i_3_n_0;
  wire led_i_4_n_0;
  wire [7:0]num;
  wire received;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    FSM_sequential_state_i_1
       (.I0(received),
        .I1(count),
        .O(FSM_sequential_state_i_1_n_0));
  (* FSM_ENCODED_STATES = "idle:0,blink:1" *) 
  FDRE FSM_sequential_state_reg
       (.C(clk),
        .CE(1'b1),
        .D(FSM_sequential_state_i_1_n_0),
        .Q(count),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h00F7)) 
    \count[0]_i_1 
       (.I0(led_i_2_n_0),
        .I1(led_i_3_n_0),
        .I2(led_i_4_n_0),
        .I3(count_reg[0]),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00F7F700)) 
    \count[1]_i_1 
       (.I0(led_i_2_n_0),
        .I1(led_i_3_n_0),
        .I2(led_i_4_n_0),
        .I3(count_reg[0]),
        .I4(count_reg[1]),
        .O(\count[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F7F7F7F7000000)) 
    \count[2]_i_1 
       (.I0(led_i_2_n_0),
        .I1(led_i_3_n_0),
        .I2(led_i_4_n_0),
        .I3(count_reg[0]),
        .I4(count_reg[1]),
        .I5(count_reg[2]),
        .O(\count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count[3]_i_1 
       (.I0(count_reg[1]),
        .I1(count_reg[0]),
        .I2(count_reg[2]),
        .I3(count_reg[3]),
        .O(count0[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count[4]_i_1 
       (.I0(count_reg[2]),
        .I1(count_reg[0]),
        .I2(count_reg[1]),
        .I3(count_reg[3]),
        .I4(count_reg[4]),
        .O(count0[4]));
  LUT4 #(
    .INIT(16'h0800)) 
    \count[5]_i_1 
       (.I0(led_i_2_n_0),
        .I1(led_i_3_n_0),
        .I2(led_i_4_n_0),
        .I3(count),
        .O(\count[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count[5]_i_2 
       (.I0(count_reg[3]),
        .I1(count_reg[1]),
        .I2(count_reg[0]),
        .I3(count_reg[2]),
        .I4(count_reg[4]),
        .I5(count_reg[5]),
        .O(count0[5]));
  LUT5 #(
    .INIT(32'h00F7F700)) 
    \count[6]_i_1 
       (.I0(led_i_2_n_0),
        .I1(led_i_3_n_0),
        .I2(led_i_4_n_0),
        .I3(\count[7]_i_2_n_0 ),
        .I4(count_reg[6]),
        .O(\count[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F7F7F7F7000000)) 
    \count[7]_i_1 
       (.I0(led_i_2_n_0),
        .I1(led_i_3_n_0),
        .I2(led_i_4_n_0),
        .I3(\count[7]_i_2_n_0 ),
        .I4(count_reg[6]),
        .I5(count_reg[7]),
        .O(\count[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count[7]_i_2 
       (.I0(count_reg[5]),
        .I1(count_reg[3]),
        .I2(count_reg[1]),
        .I3(count_reg[0]),
        .I4(count_reg[2]),
        .I5(count_reg[4]),
        .O(\count[7]_i_2_n_0 ));
  FDRE \count_reg[0] 
       (.C(clk),
        .CE(count),
        .D(\count[0]_i_1_n_0 ),
        .Q(count_reg[0]),
        .R(1'b0));
  FDRE \count_reg[1] 
       (.C(clk),
        .CE(count),
        .D(\count[1]_i_1_n_0 ),
        .Q(count_reg[1]),
        .R(1'b0));
  FDRE \count_reg[2] 
       (.C(clk),
        .CE(count),
        .D(\count[2]_i_1_n_0 ),
        .Q(count_reg[2]),
        .R(1'b0));
  FDRE \count_reg[3] 
       (.C(clk),
        .CE(count),
        .D(count0[3]),
        .Q(count_reg[3]),
        .R(\count[5]_i_1_n_0 ));
  FDRE \count_reg[4] 
       (.C(clk),
        .CE(count),
        .D(count0[4]),
        .Q(count_reg[4]),
        .R(\count[5]_i_1_n_0 ));
  FDRE \count_reg[5] 
       (.C(clk),
        .CE(count),
        .D(count0[5]),
        .Q(count_reg[5]),
        .R(\count[5]_i_1_n_0 ));
  FDRE \count_reg[6] 
       (.C(clk),
        .CE(count),
        .D(\count[6]_i_1_n_0 ),
        .Q(count_reg[6]),
        .R(1'b0));
  FDRE \count_reg[7] 
       (.C(clk),
        .CE(count),
        .D(\count[7]_i_1_n_0 ),
        .Q(count_reg[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    finish_i_1
       (.I0(count),
        .I1(received),
        .O(finish_i_1_n_0));
  FDRE finish_reg
       (.C(clk),
        .CE(1'b1),
        .D(finish_i_1_n_0),
        .Q(finish),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h0800FFFF)) 
    led_i_1
       (.I0(led_i_2_n_0),
        .I1(led_i_3_n_0),
        .I2(led_i_4_n_0),
        .I3(led),
        .I4(count),
        .O(led_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    led_i_2
       (.I0(count_reg[0]),
        .I1(num[0]),
        .I2(num[2]),
        .I3(count_reg[2]),
        .I4(num[1]),
        .I5(count_reg[1]),
        .O(led_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    led_i_3
       (.I0(count_reg[3]),
        .I1(num[3]),
        .I2(num[5]),
        .I3(count_reg[5]),
        .I4(num[4]),
        .I5(count_reg[4]),
        .O(led_i_3_n_0));
  LUT4 #(
    .INIT(16'h6FF6)) 
    led_i_4
       (.I0(count_reg[6]),
        .I1(num[6]),
        .I2(count_reg[7]),
        .I3(num[7]),
        .O(led_i_4_n_0));
  FDRE led_reg
       (.C(clk),
        .CE(1'b1),
        .D(led_i_1_n_0),
        .Q(led),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

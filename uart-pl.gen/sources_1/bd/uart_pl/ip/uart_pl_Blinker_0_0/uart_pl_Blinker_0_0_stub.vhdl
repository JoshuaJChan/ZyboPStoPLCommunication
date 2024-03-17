-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Sun Mar 17 06:37:13 2024
-- Host        : DESKTOP-N3LNUH3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/darkr/Documents/vivadoProjects/uart-pl/uart-pl.gen/sources_1/bd/uart_pl/ip/uart_pl_Blinker_0_0/uart_pl_Blinker_0_0_stub.vhdl
-- Design      : uart_pl_Blinker_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uart_pl_Blinker_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    num : in STD_LOGIC_VECTOR ( 7 downto 0 );
    received : in STD_LOGIC;
    finish : out STD_LOGIC;
    led : out STD_LOGIC
  );

end uart_pl_Blinker_0_0;

architecture stub of uart_pl_Blinker_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,num[7:0],received,finish,led";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "Blinker,Vivado 2023.2";
begin
end;

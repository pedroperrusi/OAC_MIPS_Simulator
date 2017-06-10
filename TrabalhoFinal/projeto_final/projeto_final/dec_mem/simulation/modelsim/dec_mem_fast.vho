-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "06/08/2017 11:10:42"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	dec_mem IS
    PORT (
	SW : IN std_logic_vector(6 DOWNTO 0);
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0);
	HEX2 : OUT std_logic_vector(6 DOWNTO 0);
	HEX3 : OUT std_logic_vector(6 DOWNTO 0);
	HEX4 : OUT std_logic_vector(6 DOWNTO 0);
	HEX5 : OUT std_logic_vector(6 DOWNTO 0);
	HEX6 : OUT std_logic_vector(6 DOWNTO 0);
	HEX7 : OUT std_logic_vector(6 DOWNTO 0)
	);
END dec_mem;

-- Design Ports Information
-- HEX0[0]	=>  Location: PIN_AF10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX0[1]	=>  Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX0[2]	=>  Location: PIN_AC12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX0[3]	=>  Location: PIN_AD11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX0[4]	=>  Location: PIN_AE11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX0[5]	=>  Location: PIN_V14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX0[6]	=>  Location: PIN_V13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX1[0]	=>  Location: PIN_V20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX1[1]	=>  Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX1[2]	=>  Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX1[3]	=>  Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX1[4]	=>  Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX1[5]	=>  Location: PIN_AA23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX1[6]	=>  Location: PIN_AB24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX2[0]	=>  Location: PIN_AB23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX2[1]	=>  Location: PIN_V22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX2[2]	=>  Location: PIN_AC25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX2[3]	=>  Location: PIN_AC26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX2[4]	=>  Location: PIN_AB26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX2[5]	=>  Location: PIN_AB25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX2[6]	=>  Location: PIN_Y24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX3[0]	=>  Location: PIN_Y23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX3[1]	=>  Location: PIN_AA25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX3[2]	=>  Location: PIN_AA26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX3[3]	=>  Location: PIN_Y26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX3[4]	=>  Location: PIN_Y25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX3[5]	=>  Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX3[6]	=>  Location: PIN_W24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX4[0]	=>  Location: PIN_U9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX4[1]	=>  Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX4[2]	=>  Location: PIN_U2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX4[3]	=>  Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX4[4]	=>  Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX4[5]	=>  Location: PIN_R6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX4[6]	=>  Location: PIN_T3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX5[0]	=>  Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX5[1]	=>  Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX5[2]	=>  Location: PIN_P7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX5[3]	=>  Location: PIN_T9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX5[4]	=>  Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX5[5]	=>  Location: PIN_R4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX5[6]	=>  Location: PIN_R3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX6[0]	=>  Location: PIN_R2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX6[1]	=>  Location: PIN_P4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX6[2]	=>  Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX6[3]	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX6[4]	=>  Location: PIN_M3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX6[5]	=>  Location: PIN_M5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX6[6]	=>  Location: PIN_M4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX7[0]	=>  Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX7[1]	=>  Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX7[2]	=>  Location: PIN_L9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX7[3]	=>  Location: PIN_L6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX7[4]	=>  Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX7[5]	=>  Location: PIN_P9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- HEX7[6]	=>  Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- SW[4]	=>  Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AD13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_N26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_P25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AE14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF dec_mem IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX6 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX7 : std_logic_vector(6 DOWNTO 0);
SIGNAL \i1|mem~46_combout\ : std_logic;
SIGNAL \i1|mem~47_combout\ : std_logic;
SIGNAL \i1|mem~42_combout\ : std_logic;
SIGNAL \i1|mem~43_combout\ : std_logic;
SIGNAL \i1|mem~44_combout\ : std_logic;
SIGNAL \i1|mem~45_combout\ : std_logic;
SIGNAL \i1|mem~40_combout\ : std_logic;
SIGNAL \i1|mem~41_combout\ : std_logic;
SIGNAL \i2|Mux6~0_combout\ : std_logic;
SIGNAL \i2|Mux5~0_combout\ : std_logic;
SIGNAL \i2|Mux4~0_combout\ : std_logic;
SIGNAL \i2|Mux3~0_combout\ : std_logic;
SIGNAL \i2|Mux2~0_combout\ : std_logic;
SIGNAL \i2|Mux1~0_combout\ : std_logic;
SIGNAL \i2|Mux0~0_combout\ : std_logic;
SIGNAL \i3|Mux6~3_combout\ : std_logic;
SIGNAL \i3|Mux6~12_combout\ : std_logic;
SIGNAL \i3|Mux5~4_combout\ : std_logic;
SIGNAL \i3|Mux5~9_combout\ : std_logic;
SIGNAL \i3|Mux4~4_combout\ : std_logic;
SIGNAL \i3|Mux4~9_combout\ : std_logic;
SIGNAL \i3|Mux3~4_combout\ : std_logic;
SIGNAL \i3|Mux3~9_combout\ : std_logic;
SIGNAL \i3|Mux2~3_combout\ : std_logic;
SIGNAL \i3|Mux2~12_combout\ : std_logic;
SIGNAL \i3|Mux1~3_combout\ : std_logic;
SIGNAL \i3|Mux1~15_combout\ : std_logic;
SIGNAL \i3|Mux0~4_combout\ : std_logic;
SIGNAL \i3|Mux0~9_combout\ : std_logic;
SIGNAL \i4|Mux6~4_combout\ : std_logic;
SIGNAL \i4|Mux6~9_combout\ : std_logic;
SIGNAL \i4|Mux5~4_combout\ : std_logic;
SIGNAL \i4|Mux5~9_combout\ : std_logic;
SIGNAL \i4|Mux4~4_combout\ : std_logic;
SIGNAL \i4|Mux4~9_combout\ : std_logic;
SIGNAL \i4|Mux3~4_combout\ : std_logic;
SIGNAL \i4|Mux3~9_combout\ : std_logic;
SIGNAL \i4|Mux2~3_combout\ : std_logic;
SIGNAL \i4|Mux2~12_combout\ : std_logic;
SIGNAL \i4|Mux1~3_combout\ : std_logic;
SIGNAL \i4|Mux1~12_combout\ : std_logic;
SIGNAL \i4|Mux0~4_combout\ : std_logic;
SIGNAL \i4|Mux0~9_combout\ : std_logic;
SIGNAL \i5|Mux6~3_combout\ : std_logic;
SIGNAL \i5|Mux6~12_combout\ : std_logic;
SIGNAL \i5|Mux5~4_combout\ : std_logic;
SIGNAL \i5|Mux5~9_combout\ : std_logic;
SIGNAL \i5|Mux4~4_combout\ : std_logic;
SIGNAL \i5|Mux4~9_combout\ : std_logic;
SIGNAL \i5|Mux3~4_combout\ : std_logic;
SIGNAL \i5|Mux3~9_combout\ : std_logic;
SIGNAL \i5|Mux2~3_combout\ : std_logic;
SIGNAL \i5|Mux2~15_combout\ : std_logic;
SIGNAL \i5|Mux1~4_combout\ : std_logic;
SIGNAL \i5|Mux1~9_combout\ : std_logic;
SIGNAL \i5|Mux0~4_combout\ : std_logic;
SIGNAL \i5|Mux0~9_combout\ : std_logic;
SIGNAL \i1|mem~52_combout\ : std_logic;
SIGNAL \i1|mem~53_combout\ : std_logic;
SIGNAL \i1|mem~54_combout\ : std_logic;
SIGNAL \i1|mem~55_combout\ : std_logic;
SIGNAL \i1|mem~48_combout\ : std_logic;
SIGNAL \i1|mem~49_combout\ : std_logic;
SIGNAL \i1|mem~50_combout\ : std_logic;
SIGNAL \i1|mem~51_combout\ : std_logic;
SIGNAL \i6|Mux6~0_combout\ : std_logic;
SIGNAL \i6|Mux5~0_combout\ : std_logic;
SIGNAL \i6|Mux4~0_combout\ : std_logic;
SIGNAL \i6|Mux3~0_combout\ : std_logic;
SIGNAL \i6|Mux2~0_combout\ : std_logic;
SIGNAL \i6|Mux1~0_combout\ : std_logic;
SIGNAL \i6|Mux0~0_combout\ : std_logic;
SIGNAL \i7|Mux6~4_combout\ : std_logic;
SIGNAL \i7|Mux6~9_combout\ : std_logic;
SIGNAL \i7|Mux4~4_combout\ : std_logic;
SIGNAL \i7|Mux4~9_combout\ : std_logic;
SIGNAL \i7|Mux3~4_combout\ : std_logic;
SIGNAL \i7|Mux3~9_combout\ : std_logic;
SIGNAL \i7|Mux2~3_combout\ : std_logic;
SIGNAL \i7|Mux2~12_combout\ : std_logic;
SIGNAL \i7|Mux1~4_combout\ : std_logic;
SIGNAL \i7|Mux1~9_combout\ : std_logic;
SIGNAL \i7|Mux0~4_combout\ : std_logic;
SIGNAL \i7|Mux0~9_combout\ : std_logic;
SIGNAL \i8|Mux6~3_combout\ : std_logic;
SIGNAL \i8|Mux6~12_combout\ : std_logic;
SIGNAL \i8|Mux5~4_combout\ : std_logic;
SIGNAL \i8|Mux5~9_combout\ : std_logic;
SIGNAL \i8|Mux4~4_combout\ : std_logic;
SIGNAL \i8|Mux4~9_combout\ : std_logic;
SIGNAL \i8|Mux3~4_combout\ : std_logic;
SIGNAL \i8|Mux3~9_combout\ : std_logic;
SIGNAL \i8|Mux2~3_combout\ : std_logic;
SIGNAL \i8|Mux2~12_combout\ : std_logic;
SIGNAL \i8|Mux1~3_combout\ : std_logic;
SIGNAL \i8|Mux1~15_combout\ : std_logic;
SIGNAL \i8|Mux0~4_combout\ : std_logic;
SIGNAL \i8|Mux0~9_combout\ : std_logic;
SIGNAL \i1|mem~58_combout\ : std_logic;
SIGNAL \i1|mem~59_combout\ : std_logic;
SIGNAL \i1|mem~56_combout\ : std_logic;
SIGNAL \i1|mem~57_combout\ : std_logic;
SIGNAL \i1|mem~60_combout\ : std_logic;
SIGNAL \i1|mem~61_combout\ : std_logic;
SIGNAL \i1|mem~62_combout\ : std_logic;
SIGNAL \i1|mem~63_combout\ : std_logic;
SIGNAL \i9|Mux6~0_combout\ : std_logic;
SIGNAL \i9|Mux5~0_combout\ : std_logic;
SIGNAL \i9|Mux4~0_combout\ : std_logic;
SIGNAL \i9|Mux3~0_combout\ : std_logic;
SIGNAL \i9|Mux2~0_combout\ : std_logic;
SIGNAL \i9|Mux1~0_combout\ : std_logic;
SIGNAL \i9|Mux0~0_combout\ : std_logic;
SIGNAL \SW~combout\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \i8|ALT_INV_Mux0~9_combout\ : std_logic;
SIGNAL \i7|ALT_INV_Mux0~9_combout\ : std_logic;
SIGNAL \i5|ALT_INV_Mux0~9_combout\ : std_logic;
SIGNAL \i4|ALT_INV_Mux0~9_combout\ : std_logic;
SIGNAL \i3|ALT_INV_Mux0~9_combout\ : std_logic;
SIGNAL \i9|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \i6|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \i2|ALT_INV_Mux0~0_combout\ : std_logic;

BEGIN

ww_SW <= SW;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
HEX2 <= ww_HEX2;
HEX3 <= ww_HEX3;
HEX4 <= ww_HEX4;
HEX5 <= ww_HEX5;
HEX6 <= ww_HEX6;
HEX7 <= ww_HEX7;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\i8|ALT_INV_Mux0~9_combout\ <= NOT \i8|Mux0~9_combout\;
\i7|ALT_INV_Mux0~9_combout\ <= NOT \i7|Mux0~9_combout\;
\i5|ALT_INV_Mux0~9_combout\ <= NOT \i5|Mux0~9_combout\;
\i4|ALT_INV_Mux0~9_combout\ <= NOT \i4|Mux0~9_combout\;
\i3|ALT_INV_Mux0~9_combout\ <= NOT \i3|Mux0~9_combout\;
\i9|ALT_INV_Mux0~0_combout\ <= NOT \i9|Mux0~0_combout\;
\i6|ALT_INV_Mux0~0_combout\ <= NOT \i6|Mux0~0_combout\;
\i2|ALT_INV_Mux0~0_combout\ <= NOT \i2|Mux0~0_combout\;

-- Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_SW(4),
	combout => \SW~combout\(4));

-- Location: PIN_AD13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_SW(5),
	combout => \SW~combout\(5));

-- Location: PIN_AE14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_SW(3),
	combout => \SW~combout\(3));

-- Location: PIN_N26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_SW(1),
	combout => \SW~combout\(1));

-- Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_SW(0),
	combout => \SW~combout\(0));

-- Location: LCCOMB_X57_Y7_N26
\i1|mem~46\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~46_combout\ = (!\SW~combout\(3) & ((\SW~combout\(2) & ((!\SW~combout\(0)))) # (!\SW~combout\(2) & (\SW~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(2),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(0),
	combout => \i1|mem~46_combout\);

-- Location: LCCOMB_X28_Y3_N6
\i1|mem~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~47_combout\ = (\SW~combout\(6)) # ((\SW~combout\(4)) # ((\SW~combout\(5)) # (!\i1|mem~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \SW~combout\(4),
	datac => \SW~combout\(5),
	datad => \i1|mem~46_combout\,
	combout => \i1|mem~47_combout\);

-- Location: LCCOMB_X57_Y7_N8
\i1|mem~42\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~42_combout\ = (\SW~combout\(2) & ((\SW~combout\(0) & ((!\SW~combout\(1)))) # (!\SW~combout\(0) & (!\SW~combout\(3))))) # (!\SW~combout\(2) & (\SW~combout\(1) & ((\SW~combout\(3)) # (!\SW~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(2),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(0),
	combout => \i1|mem~42_combout\);

-- Location: LCCOMB_X28_Y3_N2
\i1|mem~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~43_combout\ = (\SW~combout\(6)) # ((\SW~combout\(4)) # ((\SW~combout\(5)) # (!\i1|mem~42_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \SW~combout\(4),
	datac => \SW~combout\(5),
	datad => \i1|mem~42_combout\,
	combout => \i1|mem~43_combout\);

-- Location: PIN_P25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_SW(2),
	combout => \SW~combout\(2));

-- Location: LCCOMB_X64_Y7_N2
\i1|mem~44\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~44_combout\ = (\SW~combout\(0) & ((\SW~combout\(3) & ((\SW~combout\(1)) # (\SW~combout\(2)))) # (!\SW~combout\(3) & ((!\SW~combout\(2)))))) # (!\SW~combout\(0) & ((\SW~combout\(1)) # ((!\SW~combout\(3) & \SW~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(0),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i1|mem~44_combout\);

-- Location: LCCOMB_X28_Y3_N28
\i1|mem~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~45_combout\ = (\SW~combout\(6)) # ((\SW~combout\(4)) # ((\SW~combout\(5)) # (\i1|mem~44_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \SW~combout\(4),
	datac => \SW~combout\(5),
	datad => \i1|mem~44_combout\,
	combout => \i1|mem~45_combout\);

-- Location: LCCOMB_X64_Y7_N16
\i1|mem~40\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~40_combout\ = (\SW~combout\(1) & (!\SW~combout\(2) & ((\SW~combout\(0)) # (\SW~combout\(3))))) # (!\SW~combout\(1) & ((\SW~combout\(0) & (\SW~combout\(3))) # (!\SW~combout\(0) & ((\SW~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110111101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(0),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i1|mem~40_combout\);

-- Location: LCCOMB_X28_Y3_N0
\i1|mem~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~41_combout\ = (\SW~combout\(6)) # ((\SW~combout\(4)) # ((\SW~combout\(5)) # (!\i1|mem~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \SW~combout\(4),
	datac => \SW~combout\(5),
	datad => \i1|mem~40_combout\,
	combout => \i1|mem~41_combout\);

-- Location: LCCOMB_X28_Y3_N24
\i2|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2|Mux6~0_combout\ = (\i1|mem~47_combout\ & (\i1|mem~41_combout\ & (\i1|mem~43_combout\ $ (\i1|mem~45_combout\)))) # (!\i1|mem~47_combout\ & (!\i1|mem~43_combout\ & (\i1|mem~45_combout\ $ (\i1|mem~41_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~47_combout\,
	datab => \i1|mem~43_combout\,
	datac => \i1|mem~45_combout\,
	datad => \i1|mem~41_combout\,
	combout => \i2|Mux6~0_combout\);

-- Location: LCCOMB_X28_Y3_N26
\i2|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2|Mux5~0_combout\ = (\i1|mem~47_combout\ & ((\i1|mem~41_combout\ & (\i1|mem~43_combout\)) # (!\i1|mem~41_combout\ & ((\i1|mem~45_combout\))))) # (!\i1|mem~47_combout\ & (\i1|mem~45_combout\ & (\i1|mem~43_combout\ $ (\i1|mem~41_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~47_combout\,
	datab => \i1|mem~43_combout\,
	datac => \i1|mem~45_combout\,
	datad => \i1|mem~41_combout\,
	combout => \i2|Mux5~0_combout\);

-- Location: LCCOMB_X28_Y3_N20
\i2|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2|Mux4~0_combout\ = (\i1|mem~47_combout\ & (\i1|mem~45_combout\ & ((\i1|mem~43_combout\) # (!\i1|mem~41_combout\)))) # (!\i1|mem~47_combout\ & (\i1|mem~43_combout\ & (!\i1|mem~45_combout\ & !\i1|mem~41_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~47_combout\,
	datab => \i1|mem~43_combout\,
	datac => \i1|mem~45_combout\,
	datad => \i1|mem~41_combout\,
	combout => \i2|Mux4~0_combout\);

-- Location: LCCOMB_X28_Y3_N22
\i2|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2|Mux3~0_combout\ = (\i1|mem~43_combout\ & ((\i1|mem~45_combout\ & ((\i1|mem~41_combout\))) # (!\i1|mem~45_combout\ & (\i1|mem~47_combout\ & !\i1|mem~41_combout\)))) # (!\i1|mem~43_combout\ & (!\i1|mem~47_combout\ & (\i1|mem~45_combout\ $ 
-- (\i1|mem~41_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~47_combout\,
	datab => \i1|mem~43_combout\,
	datac => \i1|mem~45_combout\,
	datad => \i1|mem~41_combout\,
	combout => \i2|Mux3~0_combout\);

-- Location: LCCOMB_X28_Y3_N8
\i2|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2|Mux2~0_combout\ = (\i1|mem~43_combout\ & (!\i1|mem~47_combout\ & ((\i1|mem~41_combout\)))) # (!\i1|mem~43_combout\ & ((\i1|mem~45_combout\ & (!\i1|mem~47_combout\)) # (!\i1|mem~45_combout\ & ((\i1|mem~41_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~47_combout\,
	datab => \i1|mem~43_combout\,
	datac => \i1|mem~45_combout\,
	datad => \i1|mem~41_combout\,
	combout => \i2|Mux2~0_combout\);

-- Location: LCCOMB_X28_Y3_N18
\i2|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2|Mux1~0_combout\ = (\i1|mem~43_combout\ & (!\i1|mem~47_combout\ & ((\i1|mem~41_combout\) # (!\i1|mem~45_combout\)))) # (!\i1|mem~43_combout\ & (\i1|mem~41_combout\ & (\i1|mem~47_combout\ $ (!\i1|mem~45_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~47_combout\,
	datab => \i1|mem~43_combout\,
	datac => \i1|mem~45_combout\,
	datad => \i1|mem~41_combout\,
	combout => \i2|Mux1~0_combout\);

-- Location: LCCOMB_X28_Y3_N12
\i2|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i2|Mux0~0_combout\ = (\i1|mem~41_combout\ & ((\i1|mem~47_combout\) # (\i1|mem~43_combout\ $ (\i1|mem~45_combout\)))) # (!\i1|mem~41_combout\ & ((\i1|mem~43_combout\) # (\i1|mem~47_combout\ $ (\i1|mem~45_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~47_combout\,
	datab => \i1|mem~43_combout\,
	datac => \i1|mem~45_combout\,
	datad => \i1|mem~41_combout\,
	combout => \i2|Mux0~0_combout\);

-- Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\SW[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_SW(6),
	combout => \SW~combout\(6));

-- Location: LCCOMB_X4_Y13_N30
\i3|Mux6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i3|Mux6~3_combout\ = (!\SW~combout\(3) & ((\SW~combout\(1) & ((!\SW~combout\(2)))) # (!\SW~combout\(1) & (!\SW~combout\(0) & \SW~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(3),
	datab => \SW~combout\(0),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i3|Mux6~3_combout\);

-- Location: LCCOMB_X4_Y13_N20
\i3|Mux6~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \i3|Mux6~12_combout\ = (!\SW~combout\(6) & (\i3|Mux6~3_combout\ & (!\SW~combout\(5) & !\SW~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \i3|Mux6~3_combout\,
	datac => \SW~combout\(5),
	datad => \SW~combout\(4),
	combout => \i3|Mux6~12_combout\);

-- Location: LCCOMB_X57_Y7_N28
\i3|Mux5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i3|Mux5~4_combout\ = (\SW~combout\(2) & (((\SW~combout\(1))))) # (!\SW~combout\(2) & ((\SW~combout\(3)) # ((!\SW~combout\(1) & \SW~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(2),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(0),
	combout => \i3|Mux5~4_combout\);

-- Location: LCCOMB_X57_Y7_N6
\i3|Mux5~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i3|Mux5~9_combout\ = (\SW~combout\(6)) # ((\SW~combout\(4)) # ((\SW~combout\(5)) # (\i3|Mux5~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \SW~combout\(4),
	datac => \SW~combout\(5),
	datad => \i3|Mux5~4_combout\,
	combout => \i3|Mux5~9_combout\);

-- Location: LCCOMB_X57_Y7_N0
\i3|Mux4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i3|Mux4~4_combout\ = (\SW~combout\(2) & (\SW~combout\(1) & ((\SW~combout\(3)) # (!\SW~combout\(0))))) # (!\SW~combout\(2) & ((\SW~combout\(3)) # ((!\SW~combout\(1) & \SW~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(2),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(0),
	combout => \i3|Mux4~4_combout\);

-- Location: LCCOMB_X57_Y7_N18
\i3|Mux4~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i3|Mux4~9_combout\ = (\SW~combout\(6)) # ((\SW~combout\(4)) # ((\SW~combout\(5)) # (\i3|Mux4~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \SW~combout\(4),
	datac => \SW~combout\(5),
	datad => \i3|Mux4~4_combout\,
	combout => \i3|Mux4~9_combout\);

-- Location: LCCOMB_X57_Y7_N12
\i3|Mux3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i3|Mux3~4_combout\ = (\SW~combout\(2) & ((\SW~combout\(3)) # ((!\SW~combout\(1) & !\SW~combout\(0))))) # (!\SW~combout\(2) & ((\SW~combout\(0) & ((\SW~combout\(1)))) # (!\SW~combout\(0) & (!\SW~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010011011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(2),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(0),
	combout => \i3|Mux3~4_combout\);

-- Location: LCCOMB_X57_Y7_N22
\i3|Mux3~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i3|Mux3~9_combout\ = (\SW~combout\(6)) # ((\SW~combout\(4)) # ((\SW~combout\(5)) # (\i3|Mux3~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \SW~combout\(4),
	datac => \SW~combout\(5),
	datad => \i3|Mux3~4_combout\,
	combout => \i3|Mux3~9_combout\);

-- Location: LCCOMB_X4_Y13_N10
\i3|Mux2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i3|Mux2~3_combout\ = (!\SW~combout\(3) & (\SW~combout\(1) $ (((!\SW~combout\(0) & \SW~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(3),
	datab => \SW~combout\(0),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i3|Mux2~3_combout\);

-- Location: LCCOMB_X4_Y13_N16
\i3|Mux2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \i3|Mux2~12_combout\ = (\i3|Mux2~3_combout\ & (!\SW~combout\(5) & (!\SW~combout\(6) & !\SW~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i3|Mux2~3_combout\,
	datab => \SW~combout\(5),
	datac => \SW~combout\(6),
	datad => \SW~combout\(4),
	combout => \i3|Mux2~12_combout\);

-- Location: LCCOMB_X64_Y7_N6
\i3|Mux1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i3|Mux1~3_combout\ = (!\SW~combout\(0) & (!\SW~combout\(3) & (!\SW~combout\(1) & \SW~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(0),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i3|Mux1~3_combout\);

-- Location: LCCOMB_X64_Y7_N12
\i3|Mux1~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \i3|Mux1~15_combout\ = (!\SW~combout\(6) & (!\SW~combout\(4) & (!\SW~combout\(5) & \i3|Mux1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \SW~combout\(4),
	datac => \SW~combout\(5),
	datad => \i3|Mux1~3_combout\,
	combout => \i3|Mux1~15_combout\);

-- Location: LCCOMB_X4_Y13_N0
\i3|Mux0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i3|Mux0~4_combout\ = (\SW~combout\(3) & (((\SW~combout\(1)) # (\SW~combout\(2))) # (!\SW~combout\(0)))) # (!\SW~combout\(3) & ((\SW~combout\(0)) # ((!\SW~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(3),
	datab => \SW~combout\(0),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i3|Mux0~4_combout\);

-- Location: LCCOMB_X4_Y13_N26
\i3|Mux0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i3|Mux0~9_combout\ = (\SW~combout\(6)) # ((\i3|Mux0~4_combout\) # ((\SW~combout\(5)) # (\SW~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \i3|Mux0~4_combout\,
	datac => \SW~combout\(5),
	datad => \SW~combout\(4),
	combout => \i3|Mux0~9_combout\);

-- Location: LCCOMB_X64_Y7_N8
\i4|Mux6~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i4|Mux6~4_combout\ = (\SW~combout\(0) & (!\SW~combout\(3) & (\SW~combout\(1) & \SW~combout\(2)))) # (!\SW~combout\(0) & (((!\SW~combout\(1) & !\SW~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(0),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i4|Mux6~4_combout\);

-- Location: LCCOMB_X64_Y7_N18
\i4|Mux6~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i4|Mux6~9_combout\ = (!\SW~combout\(6) & (!\SW~combout\(5) & (\i4|Mux6~4_combout\ & !\SW~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \SW~combout\(5),
	datac => \i4|Mux6~4_combout\,
	datad => \SW~combout\(4),
	combout => \i4|Mux6~9_combout\);

-- Location: LCCOMB_X64_Y8_N0
\i4|Mux5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i4|Mux5~4_combout\ = (\SW~combout\(2) & ((\SW~combout\(1)) # ((\SW~combout\(0) & \SW~combout\(3))))) # (!\SW~combout\(2) & (((!\SW~combout\(3)) # (!\SW~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(1),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(2),
	combout => \i4|Mux5~4_combout\);

-- Location: LCCOMB_X64_Y8_N10
\i4|Mux5~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i4|Mux5~9_combout\ = (\SW~combout\(4)) # ((\SW~combout\(6)) # ((\SW~combout\(5)) # (\i4|Mux5~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \SW~combout\(6),
	datac => \SW~combout\(5),
	datad => \i4|Mux5~4_combout\,
	combout => \i4|Mux5~9_combout\);

-- Location: LCCOMB_X64_Y8_N28
\i4|Mux4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i4|Mux4~4_combout\ = (\SW~combout\(1) & (\SW~combout\(3) & ((\SW~combout\(2)) # (!\SW~combout\(0))))) # (!\SW~combout\(1) & (\SW~combout\(0) & (\SW~combout\(3) $ (!\SW~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(1),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(2),
	combout => \i4|Mux4~4_combout\);

-- Location: LCCOMB_X64_Y8_N22
\i4|Mux4~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i4|Mux4~9_combout\ = (\SW~combout\(4)) # ((\SW~combout\(6)) # ((\SW~combout\(5)) # (\i4|Mux4~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \SW~combout\(6),
	datac => \SW~combout\(5),
	datad => \i4|Mux4~4_combout\,
	combout => \i4|Mux4~9_combout\);

-- Location: LCCOMB_X64_Y8_N8
\i4|Mux3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i4|Mux3~4_combout\ = (\SW~combout\(1) & (\SW~combout\(3) & ((\SW~combout\(0)) # (\SW~combout\(2))))) # (!\SW~combout\(1) & (\SW~combout\(0) $ (((\SW~combout\(3) & \SW~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(1),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(2),
	combout => \i4|Mux3~4_combout\);

-- Location: LCCOMB_X64_Y8_N26
\i4|Mux3~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i4|Mux3~9_combout\ = (\SW~combout\(4)) # ((\SW~combout\(5)) # ((\i4|Mux3~4_combout\) # (\SW~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \SW~combout\(5),
	datac => \i4|Mux3~4_combout\,
	datad => \SW~combout\(6),
	combout => \i4|Mux3~9_combout\);

-- Location: LCCOMB_X64_Y8_N30
\i4|Mux2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i4|Mux2~3_combout\ = (!\SW~combout\(3) & ((\SW~combout\(1) & ((!\SW~combout\(2)) # (!\SW~combout\(0)))) # (!\SW~combout\(1) & ((\SW~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(1),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(2),
	combout => \i4|Mux2~3_combout\);

-- Location: LCCOMB_X64_Y8_N12
\i4|Mux2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \i4|Mux2~12_combout\ = (!\SW~combout\(4) & (!\SW~combout\(6) & (!\SW~combout\(5) & \i4|Mux2~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \SW~combout\(6),
	datac => \SW~combout\(5),
	datad => \i4|Mux2~3_combout\,
	combout => \i4|Mux2~12_combout\);

-- Location: LCCOMB_X57_Y7_N2
\i4|Mux1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i4|Mux1~3_combout\ = (\SW~combout\(2) & (!\SW~combout\(1) & !\SW~combout\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(2),
	datab => \SW~combout\(1),
	datac => \SW~combout\(3),
	combout => \i4|Mux1~3_combout\);

-- Location: LCCOMB_X57_Y7_N16
\i4|Mux1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \i4|Mux1~12_combout\ = (!\SW~combout\(6) & (!\SW~combout\(4) & (!\SW~combout\(5) & \i4|Mux1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \SW~combout\(4),
	datac => \SW~combout\(5),
	datad => \i4|Mux1~3_combout\,
	combout => \i4|Mux1~12_combout\);

-- Location: LCCOMB_X64_Y7_N28
\i4|Mux0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i4|Mux0~4_combout\ = (\SW~combout\(0) & ((\SW~combout\(3)) # ((\SW~combout\(1)) # (!\SW~combout\(2))))) # (!\SW~combout\(0) & (((\SW~combout\(2)) # (!\SW~combout\(1))) # (!\SW~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(0),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i4|Mux0~4_combout\);

-- Location: LCCOMB_X64_Y7_N30
\i4|Mux0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i4|Mux0~9_combout\ = (\SW~combout\(6)) # ((\SW~combout\(4)) # ((\SW~combout\(5)) # (\i4|Mux0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \SW~combout\(4),
	datac => \SW~combout\(5),
	datad => \i4|Mux0~4_combout\,
	combout => \i4|Mux0~9_combout\);

-- Location: LCCOMB_X64_Y7_N26
\i5|Mux6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i5|Mux6~3_combout\ = (\SW~combout\(0) & ((\SW~combout\(3) & (!\SW~combout\(1) & \SW~combout\(2))) # (!\SW~combout\(3) & (\SW~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(0),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i5|Mux6~3_combout\);

-- Location: LCCOMB_X64_Y7_N24
\i5|Mux6~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \i5|Mux6~12_combout\ = (!\SW~combout\(6) & (!\SW~combout\(4) & (!\SW~combout\(5) & \i5|Mux6~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \SW~combout\(4),
	datac => \SW~combout\(5),
	datad => \i5|Mux6~3_combout\,
	combout => \i5|Mux6~12_combout\);

-- Location: LCCOMB_X64_Y8_N24
\i5|Mux5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i5|Mux5~4_combout\ = (\SW~combout\(1) & (((\SW~combout\(3))) # (!\SW~combout\(0)))) # (!\SW~combout\(1) & ((\SW~combout\(0) & ((!\SW~combout\(2)))) # (!\SW~combout\(0) & (\SW~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001011110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(1),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(2),
	combout => \i5|Mux5~4_combout\);

-- Location: LCCOMB_X64_Y8_N2
\i5|Mux5~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i5|Mux5~9_combout\ = (\i5|Mux5~4_combout\) # ((\SW~combout\(5)) # ((\SW~combout\(4)) # (\SW~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i5|Mux5~4_combout\,
	datab => \SW~combout\(5),
	datac => \SW~combout\(4),
	datad => \SW~combout\(6),
	combout => \i5|Mux5~9_combout\);

-- Location: LCCOMB_X64_Y8_N20
\i5|Mux4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i5|Mux4~4_combout\ = (\SW~combout\(1) & (((\SW~combout\(3))))) # (!\SW~combout\(1) & ((\SW~combout\(0) & ((!\SW~combout\(2)))) # (!\SW~combout\(0) & ((\SW~combout\(3)) # (\SW~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(1),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(2),
	combout => \i5|Mux4~4_combout\);

-- Location: LCCOMB_X64_Y8_N14
\i5|Mux4~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i5|Mux4~9_combout\ = (\i5|Mux4~4_combout\) # ((\SW~combout\(5)) # ((\SW~combout\(4)) # (\SW~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i5|Mux4~4_combout\,
	datab => \SW~combout\(5),
	datac => \SW~combout\(4),
	datad => \SW~combout\(6),
	combout => \i5|Mux4~9_combout\);

-- Location: LCCOMB_X64_Y8_N16
\i5|Mux3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i5|Mux3~4_combout\ = (\SW~combout\(1) & ((\SW~combout\(3) & ((\SW~combout\(2)))) # (!\SW~combout\(3) & (\SW~combout\(0))))) # (!\SW~combout\(1) & (!\SW~combout\(0) & (!\SW~combout\(3) & !\SW~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(1),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(2),
	combout => \i5|Mux3~4_combout\);

-- Location: LCCOMB_X64_Y8_N18
\i5|Mux3~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i5|Mux3~9_combout\ = (\i5|Mux3~4_combout\) # ((\SW~combout\(5)) # ((\SW~combout\(4)) # (\SW~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i5|Mux3~4_combout\,
	datab => \SW~combout\(5),
	datac => \SW~combout\(4),
	datad => \SW~combout\(6),
	combout => \i5|Mux3~9_combout\);

-- Location: LCCOMB_X64_Y8_N6
\i5|Mux2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i5|Mux2~3_combout\ = (\SW~combout\(0) & (!\SW~combout\(3) & ((\SW~combout\(1)) # (\SW~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(1),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(2),
	combout => \i5|Mux2~3_combout\);

-- Location: LCCOMB_X64_Y8_N4
\i5|Mux2~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \i5|Mux2~15_combout\ = (\i5|Mux2~3_combout\ & (!\SW~combout\(5) & (!\SW~combout\(4) & !\SW~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i5|Mux2~3_combout\,
	datab => \SW~combout\(5),
	datac => \SW~combout\(4),
	datad => \SW~combout\(6),
	combout => \i5|Mux2~15_combout\);

-- Location: LCCOMB_X64_Y7_N0
\i5|Mux1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i5|Mux1~4_combout\ = (\SW~combout\(1) & (\SW~combout\(0) & (!\SW~combout\(3) & !\SW~combout\(2)))) # (!\SW~combout\(1) & (\SW~combout\(2) & (\SW~combout\(0) $ (!\SW~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(0),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i5|Mux1~4_combout\);

-- Location: LCCOMB_X64_Y7_N10
\i5|Mux1~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i5|Mux1~9_combout\ = (!\SW~combout\(6) & (!\SW~combout\(4) & (!\SW~combout\(5) & \i5|Mux1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \SW~combout\(4),
	datac => \SW~combout\(5),
	datad => \i5|Mux1~4_combout\,
	combout => \i5|Mux1~9_combout\);

-- Location: LCCOMB_X64_Y7_N20
\i5|Mux0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i5|Mux0~4_combout\ = (\SW~combout\(1) & (((\SW~combout\(2))) # (!\SW~combout\(0)))) # (!\SW~combout\(1) & ((\SW~combout\(0) $ (!\SW~combout\(2))) # (!\SW~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(0),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i5|Mux0~4_combout\);

-- Location: LCCOMB_X64_Y7_N22
\i5|Mux0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i5|Mux0~9_combout\ = (\SW~combout\(6)) # ((\SW~combout\(5)) # ((\i5|Mux0~4_combout\) # (\SW~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \SW~combout\(5),
	datac => \i5|Mux0~4_combout\,
	datad => \SW~combout\(4),
	combout => \i5|Mux0~9_combout\);

-- Location: LCCOMB_X1_Y14_N0
\i1|mem~52\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~52_combout\ = (\SW~combout\(0) & (\SW~combout\(3) $ ((!\SW~combout\(1))))) # (!\SW~combout\(0) & ((\SW~combout\(2) & (\SW~combout\(3))) # (!\SW~combout\(2) & ((\SW~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011010110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(3),
	datab => \SW~combout\(0),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i1|mem~52_combout\);

-- Location: LCCOMB_X1_Y14_N10
\i1|mem~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~53_combout\ = (\SW~combout\(4)) # ((\SW~combout\(6)) # ((\SW~combout\(5)) # (\i1|mem~52_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \SW~combout\(6),
	datac => \SW~combout\(5),
	datad => \i1|mem~52_combout\,
	combout => \i1|mem~53_combout\);

-- Location: LCCOMB_X1_Y14_N4
\i1|mem~54\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~54_combout\ = (!\SW~combout\(3) & ((\SW~combout\(0) & (!\SW~combout\(1) & \SW~combout\(2))) # (!\SW~combout\(0) & (\SW~combout\(1) & !\SW~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(3),
	datab => \SW~combout\(0),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i1|mem~54_combout\);

-- Location: LCCOMB_X1_Y14_N30
\i1|mem~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~55_combout\ = (\SW~combout\(4)) # ((\SW~combout\(6)) # ((\SW~combout\(5)) # (!\i1|mem~54_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \SW~combout\(6),
	datac => \SW~combout\(5),
	datad => \i1|mem~54_combout\,
	combout => \i1|mem~55_combout\);

-- Location: LCCOMB_X1_Y14_N8
\i1|mem~48\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~48_combout\ = (\SW~combout\(3) & (\SW~combout\(1) $ (((\SW~combout\(0)) # (\SW~combout\(2)))))) # (!\SW~combout\(3) & ((\SW~combout\(2) & (!\SW~combout\(0))) # (!\SW~combout\(2) & ((\SW~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(3),
	datab => \SW~combout\(0),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i1|mem~48_combout\);

-- Location: LCCOMB_X1_Y14_N2
\i1|mem~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~49_combout\ = (\SW~combout\(5)) # (((\SW~combout\(6)) # (\SW~combout\(4))) # (!\i1|mem~48_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(5),
	datab => \i1|mem~48_combout\,
	datac => \SW~combout\(6),
	datad => \SW~combout\(4),
	combout => \i1|mem~49_combout\);

-- Location: LCCOMB_X1_Y14_N28
\i1|mem~50\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~50_combout\ = (\SW~combout\(3) & (!\SW~combout\(0) & (\SW~combout\(1) & !\SW~combout\(2)))) # (!\SW~combout\(3) & ((\SW~combout\(1) $ (\SW~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(3),
	datab => \SW~combout\(0),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i1|mem~50_combout\);

-- Location: LCCOMB_X1_Y14_N22
\i1|mem~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~51_combout\ = (\SW~combout\(4)) # ((\SW~combout\(6)) # ((\SW~combout\(5)) # (!\i1|mem~50_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \SW~combout\(6),
	datac => \SW~combout\(5),
	datad => \i1|mem~50_combout\,
	combout => \i1|mem~51_combout\);

-- Location: LCCOMB_X1_Y14_N16
\i6|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i6|Mux6~0_combout\ = (\i1|mem~53_combout\ & (!\i1|mem~51_combout\ & (\i1|mem~55_combout\ $ (!\i1|mem~49_combout\)))) # (!\i1|mem~53_combout\ & (\i1|mem~49_combout\ & (\i1|mem~55_combout\ $ (!\i1|mem~51_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~53_combout\,
	datab => \i1|mem~55_combout\,
	datac => \i1|mem~49_combout\,
	datad => \i1|mem~51_combout\,
	combout => \i6|Mux6~0_combout\);

-- Location: LCCOMB_X1_Y14_N18
\i6|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i6|Mux5~0_combout\ = (\i1|mem~55_combout\ & ((\i1|mem~49_combout\ & ((\i1|mem~51_combout\))) # (!\i1|mem~49_combout\ & (\i1|mem~53_combout\)))) # (!\i1|mem~55_combout\ & (\i1|mem~53_combout\ & (\i1|mem~49_combout\ $ (\i1|mem~51_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~53_combout\,
	datab => \i1|mem~55_combout\,
	datac => \i1|mem~49_combout\,
	datad => \i1|mem~51_combout\,
	combout => \i6|Mux5~0_combout\);

-- Location: LCCOMB_X1_Y14_N20
\i6|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i6|Mux4~0_combout\ = (\i1|mem~53_combout\ & (\i1|mem~55_combout\ & ((\i1|mem~51_combout\) # (!\i1|mem~49_combout\)))) # (!\i1|mem~53_combout\ & (!\i1|mem~55_combout\ & (!\i1|mem~49_combout\ & \i1|mem~51_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~53_combout\,
	datab => \i1|mem~55_combout\,
	datac => \i1|mem~49_combout\,
	datad => \i1|mem~51_combout\,
	combout => \i6|Mux4~0_combout\);

-- Location: LCCOMB_X1_Y14_N14
\i6|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i6|Mux3~0_combout\ = (\i1|mem~51_combout\ & ((\i1|mem~53_combout\ & ((\i1|mem~49_combout\))) # (!\i1|mem~53_combout\ & (\i1|mem~55_combout\ & !\i1|mem~49_combout\)))) # (!\i1|mem~51_combout\ & (!\i1|mem~55_combout\ & (\i1|mem~53_combout\ $ 
-- (\i1|mem~49_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~53_combout\,
	datab => \i1|mem~55_combout\,
	datac => \i1|mem~49_combout\,
	datad => \i1|mem~51_combout\,
	combout => \i6|Mux3~0_combout\);

-- Location: LCCOMB_X1_Y14_N24
\i6|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i6|Mux2~0_combout\ = (\i1|mem~51_combout\ & (((!\i1|mem~55_combout\ & \i1|mem~49_combout\)))) # (!\i1|mem~51_combout\ & ((\i1|mem~53_combout\ & (!\i1|mem~55_combout\)) # (!\i1|mem~53_combout\ & ((\i1|mem~49_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~53_combout\,
	datab => \i1|mem~55_combout\,
	datac => \i1|mem~49_combout\,
	datad => \i1|mem~51_combout\,
	combout => \i6|Mux2~0_combout\);

-- Location: LCCOMB_X1_Y14_N26
\i6|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i6|Mux1~0_combout\ = (\i1|mem~53_combout\ & (\i1|mem~49_combout\ & (\i1|mem~55_combout\ $ (\i1|mem~51_combout\)))) # (!\i1|mem~53_combout\ & (!\i1|mem~55_combout\ & ((\i1|mem~49_combout\) # (\i1|mem~51_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~53_combout\,
	datab => \i1|mem~55_combout\,
	datac => \i1|mem~49_combout\,
	datad => \i1|mem~51_combout\,
	combout => \i6|Mux1~0_combout\);

-- Location: LCCOMB_X1_Y14_N12
\i6|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i6|Mux0~0_combout\ = (\i1|mem~49_combout\ & ((\i1|mem~55_combout\) # (\i1|mem~53_combout\ $ (\i1|mem~51_combout\)))) # (!\i1|mem~49_combout\ & ((\i1|mem~51_combout\) # (\i1|mem~53_combout\ $ (\i1|mem~55_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~53_combout\,
	datab => \i1|mem~55_combout\,
	datac => \i1|mem~49_combout\,
	datad => \i1|mem~51_combout\,
	combout => \i6|Mux0~0_combout\);

-- Location: LCCOMB_X64_Y7_N4
\i7|Mux6~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i7|Mux6~4_combout\ = (\SW~combout\(0) & (((!\SW~combout\(1) & \SW~combout\(2))))) # (!\SW~combout\(0) & (!\SW~combout\(3) & (\SW~combout\(1) & !\SW~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(0),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i7|Mux6~4_combout\);

-- Location: LCCOMB_X64_Y7_N14
\i7|Mux6~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i7|Mux6~9_combout\ = (!\SW~combout\(6) & (!\SW~combout\(5) & (\i7|Mux6~4_combout\ & !\SW~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \SW~combout\(5),
	datac => \i7|Mux6~4_combout\,
	datad => \SW~combout\(4),
	combout => \i7|Mux6~9_combout\);

-- Location: LCCOMB_X1_Y16_N0
\i7|Mux4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i7|Mux4~4_combout\ = (\SW~combout\(1) & (((\SW~combout\(3))))) # (!\SW~combout\(1) & (!\SW~combout\(2) & ((\SW~combout\(0)) # (\SW~combout\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(2),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(1),
	combout => \i7|Mux4~4_combout\);

-- Location: LCCOMB_X1_Y16_N18
\i7|Mux4~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i7|Mux4~9_combout\ = (\SW~combout\(4)) # ((\SW~combout\(5)) # ((\SW~combout\(6)) # (\i7|Mux4~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \SW~combout\(5),
	datac => \SW~combout\(6),
	datad => \i7|Mux4~4_combout\,
	combout => \i7|Mux4~9_combout\);

-- Location: LCCOMB_X1_Y16_N4
\i7|Mux3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i7|Mux3~4_combout\ = (\SW~combout\(2) & ((\SW~combout\(3) & ((\SW~combout\(1)) # (!\SW~combout\(0)))) # (!\SW~combout\(3) & ((!\SW~combout\(1)))))) # (!\SW~combout\(2) & (!\SW~combout\(3) & ((\SW~combout\(1)) # (!\SW~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(2),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(1),
	combout => \i7|Mux3~4_combout\);

-- Location: LCCOMB_X1_Y16_N30
\i7|Mux3~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i7|Mux3~9_combout\ = (\SW~combout\(4)) # ((\SW~combout\(5)) # ((\SW~combout\(6)) # (\i7|Mux3~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \SW~combout\(5),
	datac => \SW~combout\(6),
	datad => \i7|Mux3~4_combout\,
	combout => \i7|Mux3~9_combout\);

-- Location: LCCOMB_X4_Y13_N22
\i7|Mux2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i7|Mux2~3_combout\ = (!\SW~combout\(3) & ((\SW~combout\(1)) # (\SW~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i7|Mux2~3_combout\);

-- Location: LCCOMB_X4_Y13_N28
\i7|Mux2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \i7|Mux2~12_combout\ = (!\SW~combout\(6) & (\i7|Mux2~3_combout\ & (!\SW~combout\(5) & !\SW~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \i7|Mux2~3_combout\,
	datac => \SW~combout\(5),
	datad => \SW~combout\(4),
	combout => \i7|Mux2~12_combout\);

-- Location: LCCOMB_X1_Y16_N16
\i7|Mux1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i7|Mux1~4_combout\ = (\SW~combout\(2) & (!\SW~combout\(1) & (\SW~combout\(0) $ (!\SW~combout\(3))))) # (!\SW~combout\(2) & (((!\SW~combout\(3) & \SW~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(2),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(1),
	combout => \i7|Mux1~4_combout\);

-- Location: LCCOMB_X1_Y16_N2
\i7|Mux1~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i7|Mux1~9_combout\ = (!\SW~combout\(4) & (!\SW~combout\(5) & (!\SW~combout\(6) & \i7|Mux1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \SW~combout\(5),
	datac => \SW~combout\(6),
	datad => \i7|Mux1~4_combout\,
	combout => \i7|Mux1~9_combout\);

-- Location: LCCOMB_X1_Y16_N28
\i7|Mux0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i7|Mux0~4_combout\ = (\SW~combout\(2) & ((\SW~combout\(0)) # ((\SW~combout\(3)) # (\SW~combout\(1))))) # (!\SW~combout\(2) & ((\SW~combout\(3) & (!\SW~combout\(0))) # (!\SW~combout\(3) & ((!\SW~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(2),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(1),
	combout => \i7|Mux0~4_combout\);

-- Location: LCCOMB_X1_Y16_N14
\i7|Mux0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i7|Mux0~9_combout\ = (\SW~combout\(4)) # ((\SW~combout\(5)) # ((\SW~combout\(6)) # (\i7|Mux0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \SW~combout\(5),
	datac => \SW~combout\(6),
	datad => \i7|Mux0~4_combout\,
	combout => \i7|Mux0~9_combout\);

-- Location: LCCOMB_X4_Y13_N6
\i8|Mux6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i8|Mux6~3_combout\ = (!\SW~combout\(0) & ((\SW~combout\(1) & (!\SW~combout\(3) & \SW~combout\(2))) # (!\SW~combout\(1) & ((!\SW~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(3),
	datab => \SW~combout\(0),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i8|Mux6~3_combout\);

-- Location: LCCOMB_X4_Y13_N12
\i8|Mux6~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \i8|Mux6~12_combout\ = (\i8|Mux6~3_combout\ & (!\SW~combout\(5) & (!\SW~combout\(6) & !\SW~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i8|Mux6~3_combout\,
	datab => \SW~combout\(5),
	datac => \SW~combout\(6),
	datad => \SW~combout\(4),
	combout => \i8|Mux6~12_combout\);

-- Location: LCCOMB_X1_Y16_N24
\i8|Mux5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i8|Mux5~4_combout\ = (\SW~combout\(0) & (((\SW~combout\(2) & \SW~combout\(1))) # (!\SW~combout\(3)))) # (!\SW~combout\(0) & ((\SW~combout\(3)) # ((!\SW~combout\(2) & !\SW~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110000111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(2),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(1),
	combout => \i8|Mux5~4_combout\);

-- Location: LCCOMB_X1_Y16_N10
\i8|Mux5~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i8|Mux5~9_combout\ = (\SW~combout\(4)) # ((\SW~combout\(5)) # ((\SW~combout\(6)) # (\i8|Mux5~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \SW~combout\(5),
	datac => \SW~combout\(6),
	datad => \i8|Mux5~4_combout\,
	combout => \i8|Mux5~9_combout\);

-- Location: LCCOMB_X4_Y13_N24
\i8|Mux4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i8|Mux4~4_combout\ = (\SW~combout\(0) & ((\SW~combout\(1) & ((\SW~combout\(2)))) # (!\SW~combout\(1) & (!\SW~combout\(3) & !\SW~combout\(2))))) # (!\SW~combout\(0) & ((\SW~combout\(2) & (\SW~combout\(3))) # (!\SW~combout\(2) & ((\SW~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(3),
	datab => \SW~combout\(0),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i8|Mux4~4_combout\);

-- Location: LCCOMB_X4_Y13_N18
\i8|Mux4~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i8|Mux4~9_combout\ = (\i8|Mux4~4_combout\) # ((\SW~combout\(5)) # ((\SW~combout\(6)) # (\SW~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i8|Mux4~4_combout\,
	datab => \SW~combout\(5),
	datac => \SW~combout\(6),
	datad => \SW~combout\(4),
	combout => \i8|Mux4~9_combout\);

-- Location: LCCOMB_X1_Y16_N12
\i8|Mux3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i8|Mux3~4_combout\ = (\SW~combout\(0) & ((\SW~combout\(3)) # ((!\SW~combout\(2) & !\SW~combout\(1))))) # (!\SW~combout\(0) & (\SW~combout\(2) & ((\SW~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(2),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(1),
	combout => \i8|Mux3~4_combout\);

-- Location: LCCOMB_X1_Y16_N22
\i8|Mux3~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i8|Mux3~9_combout\ = (\SW~combout\(4)) # ((\SW~combout\(5)) # ((\SW~combout\(6)) # (\i8|Mux3~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \SW~combout\(5),
	datac => \SW~combout\(6),
	datad => \i8|Mux3~4_combout\,
	combout => \i8|Mux3~9_combout\);

-- Location: LCCOMB_X4_Y13_N2
\i8|Mux2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i8|Mux2~3_combout\ = (!\SW~combout\(3) & (\SW~combout\(2) $ (((\SW~combout\(0) & \SW~combout\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(3),
	datab => \SW~combout\(0),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i8|Mux2~3_combout\);

-- Location: LCCOMB_X4_Y13_N8
\i8|Mux2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \i8|Mux2~12_combout\ = (!\SW~combout\(6) & (\i8|Mux2~3_combout\ & (!\SW~combout\(5) & !\SW~combout\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(6),
	datab => \i8|Mux2~3_combout\,
	datac => \SW~combout\(5),
	datad => \SW~combout\(4),
	combout => \i8|Mux2~12_combout\);

-- Location: LCCOMB_X1_Y16_N26
\i8|Mux1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i8|Mux1~3_combout\ = (!\SW~combout\(2) & (!\SW~combout\(0) & (!\SW~combout\(3) & \SW~combout\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(2),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(1),
	combout => \i8|Mux1~3_combout\);

-- Location: LCCOMB_X1_Y16_N8
\i8|Mux1~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \i8|Mux1~15_combout\ = (!\SW~combout\(4) & (!\SW~combout\(5) & (!\SW~combout\(6) & \i8|Mux1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \SW~combout\(5),
	datac => \SW~combout\(6),
	datad => \i8|Mux1~3_combout\,
	combout => \i8|Mux1~15_combout\);

-- Location: LCCOMB_X1_Y16_N20
\i8|Mux0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i8|Mux0~4_combout\ = (\SW~combout\(0) & (((\SW~combout\(3)) # (!\SW~combout\(1))) # (!\SW~combout\(2)))) # (!\SW~combout\(0) & ((\SW~combout\(2) $ (!\SW~combout\(1))) # (!\SW~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(2),
	datab => \SW~combout\(0),
	datac => \SW~combout\(3),
	datad => \SW~combout\(1),
	combout => \i8|Mux0~4_combout\);

-- Location: LCCOMB_X1_Y16_N6
\i8|Mux0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \i8|Mux0~9_combout\ = (\SW~combout\(4)) # ((\SW~combout\(5)) # ((\SW~combout\(6)) # (\i8|Mux0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \SW~combout\(5),
	datac => \SW~combout\(6),
	datad => \i8|Mux0~4_combout\,
	combout => \i8|Mux0~9_combout\);

-- Location: LCCOMB_X1_Y17_N28
\i1|mem~58\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~58_combout\ = (\SW~combout\(3) & (\SW~combout\(0) & (!\SW~combout\(1)))) # (!\SW~combout\(3) & (((\SW~combout\(1) & !\SW~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(0),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i1|mem~58_combout\);

-- Location: LCCOMB_X1_Y17_N6
\i1|mem~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~59_combout\ = (\SW~combout\(5)) # (((\SW~combout\(4)) # (\SW~combout\(6))) # (!\i1|mem~58_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(5),
	datab => \i1|mem~58_combout\,
	datac => \SW~combout\(4),
	datad => \SW~combout\(6),
	combout => \i1|mem~59_combout\);

-- Location: LCCOMB_X1_Y17_N0
\i1|mem~56\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~56_combout\ = (\SW~combout\(3) & ((\SW~combout\(0) & ((\SW~combout\(1)) # (\SW~combout\(2)))) # (!\SW~combout\(0) & (\SW~combout\(1) & \SW~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(0),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i1|mem~56_combout\);

-- Location: LCCOMB_X1_Y17_N26
\i1|mem~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~57_combout\ = (\SW~combout\(5)) # ((\i1|mem~56_combout\) # ((\SW~combout\(4)) # (\SW~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(5),
	datab => \i1|mem~56_combout\,
	datac => \SW~combout\(4),
	datad => \SW~combout\(6),
	combout => \i1|mem~57_combout\);

-- Location: LCCOMB_X1_Y17_N8
\i1|mem~60\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~60_combout\ = (\SW~combout\(3)) # ((!\SW~combout\(1) & (\SW~combout\(0) $ (\SW~combout\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(0),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i1|mem~60_combout\);

-- Location: LCCOMB_X1_Y17_N2
\i1|mem~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~61_combout\ = (\SW~combout\(4)) # ((\i1|mem~60_combout\) # ((\SW~combout\(5)) # (\SW~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \i1|mem~60_combout\,
	datac => \SW~combout\(5),
	datad => \SW~combout\(6),
	combout => \i1|mem~61_combout\);

-- Location: LCCOMB_X1_Y17_N20
\i1|mem~62\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~62_combout\ = (!\SW~combout\(3) & ((\SW~combout\(1) & (!\SW~combout\(0))) # (!\SW~combout\(1) & ((\SW~combout\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(0),
	datab => \SW~combout\(3),
	datac => \SW~combout\(1),
	datad => \SW~combout\(2),
	combout => \i1|mem~62_combout\);

-- Location: LCCOMB_X1_Y17_N30
\i1|mem~63\ : cycloneii_lcell_comb
-- Equation(s):
-- \i1|mem~63_combout\ = (\SW~combout\(4)) # (((\SW~combout\(5)) # (\SW~combout\(6))) # (!\i1|mem~62_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW~combout\(4),
	datab => \i1|mem~62_combout\,
	datac => \SW~combout\(5),
	datad => \SW~combout\(6),
	combout => \i1|mem~63_combout\);

-- Location: LCCOMB_X1_Y17_N24
\i9|Mux6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i9|Mux6~0_combout\ = (\i1|mem~61_combout\ & (!\i1|mem~59_combout\ & (\i1|mem~57_combout\ $ (!\i1|mem~63_combout\)))) # (!\i1|mem~61_combout\ & (\i1|mem~57_combout\ & (\i1|mem~59_combout\ $ (!\i1|mem~63_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~59_combout\,
	datab => \i1|mem~57_combout\,
	datac => \i1|mem~61_combout\,
	datad => \i1|mem~63_combout\,
	combout => \i9|Mux6~0_combout\);

-- Location: LCCOMB_X1_Y17_N10
\i9|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i9|Mux5~0_combout\ = (\i1|mem~59_combout\ & ((\i1|mem~57_combout\ & ((\i1|mem~63_combout\))) # (!\i1|mem~57_combout\ & (\i1|mem~61_combout\)))) # (!\i1|mem~59_combout\ & (\i1|mem~61_combout\ & (\i1|mem~57_combout\ $ (\i1|mem~63_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~59_combout\,
	datab => \i1|mem~57_combout\,
	datac => \i1|mem~61_combout\,
	datad => \i1|mem~63_combout\,
	combout => \i9|Mux5~0_combout\);

-- Location: LCCOMB_X1_Y17_N4
\i9|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i9|Mux4~0_combout\ = (\i1|mem~61_combout\ & (\i1|mem~63_combout\ & ((\i1|mem~59_combout\) # (!\i1|mem~57_combout\)))) # (!\i1|mem~61_combout\ & (\i1|mem~59_combout\ & (!\i1|mem~57_combout\ & !\i1|mem~63_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~59_combout\,
	datab => \i1|mem~57_combout\,
	datac => \i1|mem~61_combout\,
	datad => \i1|mem~63_combout\,
	combout => \i9|Mux4~0_combout\);

-- Location: LCCOMB_X1_Y17_N22
\i9|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i9|Mux3~0_combout\ = (\i1|mem~59_combout\ & ((\i1|mem~57_combout\ & (\i1|mem~61_combout\)) # (!\i1|mem~57_combout\ & (!\i1|mem~61_combout\ & \i1|mem~63_combout\)))) # (!\i1|mem~59_combout\ & (!\i1|mem~63_combout\ & (\i1|mem~57_combout\ $ 
-- (\i1|mem~61_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~59_combout\,
	datab => \i1|mem~57_combout\,
	datac => \i1|mem~61_combout\,
	datad => \i1|mem~63_combout\,
	combout => \i9|Mux3~0_combout\);

-- Location: LCCOMB_X1_Y17_N16
\i9|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i9|Mux2~0_combout\ = (\i1|mem~59_combout\ & (\i1|mem~57_combout\ & ((!\i1|mem~63_combout\)))) # (!\i1|mem~59_combout\ & ((\i1|mem~61_combout\ & ((!\i1|mem~63_combout\))) # (!\i1|mem~61_combout\ & (\i1|mem~57_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~59_combout\,
	datab => \i1|mem~57_combout\,
	datac => \i1|mem~61_combout\,
	datad => \i1|mem~63_combout\,
	combout => \i9|Mux2~0_combout\);

-- Location: LCCOMB_X1_Y17_N18
\i9|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i9|Mux1~0_combout\ = (\i1|mem~59_combout\ & (!\i1|mem~63_combout\ & ((\i1|mem~57_combout\) # (!\i1|mem~61_combout\)))) # (!\i1|mem~59_combout\ & (\i1|mem~57_combout\ & (\i1|mem~61_combout\ $ (!\i1|mem~63_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~59_combout\,
	datab => \i1|mem~57_combout\,
	datac => \i1|mem~61_combout\,
	datad => \i1|mem~63_combout\,
	combout => \i9|Mux1~0_combout\);

-- Location: LCCOMB_X1_Y17_N12
\i9|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i9|Mux0~0_combout\ = (\i1|mem~57_combout\ & ((\i1|mem~63_combout\) # (\i1|mem~59_combout\ $ (\i1|mem~61_combout\)))) # (!\i1|mem~57_combout\ & ((\i1|mem~59_combout\) # (\i1|mem~61_combout\ $ (\i1|mem~63_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i1|mem~59_combout\,
	datab => \i1|mem~57_combout\,
	datac => \i1|mem~61_combout\,
	datad => \i1|mem~63_combout\,
	combout => \i9|Mux0~0_combout\);

-- Location: PIN_AF10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX0[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i2|Mux6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX0(0));

-- Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX0[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i2|Mux5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX0(1));

-- Location: PIN_AC12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX0[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i2|Mux4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX0(2));

-- Location: PIN_AD11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX0[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i2|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX0(3));

-- Location: PIN_AE11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX0[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i2|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX0(4));

-- Location: PIN_V14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX0[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i2|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX0(5));

-- Location: PIN_V13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX0[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i2|ALT_INV_Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX0(6));

-- Location: PIN_V20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX1[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i3|Mux6~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX1(0));

-- Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX1[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i3|Mux5~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX1(1));

-- Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX1[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i3|Mux4~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX1(2));

-- Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX1[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i3|Mux3~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX1(3));

-- Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX1[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i3|Mux2~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX1(4));

-- Location: PIN_AA23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX1[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i3|Mux1~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX1(5));

-- Location: PIN_AB24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX1[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i3|ALT_INV_Mux0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX1(6));

-- Location: PIN_AB23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX2[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i4|Mux6~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX2(0));

-- Location: PIN_V22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX2[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i4|Mux5~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX2(1));

-- Location: PIN_AC25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX2[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i4|Mux4~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX2(2));

-- Location: PIN_AC26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX2[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i4|Mux3~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX2(3));

-- Location: PIN_AB26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX2[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i4|Mux2~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX2(4));

-- Location: PIN_AB25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX2[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i4|Mux1~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX2(5));

-- Location: PIN_Y24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX2[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i4|ALT_INV_Mux0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX2(6));

-- Location: PIN_Y23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX3[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i5|Mux6~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX3(0));

-- Location: PIN_AA25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX3[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i5|Mux5~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX3(1));

-- Location: PIN_AA26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX3[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i5|Mux4~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX3(2));

-- Location: PIN_Y26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX3[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i5|Mux3~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX3(3));

-- Location: PIN_Y25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX3[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i5|Mux2~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX3(4));

-- Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX3[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i5|Mux1~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX3(5));

-- Location: PIN_W24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX3[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i5|ALT_INV_Mux0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX3(6));

-- Location: PIN_U9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX4[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i6|Mux6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX4(0));

-- Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX4[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i6|Mux5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX4(1));

-- Location: PIN_U2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX4[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i6|Mux4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX4(2));

-- Location: PIN_T4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX4[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i6|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX4(3));

-- Location: PIN_R7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX4[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i6|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX4(4));

-- Location: PIN_R6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX4[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i6|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX4(5));

-- Location: PIN_T3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX4[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i6|ALT_INV_Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX4(6));

-- Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX5[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i7|Mux6~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX5(0));

-- Location: PIN_P6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX5[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i3|Mux5~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX5(1));

-- Location: PIN_P7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX5[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i7|Mux4~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX5(2));

-- Location: PIN_T9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX5[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i7|Mux3~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX5(3));

-- Location: PIN_R5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX5[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i7|Mux2~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX5(4));

-- Location: PIN_R4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX5[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i7|Mux1~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX5(5));

-- Location: PIN_R3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX5[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i7|ALT_INV_Mux0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX5(6));

-- Location: PIN_R2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX6[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i8|Mux6~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX6(0));

-- Location: PIN_P4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX6[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i8|Mux5~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX6(1));

-- Location: PIN_P3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX6[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i8|Mux4~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX6(2));

-- Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX6[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i8|Mux3~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX6(3));

-- Location: PIN_M3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX6[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i8|Mux2~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX6(4));

-- Location: PIN_M5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX6[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i8|Mux1~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX6(5));

-- Location: PIN_M4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX6[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i8|ALT_INV_Mux0~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX6(6));

-- Location: PIN_L3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX7[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i9|Mux6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX7(0));

-- Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX7[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i9|Mux5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX7(1));

-- Location: PIN_L9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX7[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i9|Mux4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX7(2));

-- Location: PIN_L6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX7[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i9|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX7(3));

-- Location: PIN_L7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX7[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i9|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX7(4));

-- Location: PIN_P9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX7[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i9|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX7(5));

-- Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\HEX7[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i9|ALT_INV_Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_HEX7(6));
END structure;



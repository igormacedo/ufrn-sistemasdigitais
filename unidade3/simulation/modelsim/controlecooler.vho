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

-- DATE "06/14/2017 10:33:46"

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

ENTITY 	controlecooler IS
    PORT (
	PWM1_signal_out : OUT std_logic;
	CLK_50MHz : IN std_logic;
	PWN1_en : IN std_logic;
	PWM1_clr : IN std_logic
	);
END controlecooler;

-- Design Ports Information
-- PWM1_signal_out	=>  Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- CLK_50MHz	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- PWM1_clr	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- PWN1_en	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF controlecooler IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_PWM1_signal_out : std_logic;
SIGNAL ww_CLK_50MHz : std_logic;
SIGNAL ww_PWN1_en : std_logic;
SIGNAL ww_PWM1_clr : std_logic;
SIGNAL \CLK_50MHz~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \PWM1_clr~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita0~combout\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita1~combout\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita5~combout\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~2_combout\ : std_logic;
SIGNAL \CLK_50MHz~combout\ : std_logic;
SIGNAL \CLK_50MHz~clkctrl_outclk\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita2~combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \PWM1_clr~combout\ : std_logic;
SIGNAL \PWM1_clr~clkctrl_outclk\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita4~combout\ : std_logic;
SIGNAL \PWN1_en~combout\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita6~combout\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita6~COUT\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita7~combout\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita7~COUT\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita8~combout\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~0_combout\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita8~COUT\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9~combout\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~1_combout\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9~COUT\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9~0_combout\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|cout_actual~combout\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita3~combout\ : std_logic;
SIGNAL \comparador_pwm1|LPM_COMPARE_component|auto_generated|op_1~0_combout\ : std_logic;
SIGNAL \comparador_pwm1|LPM_COMPARE_component|auto_generated|op_1~1_combout\ : std_logic;
SIGNAL \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\ : std_logic_vector(9 DOWNTO 0);

BEGIN

PWM1_signal_out <= ww_PWM1_signal_out;
ww_CLK_50MHz <= CLK_50MHz;
ww_PWN1_en <= PWN1_en;
ww_PWM1_clr <= PWM1_clr;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLK_50MHz~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \CLK_50MHz~combout\);

\PWM1_clr~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \PWM1_clr~combout\);

-- Location: LCFF_X31_Y35_N21
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_50MHz~clkctrl_outclk\,
	datain => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita5~combout\,
	sdata => \~GND~combout\,
	aclr => \PWM1_clr~clkctrl_outclk\,
	sload => \contador_pwm1|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	ena => \PWN1_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(5));

-- Location: LCFF_X31_Y35_N13
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_50MHz~clkctrl_outclk\,
	datain => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita1~combout\,
	sdata => \~GND~combout\,
	aclr => \PWM1_clr~clkctrl_outclk\,
	sload => \contador_pwm1|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	ena => \PWN1_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(1));

-- Location: LCFF_X31_Y35_N11
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_50MHz~clkctrl_outclk\,
	datain => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita0~combout\,
	sdata => \~GND~combout\,
	aclr => \PWM1_clr~clkctrl_outclk\,
	sload => \contador_pwm1|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	ena => \PWN1_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(0));

-- Location: LCCOMB_X31_Y35_N10
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita0\ : cycloneii_lcell_comb
-- Equation(s):
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita0~combout\ = \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(0) $ (VCC)
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\ = CARRY(\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(0),
	datad => VCC,
	combout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita0~combout\,
	cout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\);

-- Location: LCCOMB_X31_Y35_N12
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita1\ : cycloneii_lcell_comb
-- Equation(s):
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita1~combout\ = (\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(1) & (!\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\)) # 
-- (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(1) & ((\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\) # (GND)))
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita1~COUT\ = CARRY((!\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\) # (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(1),
	datad => VCC,
	cin => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita0~COUT\,
	combout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita1~combout\,
	cout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita1~COUT\);

-- Location: LCCOMB_X31_Y35_N20
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita5\ : cycloneii_lcell_comb
-- Equation(s):
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita5~combout\ = (\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(5) & (!\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita4~COUT\)) # 
-- (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(5) & ((\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita4~COUT\) # (GND)))
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita5~COUT\ = CARRY((!\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita4~COUT\) # (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(5),
	datad => VCC,
	cin => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita4~COUT\,
	combout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita5~combout\,
	cout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita5~COUT\);

-- Location: LCCOMB_X31_Y35_N6
\contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~2_combout\ = (\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(0) & \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(0),
	datad => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(1),
	combout => \contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~2_combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK_50MHz~I\ : cycloneii_io
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
	padio => ww_CLK_50MHz,
	combout => \CLK_50MHz~combout\);

-- Location: CLKCTRL_G3
\CLK_50MHz~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK_50MHz~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK_50MHz~clkctrl_outclk\);

-- Location: LCCOMB_X31_Y35_N14
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita2\ : cycloneii_lcell_comb
-- Equation(s):
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita2~combout\ = (\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(2) & (\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita1~COUT\ $ (GND))) # 
-- (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(2) & (!\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita1~COUT\ & VCC))
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita2~COUT\ = CARRY((\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(2) & !\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita1~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(2),
	datad => VCC,
	cin => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita1~COUT\,
	combout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita2~combout\,
	cout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita2~COUT\);

-- Location: LCCOMB_X30_Y35_N30
\~GND\ : cycloneii_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\PWM1_clr~I\ : cycloneii_io
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
	padio => ww_PWM1_clr,
	combout => \PWM1_clr~combout\);

-- Location: CLKCTRL_G1
\PWM1_clr~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \PWM1_clr~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \PWM1_clr~clkctrl_outclk\);

-- Location: LCCOMB_X31_Y35_N16
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita3\ : cycloneii_lcell_comb
-- Equation(s):
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita3~combout\ = (\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(3) & (!\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita2~COUT\)) # 
-- (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(3) & ((\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita2~COUT\) # (GND)))
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita3~COUT\ = CARRY((!\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita2~COUT\) # (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(3),
	datad => VCC,
	cin => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita2~COUT\,
	combout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita3~combout\,
	cout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita3~COUT\);

-- Location: LCCOMB_X31_Y35_N18
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita4\ : cycloneii_lcell_comb
-- Equation(s):
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita4~combout\ = (\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(4) & (\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita3~COUT\ $ (GND))) # 
-- (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(4) & (!\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita3~COUT\ & VCC))
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita4~COUT\ = CARRY((\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(4) & !\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita3~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(4),
	datad => VCC,
	cin => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita3~COUT\,
	combout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita4~combout\,
	cout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita4~COUT\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\PWN1_en~I\ : cycloneii_io
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
	padio => ww_PWN1_en,
	combout => \PWN1_en~combout\);

-- Location: LCFF_X31_Y35_N19
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_50MHz~clkctrl_outclk\,
	datain => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita4~combout\,
	sdata => \~GND~combout\,
	aclr => \PWM1_clr~clkctrl_outclk\,
	sload => \contador_pwm1|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	ena => \PWN1_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(4));

-- Location: LCCOMB_X31_Y35_N22
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita6\ : cycloneii_lcell_comb
-- Equation(s):
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita6~combout\ = (\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(6) & (\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita5~COUT\ $ (GND))) # 
-- (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(6) & (!\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita5~COUT\ & VCC))
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita6~COUT\ = CARRY((\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(6) & !\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita5~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(6),
	datad => VCC,
	cin => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita5~COUT\,
	combout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita6~combout\,
	cout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita6~COUT\);

-- Location: LCFF_X31_Y35_N23
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_50MHz~clkctrl_outclk\,
	datain => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita6~combout\,
	sdata => \~GND~combout\,
	aclr => \PWM1_clr~clkctrl_outclk\,
	sload => \contador_pwm1|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	ena => \PWN1_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(6));

-- Location: LCCOMB_X31_Y35_N24
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita7\ : cycloneii_lcell_comb
-- Equation(s):
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita7~combout\ = (\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(7) & (!\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita6~COUT\)) # 
-- (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(7) & ((\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita6~COUT\) # (GND)))
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita7~COUT\ = CARRY((!\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita6~COUT\) # (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(7),
	datad => VCC,
	cin => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita6~COUT\,
	combout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita7~combout\,
	cout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita7~COUT\);

-- Location: LCFF_X31_Y35_N25
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_50MHz~clkctrl_outclk\,
	datain => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita7~combout\,
	sdata => \~GND~combout\,
	aclr => \PWM1_clr~clkctrl_outclk\,
	sload => \contador_pwm1|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	ena => \PWN1_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(7));

-- Location: LCCOMB_X31_Y35_N26
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita8\ : cycloneii_lcell_comb
-- Equation(s):
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita8~combout\ = (\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(8) & (\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita7~COUT\ $ (GND))) # 
-- (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(8) & (!\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita7~COUT\ & VCC))
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita8~COUT\ = CARRY((\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(8) & !\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita7~COUT\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(8),
	datad => VCC,
	cin => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita7~COUT\,
	combout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita8~combout\,
	cout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita8~COUT\);

-- Location: LCFF_X31_Y35_N27
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_50MHz~clkctrl_outclk\,
	datain => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita8~combout\,
	sdata => \~GND~combout\,
	aclr => \PWM1_clr~clkctrl_outclk\,
	sload => \contador_pwm1|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	ena => \PWN1_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(8));

-- Location: LCCOMB_X31_Y35_N2
\contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~0_combout\ = (\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(5) & (\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(6) & 
-- (\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(7) & \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(5),
	datab => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(6),
	datac => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(7),
	datad => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(8),
	combout => \contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~0_combout\);

-- Location: LCCOMB_X31_Y35_N28
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9\ : cycloneii_lcell_comb
-- Equation(s):
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9~combout\ = (\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(9) & (!\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita8~COUT\)) # 
-- (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(9) & ((\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita8~COUT\) # (GND)))
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9~COUT\ = CARRY((!\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita8~COUT\) # (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(9),
	datad => VCC,
	cin => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita8~COUT\,
	combout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9~combout\,
	cout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9~COUT\);

-- Location: LCFF_X31_Y35_N29
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_50MHz~clkctrl_outclk\,
	datain => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9~combout\,
	sdata => \~GND~combout\,
	aclr => \PWM1_clr~clkctrl_outclk\,
	sload => \contador_pwm1|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	ena => \PWN1_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(9));

-- Location: LCCOMB_X31_Y35_N8
\contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~1_combout\ = (\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(2) & (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(4) & 
-- (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(3) & \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(2),
	datab => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(4),
	datac => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(3),
	datad => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(9),
	combout => \contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~1_combout\);

-- Location: LCCOMB_X31_Y35_N30
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9~0_combout\ = !\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9~COUT\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9~COUT\,
	combout => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9~0_combout\);

-- Location: LCCOMB_X31_Y35_N0
\contador_pwm1|LPM_COUNTER_component|auto_generated|cout_actual\ : cycloneii_lcell_comb
-- Equation(s):
-- \contador_pwm1|LPM_COUNTER_component|auto_generated|cout_actual~combout\ = (\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9~0_combout\) # ((\contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~2_combout\ & 
-- (\contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~0_combout\ & \contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~2_combout\,
	datab => \contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~0_combout\,
	datac => \contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~1_combout\,
	datad => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita9~0_combout\,
	combout => \contador_pwm1|LPM_COUNTER_component|auto_generated|cout_actual~combout\);

-- Location: LCFF_X31_Y35_N15
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_50MHz~clkctrl_outclk\,
	datain => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita2~combout\,
	sdata => \~GND~combout\,
	aclr => \PWM1_clr~clkctrl_outclk\,
	sload => \contador_pwm1|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	ena => \PWN1_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(2));

-- Location: LCFF_X31_Y35_N17
\contador_pwm1|LPM_COUNTER_component|auto_generated|counter_reg_bit1a[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK_50MHz~clkctrl_outclk\,
	datain => \contador_pwm1|LPM_COUNTER_component|auto_generated|counter_comb_bita3~combout\,
	sdata => \~GND~combout\,
	aclr => \PWM1_clr~clkctrl_outclk\,
	sload => \contador_pwm1|LPM_COUNTER_component|auto_generated|cout_actual~combout\,
	ena => \PWN1_en~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(3));

-- Location: LCCOMB_X31_Y35_N4
\comparador_pwm1|LPM_COMPARE_component|auto_generated|op_1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \comparador_pwm1|LPM_COMPARE_component|auto_generated|op_1~0_combout\ = ((!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(2) & !\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(3))) # 
-- (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(2),
	datab => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(3),
	datad => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(4),
	combout => \comparador_pwm1|LPM_COMPARE_component|auto_generated|op_1~0_combout\);

-- Location: LCCOMB_X30_Y35_N0
\comparador_pwm1|LPM_COMPARE_component|auto_generated|op_1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \comparador_pwm1|LPM_COMPARE_component|auto_generated|op_1~1_combout\ = (!\contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(9) & ((\comparador_pwm1|LPM_COMPARE_component|auto_generated|op_1~0_combout\) # 
-- (!\contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \comparador_pwm1|LPM_COMPARE_component|auto_generated|op_1~0_combout\,
	datab => \contador_pwm1|LPM_COUNTER_component|auto_generated|safe_q\(9),
	datad => \contador_pwm1|LPM_COUNTER_component|auto_generated|cmpr2|aneb_result_wire[0]~0_combout\,
	combout => \comparador_pwm1|LPM_COMPARE_component|auto_generated|op_1~1_combout\);

-- Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\PWM1_signal_out~I\ : cycloneii_io
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
	datain => \comparador_pwm1|LPM_COMPARE_component|auto_generated|op_1~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_PWM1_signal_out);
END structure;



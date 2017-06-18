-- megafunction wizard: %LPM_ADD_SUB%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: LPM_ADD_SUB 

-- ============================================================
-- File Name: lpm_add_sub0.vhd
-- Megafunction Name(s):
-- 			LPM_ADD_SUB
--
-- Simulation Library Files(s):
-- 			lpm
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 13.0.1 Build 232 06/12/2013 SP 1 SJ Web Edition
-- ************************************************************


--Copyright (C) 1991-2013 Altera Corporation
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, Altera MegaCore Function License 
--Agreement, or other applicable license agreement, including, 
--without limitation, that your use is for the sole purpose of 
--programming logic devices manufactured by Altera and sold by 
--Altera or its authorized distributors.  Please refer to the 
--applicable agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY lpm_add_sub0 IS
	PORT
	(
		datab		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
	);
END lpm_add_sub0;


ARCHITECTURE SYN OF lpm_add_sub0 IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (9 DOWNTO 0);
	SIGNAL sub_wire1_bv	: BIT_VECTOR (9 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC_VECTOR (9 DOWNTO 0);



	COMPONENT lpm_add_sub
	GENERIC (
		lpm_direction		: STRING;
		lpm_hint		: STRING;
		lpm_representation		: STRING;
		lpm_type		: STRING;
		lpm_width		: NATURAL
	);
	PORT (
			dataa	: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			result	: OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	sub_wire1_bv(9 DOWNTO 0) <= "1111101000";
	sub_wire1    <= To_stdlogicvector(sub_wire1_bv);
	result    <= sub_wire0(9 DOWNTO 0);

	LPM_ADD_SUB_component : LPM_ADD_SUB
	GENERIC MAP (
		lpm_direction => "SUB",
		lpm_hint => "ONE_INPUT_IS_CONSTANT=YES,CIN_USED=NO",
		lpm_representation => "UNSIGNED",
		lpm_type => "LPM_ADD_SUB",
		lpm_width => 10
	)
	PORT MAP (
		dataa => sub_wire1,
		datab => datab,
		result => sub_wire0
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: CarryIn NUMERIC "0"
-- Retrieval info: PRIVATE: CarryOut NUMERIC "0"
-- Retrieval info: PRIVATE: ConstantA NUMERIC "1000"
-- Retrieval info: PRIVATE: ConstantB NUMERIC "0"
-- Retrieval info: PRIVATE: Function NUMERIC "1"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
-- Retrieval info: PRIVATE: LPM_PIPELINE NUMERIC "0"
-- Retrieval info: PRIVATE: Latency NUMERIC "0"
-- Retrieval info: PRIVATE: Overflow NUMERIC "0"
-- Retrieval info: PRIVATE: RadixA NUMERIC "10"
-- Retrieval info: PRIVATE: RadixB NUMERIC "10"
-- Retrieval info: PRIVATE: Representation NUMERIC "1"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: ValidCtA NUMERIC "1"
-- Retrieval info: PRIVATE: ValidCtB NUMERIC "0"
-- Retrieval info: PRIVATE: WhichConstant NUMERIC "1"
-- Retrieval info: PRIVATE: aclr NUMERIC "0"
-- Retrieval info: PRIVATE: clken NUMERIC "0"
-- Retrieval info: PRIVATE: nBit NUMERIC "10"
-- Retrieval info: PRIVATE: new_diagram STRING "1"
-- Retrieval info: LIBRARY: lpm lpm.lpm_components.all
-- Retrieval info: CONSTANT: LPM_DIRECTION STRING "SUB"
-- Retrieval info: CONSTANT: LPM_HINT STRING "ONE_INPUT_IS_CONSTANT=YES,CIN_USED=NO"
-- Retrieval info: CONSTANT: LPM_REPRESENTATION STRING "UNSIGNED"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_ADD_SUB"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "10"
-- Retrieval info: USED_PORT: datab 0 0 10 0 INPUT NODEFVAL "datab[9..0]"
-- Retrieval info: USED_PORT: result 0 0 10 0 OUTPUT NODEFVAL "result[9..0]"
-- Retrieval info: CONNECT: @dataa 0 0 10 0 1000 0 0 10 0
-- Retrieval info: CONNECT: @datab 0 0 10 0 datab 0 0 10 0
-- Retrieval info: CONNECT: result 0 0 10 0 @result 0 0 10 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_add_sub0.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_add_sub0.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_add_sub0.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_add_sub0.bsf TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL lpm_add_sub0_inst.vhd FALSE
-- Retrieval info: LIB_FILE: lpm

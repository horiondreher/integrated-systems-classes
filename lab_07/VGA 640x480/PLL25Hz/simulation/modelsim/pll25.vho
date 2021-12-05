-- Copyright (C) 1991-2014 Altera Corporation
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
-- VERSION "Version 13.1.4 Build 182 03/12/2014 SJ Web Edition"

-- DATE "04/30/2014 13:43:06"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	PLL25Hz IS
    PORT (
	clk_in_clk : IN std_logic;
	reset_reset : IN std_logic;
	clk_out_25m_clk : OUT std_logic;
	areset_export : IN std_logic
	);
END PLL25Hz;

-- Design Ports Information
-- reset_reset	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_out_25m_clk	=>  Location: PIN_AE5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- areset_export	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_in_clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF PLL25Hz IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_in_clk : std_logic;
SIGNAL ww_reset_reset : std_logic;
SIGNAL ww_clk_out_25m_clk : std_logic;
SIGNAL ww_areset_export : std_logic;
SIGNAL \altpll_0|sd1|pll7_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \altpll_0|sd1|pll7_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \altpll_0|sd1|wire_pll7_clk[0]~clkctrl_e_clk_out_25m_clk_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset_reset~input_o\ : std_logic;
SIGNAL \areset_export~input_o\ : std_logic;
SIGNAL \clk_in_clk~input_o\ : std_logic;
SIGNAL \altpll_0|sd1|wire_pll7_fbout\ : std_logic;
SIGNAL \altpll_0|sd1|wire_pll7_clk[0]~clkctrl_e_clk_out_25m_clk_outclk\ : std_logic;
SIGNAL \altpll_0|sd1|wire_pll7_clk\ : std_logic_vector(4 DOWNTO 0);

BEGIN

ww_clk_in_clk <= clk_in_clk;
ww_reset_reset <= reset_reset;
clk_out_25m_clk <= ww_clk_out_25m_clk;
ww_areset_export <= areset_export;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\altpll_0|sd1|pll7_INCLK_bus\ <= (gnd & \clk_in_clk~input_o\);

\altpll_0|sd1|wire_pll7_clk\(0) <= \altpll_0|sd1|pll7_CLK_bus\(0);
\altpll_0|sd1|wire_pll7_clk\(1) <= \altpll_0|sd1|pll7_CLK_bus\(1);
\altpll_0|sd1|wire_pll7_clk\(2) <= \altpll_0|sd1|pll7_CLK_bus\(2);
\altpll_0|sd1|wire_pll7_clk\(3) <= \altpll_0|sd1|pll7_CLK_bus\(3);
\altpll_0|sd1|wire_pll7_clk\(4) <= \altpll_0|sd1|pll7_CLK_bus\(4);

\altpll_0|sd1|wire_pll7_clk[0]~clkctrl_e_clk_out_25m_clk_INCLK_bus\ <= (vcc & vcc & vcc & \altpll_0|sd1|wire_pll7_clk\(0));

-- Location: IOOBUF_X5_Y0_N23
\clk_out_25m_clk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altpll_0|sd1|wire_pll7_clk[0]~clkctrl_e_clk_out_25m_clk_outclk\,
	devoe => ww_devoe,
	o => ww_clk_out_25m_clk);

-- Location: IOIBUF_X0_Y4_N22
\areset_export~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_areset_export,
	o => \areset_export~input_o\);

-- Location: IOIBUF_X0_Y36_N8
\clk_in_clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_in_clk,
	o => \clk_in_clk~input_o\);

-- Location: PLL_1
\altpll_0|sd1|pll7\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 11,
	c0_initial => 1,
	c0_low => 10,
	c0_mode => "odd",
	c0_ph => 0,
	c1_high => 0,
	c1_initial => 0,
	c1_low => 0,
	c1_mode => "bypass",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c0",
	clk0_divide_by => 147,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 74,
	clk0_phase_shift => "0",
	clk1_counter => "unused",
	clk1_divide_by => 0,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 0,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 16,
	m => 74,
	m_initial => 1,
	m_ph => 0,
	n => 7,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	pll_compensation_delay => 7101,
	self_reset_on_loss_lock => "off",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 236,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	areset => \areset_export~input_o\,
	fbin => \altpll_0|sd1|wire_pll7_fbout\,
	inclk => \altpll_0|sd1|pll7_INCLK_bus\,
	fbout => \altpll_0|sd1|wire_pll7_fbout\,
	clk => \altpll_0|sd1|pll7_CLK_bus\);

-- Location: CLKCTRL_PLL1E0
\altpll_0|sd1|wire_pll7_clk[0]~clkctrl_e_clk_out_25m_clk\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "external clock output",
	ena_register_mode => "double register")
-- pragma translate_on
PORT MAP (
	inclk => \altpll_0|sd1|wire_pll7_clk[0]~clkctrl_e_clk_out_25m_clk_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \altpll_0|sd1|wire_pll7_clk[0]~clkctrl_e_clk_out_25m_clk_outclk\);

-- Location: IOIBUF_X11_Y0_N1
\reset_reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_reset,
	o => \reset_reset~input_o\);
END structure;



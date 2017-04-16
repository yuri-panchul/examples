// megafunction wizard: %ALTIOBUF%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altiobuf_in 

// ============================================================
// File Name: ibuf8.v
// Megafunction Name(s):
// 			altiobuf_in
//
// Simulation Library Files(s):
// 			cycloneive
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 12.0 Build 178 05/31/2012 SJ Web Edition
// ************************************************************


//Copyright (C) 1991-2012 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


//altiobuf_in CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Cyclone IV E" ENABLE_BUS_HOLD="FALSE" NUMBER_OF_CHANNELS=8 USE_DIFFERENTIAL_MODE="FALSE" USE_DYNAMIC_TERMINATION_CONTROL="FALSE" datain dataout
//VERSION_BEGIN 12.0 cbx_altiobuf_in 2012:05:31:20:08:35:SJ cbx_mgl 2012:05:31:20:09:47:SJ cbx_stratixiii 2012:05:31:20:08:35:SJ cbx_stratixv 2012:05:31:20:08:35:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


//synthesis_resources = cycloneive_io_ibuf 8 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  ibuf8_iobuf_in_k8i
	( 
	datain,
	dataout) ;
	input   [7:0]  datain;
	output   [7:0]  dataout;

	wire  [7:0]   wire_ibufa_i;
	wire  [7:0]   wire_ibufa_o;

	cycloneive_io_ibuf   ibufa_0
	( 
	.i(wire_ibufa_i[0:0]),
	.o(wire_ibufa_o[0:0])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_0.bus_hold = "false",
		ibufa_0.differential_mode = "false",
		ibufa_0.lpm_type = "cycloneive_io_ibuf";
	cycloneive_io_ibuf   ibufa_1
	( 
	.i(wire_ibufa_i[1:1]),
	.o(wire_ibufa_o[1:1])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_1.bus_hold = "false",
		ibufa_1.differential_mode = "false",
		ibufa_1.lpm_type = "cycloneive_io_ibuf";
	cycloneive_io_ibuf   ibufa_2
	( 
	.i(wire_ibufa_i[2:2]),
	.o(wire_ibufa_o[2:2])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_2.bus_hold = "false",
		ibufa_2.differential_mode = "false",
		ibufa_2.lpm_type = "cycloneive_io_ibuf";
	cycloneive_io_ibuf   ibufa_3
	( 
	.i(wire_ibufa_i[3:3]),
	.o(wire_ibufa_o[3:3])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_3.bus_hold = "false",
		ibufa_3.differential_mode = "false",
		ibufa_3.lpm_type = "cycloneive_io_ibuf";
	cycloneive_io_ibuf   ibufa_4
	( 
	.i(wire_ibufa_i[4:4]),
	.o(wire_ibufa_o[4:4])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_4.bus_hold = "false",
		ibufa_4.differential_mode = "false",
		ibufa_4.lpm_type = "cycloneive_io_ibuf";
	cycloneive_io_ibuf   ibufa_5
	( 
	.i(wire_ibufa_i[5:5]),
	.o(wire_ibufa_o[5:5])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_5.bus_hold = "false",
		ibufa_5.differential_mode = "false",
		ibufa_5.lpm_type = "cycloneive_io_ibuf";
	cycloneive_io_ibuf   ibufa_6
	( 
	.i(wire_ibufa_i[6:6]),
	.o(wire_ibufa_o[6:6])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_6.bus_hold = "false",
		ibufa_6.differential_mode = "false",
		ibufa_6.lpm_type = "cycloneive_io_ibuf";
	cycloneive_io_ibuf   ibufa_7
	( 
	.i(wire_ibufa_i[7:7]),
	.o(wire_ibufa_o[7:7])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.ibar(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_7.bus_hold = "false",
		ibufa_7.differential_mode = "false",
		ibufa_7.lpm_type = "cycloneive_io_ibuf";
	assign
		wire_ibufa_i = datain;
	assign
		dataout = wire_ibufa_o;
endmodule //ibuf8_iobuf_in_k8i
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module ibuf8 (
	datain,
	dataout);

	input	[7:0]  datain;
	output	[7:0]  dataout;

	wire [7:0] sub_wire0;
	wire [7:0] dataout = sub_wire0[7:0];

	ibuf8_iobuf_in_k8i	ibuf8_iobuf_in_k8i_component (
				.datain (datain),
				.dataout (sub_wire0));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: CONSTANT: enable_bus_hold STRING "FALSE"
// Retrieval info: CONSTANT: number_of_channels NUMERIC "8"
// Retrieval info: CONSTANT: use_differential_mode STRING "FALSE"
// Retrieval info: CONSTANT: use_dynamic_termination_control STRING "FALSE"
// Retrieval info: USED_PORT: datain 0 0 8 0 INPUT NODEFVAL "datain[7..0]"
// Retrieval info: USED_PORT: dataout 0 0 8 0 OUTPUT NODEFVAL "dataout[7..0]"
// Retrieval info: CONNECT: @datain 0 0 8 0 datain 0 0 8 0
// Retrieval info: CONNECT: dataout 0 0 8 0 @dataout 0 0 8 0
// Retrieval info: GEN_FILE: TYPE_NORMAL ibuf8.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL ibuf8.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL ibuf8.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL ibuf8.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL ibuf8_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL ibuf8_bb.v FALSE
// Retrieval info: LIB_FILE: cycloneive

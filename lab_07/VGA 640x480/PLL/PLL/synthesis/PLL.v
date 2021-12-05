// PLL.v

// Generated using ACDS version 12.1sp1 243 at 2014.03.25.15:34:11

`timescale 1 ps / 1 ps
module PLL (
		output wire  clk_1hz_clk,   //   clk_1hz.clk
		output wire  clk_out_clk,   //   clk_out.clk
		input  wire  clk_in_clk,    //    clk_in.clk
		input  wire  reset_reset,   //     reset.reset
		output wire  clk_10khz_clk  // clk_10khz.clk
	);

	PLL_altpll_0 altpll_0 (
		.clk       (clk_in_clk),    //       inclk_interface.clk
		.reset     (reset_reset),   // inclk_interface_reset.reset
		.read      (),              //             pll_slave.read
		.write     (),              //                      .write
		.address   (),              //                      .address
		.readdata  (),              //                      .readdata
		.writedata (),              //                      .writedata
		.c0        (clk_out_clk),   //                    c0.clk
		.c1        (clk_10khz_clk), //                    c1.clk
		.c2        (clk_1hz_clk),   //                    c2.clk
		.areset    (),              //        areset_conduit.export
		.locked    (),              //        locked_conduit.export
		.phasedone ()               //     phasedone_conduit.export
	);

endmodule

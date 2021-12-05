module masterslave (D, clk, Q);
	input D, clk;
	output Q;
	
	wire clkn, Qm, Qs, T /*synthesis keep*/;
	
	assign clkn = ~clk;
	assign T	= clk;
	latchD U1(D, clkn, Qm);
	latchD U2(Qm, T, Qs);
	assign Q = Qs;
	
endmodule
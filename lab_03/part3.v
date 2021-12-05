module part3 (SW, LEDR);
	input [1:0]SW;
	output [0:0]LEDR;
	
	wire clkn, Qm, Qs, T /*synthesis keep*/;
	
	assign clkn = ~SW[1];
	assign T	= SW[1];
	latchD U1(SW[0], clkn, Qm);
	latchD U2(Qm, T, Qs);
	assign LEDR[0] = Qs;
	
endmodule
module part4 (SW, LEDR);
	input [1:0]SW;
	output [5:0]LEDR;
	
	wire clkn, Qa, Qb, Qc/*synthesis keep*/;
	
	assign clkn = ~SW[1];
	assign T	= SW[1];
	latchD U1(SW[0], SW[1], Qa);
	masterslave U2(SW[0], SW[1], Qb);
	masterslave U3(SW[0], clkn, Qc);
	assign LEDR[0] = Qa;
	assign LEDR[1] = ~Qa;
	assign LEDR[2] = Qb;
	assign LEDR[3] = ~Qb;
	assign LEDR[4] = Qc;
	assign LEDR[5] = ~Qc;
	
endmodule
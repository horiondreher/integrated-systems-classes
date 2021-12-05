module part1 (clk, R, S, Q);
	input clk, R, S;
	output Q;
	
	wire R_g, S_g, Qa, Qb /*synthesis keep*/;
	
	assign R_g = R & clk;
	assign S_g = S & clk;
	assign Qa = ~(R_g | Qb);
	assign Qb = ~(S_g | Qa);
	
	assign Q = Qa;
	
endmodule 
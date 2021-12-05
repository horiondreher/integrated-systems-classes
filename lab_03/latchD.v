module latchD (D, clk, Q);
	input D, clk;
	output Q;
	
	wire S, R, R_g, S_g, Qa, Qb /*synthesis keep*/;
	
	assign S = D;
	assign R = ~D;
	assign R_g = ~(R & clk);
	assign S_g = ~(S & clk);
	assign Qa = ~(S_g & Qb);
	assign Qb = ~(R_g & Qa);
	
	assign Q = Qa;
	
endmodule 
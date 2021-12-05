module part2 (SW, LEDR);
	input [1:0]SW;
	output [0:0]LEDR;
	
	wire S, R, R_g, S_g, Qa, Qb /*synthesis keep*/;
	
	assign R = ~SW[0];
	assign R_g = ~(R & SW[1]);
	assign S_g = ~(S & SW[1]);
	assign Qa = ~(S_g & Qb);
	assign Qb = ~(R_g & Qa);
	
	assign S = SW[0];
	assign LEDR[0] = Qa;
	
endmodule 
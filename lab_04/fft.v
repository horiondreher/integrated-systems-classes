module fft(t, clk, clear, q);

	input t, clk, clear;
	output q;

	wire s1, s2, qa, qb;

	assign s1 = ~(qb & t & clk);
	assign s2 = ~(qa & t & clk);
	assign qa = ~(s1 & qb);
	assign qb = ~(clear & s2 & qa); 

	assign q = qa;

endmodule
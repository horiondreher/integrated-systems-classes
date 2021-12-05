module part3 (SW, LEDR, LEDG);
	input [17:0] SW;
	output [17:0] LEDR;
	output [2:0] LEDG;
	wire [2:0] w0, w1, w2;
	assign LEDR = SW;
	mux3 m0 (SW[8:6], SW[11:9], SW[15], w0);
	mux3 m1 (SW[2:0], SW[5:3], SW[15], w1);
	mux3 m2 (w1, w0, SW[16], w2);
	mux3 m3 (w2, SW[14:12], SW[17], LEDG);	
endmodule
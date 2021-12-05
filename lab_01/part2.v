module part2 (SW, LEDR);
	input [16:0] SW;
	output [7:0] LEDR;
	mux m0 (SW[0], SW[8], SW[16], LEDR[0]);
	mux m1 (SW[1], SW[9], SW[16], LEDR[1]);
	mux m2 (SW[2], SW[10], SW[16], LEDR[2]);
	mux m3 (SW[3], SW[11], SW[16], LEDR[3]);
	mux m4 (SW[4], SW[12], SW[16], LEDR[4]);
	mux m5 (SW[5], SW[13], SW[16], LEDR[5]);
	mux m6 (SW[6], SW[14], SW[16], LEDR[6]);
	mux m7 (SW[7], SW[15], SW[16], LEDR[7]);
	
endmodule
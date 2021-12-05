module mux3 (x, y, s, m);
	input [6:0] x, y;
	input s;
	output [2:0] m;
	mux m0 (x[0], y[0], s, m[0]);
	mux m1 (x[1], y[1], s, m[1]);
	mux m2 (x[2], y[2], s, m[2]);
endmodule
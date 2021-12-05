module mux (x, y, s, m);
	input x, y, s;
	output m;
	assign m = (~s & x) | (s & y);
endmodule
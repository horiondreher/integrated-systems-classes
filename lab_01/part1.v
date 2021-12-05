module part1 (SW, LEDR);

	input [17:0] SW; // chaves
	output [17:0] LEDR; // LEDs vermelhos
	assign LEDR = SW;
		
endmodule
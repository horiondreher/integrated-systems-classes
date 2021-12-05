module part1 (SW, KEY, HEX);

	input [1:0] SW, KEY;
	output [6:0]HEX;

	wire [15:0] qOut, andOut;

	genvar i;

	generate
		
		fft ff0(SW[1], KEY[0], SW[0], qOut[0]);
		assign andOut[0] = qOut[0] & SW[1];

		for(i = 1; i < 16; i = i + 1)	begin : flip_flop
			assign andOut[i] = qOut[i] & andOut[i-1];
			fft ff(andOut[i-1], KEY[0], SW[0], qOut[i]);
		end
		
	endgenerate

endmodule
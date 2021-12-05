module part5 (SW, KEY, HEX4, HEX5, HEX6, HEX7);
	input [15:0] SW;
	input [1:0] KEY;
	output [6:0] HEX4, HEX5, HEX6, HEX7;
	reg [15:0] A;
	wire [3:0] one, ten, hundred, thousands;
	
	always @(negedge KEY[1]) begin
			if(KEY[0] == 0)
			A = 16'b0;
			else
			A = SW;
	end
	binary2BCD b0 (A, one, ten, hundred, thousands);
	bcd2Hex bcd0 (one, HEX4);
	bcd2Hex bcd1 (ten, HEX5);
	bcd2Hex bcd2 (hundred, HEX6);
	bcd2Hex bcd3 (thousands, HEX7);
endmodule
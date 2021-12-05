module part7(SW, HEX0, HEX1);

	input [5:0] SW;
	output [6:0] HEX0, HEX1;
	wire [3:0] ones, tens, hundreds;
	wire [6:0] hw0, hw1;
	
	binary2BCD b2b({2'b00, SW}, ones, tens, hundreds);
	bcd2Hex h0(ones, hw0);
	bcd2Hex h1(tens, hw1);
	
	assign HEX0 = hw0;
	assign HEX1 = hw1;
	
endmodule
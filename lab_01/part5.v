module part5(CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	input CLOCK_50;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	
	reg [2:0] counter;
	reg [6:0] BR = 7'b1111111;
	reg [6:0] H = 7'b0001001;
	reg [6:0] E = 7'b0000110;
	reg [6:0] L = 7'b1000111;
	reg [6:0] O = 7'b1000000;
	reg [56:0] word;
	wire clk;
	
	clockDivider clk50 (CLOCK_50, clk);
	
	always@(posedge clk)
		begin
			case(counter)
				3'b000 : word = {BR, BR, BR, H, E, L, L, O};
				3'b001 : word = {BR, BR, H, E, L, L, O, BR};
				3'b010 : word = {BR, H, E, L, L, O, BR, BR};
				3'b011 : word = {H, E, L, L, O, BR, BR, BR};
				3'b100 : word = {E, L, L, O, BR, BR, BR, H};
				3'b101 : word = {L, L, O, BR, BR, BR, H, E};
				3'b110 : word = {L, O, BR, BR, BR, H, E, L};
				3'b111 : word = {O, BR, BR, BR, H, E, L, L};
			endcase
			counter <= counter + 1;
		end
		
	assign HEX0 = word[6:0];
	assign HEX1 = word[13:7];
	assign HEX2 = word[20:14];
	assign HEX3 = word[27:21];
	assign HEX4 = word[34:28];
	assign HEX5 = word[41:35];
	assign HEX6 = word[48:42];
	assign HEX7 = word[56:49];
	
endmodule
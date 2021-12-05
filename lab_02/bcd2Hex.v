module bcd2Hex(bcd, hex);
	input [3:0] bcd;
	output reg [6:0] hex;

	reg [6:0] ZERO = 7'b1000000;
	reg [6:0] UM = 7'b1111001;
	reg [6:0] DOIS = 7'b0100100;
	reg [6:0] TRES = 7'b0110000;
	reg [6:0] QUATRO = 7'b0011001;
	reg [6:0] CINCO = 7'b0010010;
	reg [6:0] SEIS = 7'b0000010;
	reg [6:0] SETE = 7'b1011000;
	reg [6:0] OITO = 7'b0000000;
	reg [6:0] NOVE = 7'b0010000;
	
	always@(bcd)
	begin
		case(bcd)
			4'b0000 : hex = ZERO;
			4'b0001 : hex = UM;
			4'b0010 : hex = DOIS;
			4'b0011 : hex = TRES;
			4'b0100 : hex = QUATRO;
			4'b0101 : hex = CINCO;
			4'b0110 : hex = SEIS;
			4'b0111 : hex = SETE;
			4'b1000 : hex = OITO;
			4'b1001 : hex = NOVE;	
		endcase
	end
endmodule
module part1(SW, HEX0, HEX1, HEX2, HEX3);
	input [15:0] SW;
	output reg [6:0] HEX0, HEX1, HEX2, HEX3;
	
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
	reg [6:0] NULL = 7'b1111111;
	
	always@(SW)
	begin
			case(SW[3:0])
				4'b0000 : HEX0 = ZERO;
				4'b0001 : HEX0 = UM;
				4'b0010 : HEX0 = DOIS;
				4'b0011 : HEX0 = TRES;
				4'b0100 : HEX0 = QUATRO;
				4'b0101 : HEX0 = CINCO;
				4'b0110 : HEX0 = SEIS;
				4'b0111 : HEX0 = SETE;
				4'b1000 : HEX0 = OITO;
				4'b1001 : HEX0 = NOVE;
				4'b1010 : HEX0 = NULL;
				4'b1011 : HEX0 = NULL;
				4'b1100 : HEX0 = NULL;
				4'b1101 : HEX0 = NULL;
				4'b1110 : HEX0 = NULL;
				4'b1111 : HEX0 = NULL;
	
			endcase
			case(SW[7:4])
				4'b0000 : HEX1 = ZERO;
				4'b0001 : HEX1 = UM;
				4'b0010 : HEX1 = DOIS;
				4'b0011 : HEX1 = TRES;
				4'b0100 : HEX1 = QUATRO;
				4'b0101 : HEX1 = CINCO;
				4'b0110 : HEX1 = SEIS;
				4'b0111 : HEX1 = SETE;
				4'b1000 : HEX1 = OITO;
				4'b1001 : HEX1 = NOVE;
				4'b1010 : HEX1 = NULL;
				4'b1011 : HEX1 = NULL;
				4'b1100 : HEX1 = NULL;
				4'b1101 : HEX1 = NULL;
				4'b1110 : HEX1 = NULL;
				4'b1111 : HEX1 = NULL;
			endcase
				case(SW[11:8])
				4'b0000 : HEX2 = ZERO;
				4'b0001 : HEX2 = UM;
				4'b0010 : HEX2 = DOIS;
				4'b0011 : HEX2 = TRES;
				4'b0100 : HEX2 = QUATRO;
				4'b0101 : HEX2 = CINCO;
				4'b0110 : HEX2 = SEIS;
				4'b0111 : HEX2 = SETE;
				4'b1000 : HEX2 = OITO;
				4'b1001 : HEX2 = NOVE;
				4'b1010 : HEX2 = NULL;
				4'b1011 : HEX2 = NULL;
				4'b1100 : HEX2 = NULL;
				4'b1101 : HEX2 = NULL;
				4'b1110 : HEX2 = NULL;
				4'b1111 : HEX2 = NULL;
			endcase
			case(SW[15:12])
				4'b0000 : HEX3 = ZERO;
				4'b0001 : HEX3 = UM;
				4'b0010 : HEX3 = DOIS;
				4'b0011 : HEX3 = TRES;
				4'b0100 : HEX3 = QUATRO;
				4'b0101 : HEX3 = CINCO;
				4'b0110 : HEX3 = SEIS;
				4'b0111 : HEX3 = SETE;
				4'b1000 : HEX3 = OITO;
				4'b1001 : HEX3 = NOVE;
				4'b1010 : HEX3 = NULL;
				4'b1011 : HEX3 = NULL;
				4'b1100 : HEX3 = NULL;
				4'b1101 : HEX3 = NULL;
				4'b1110 : HEX3 = NULL;
				4'b1111 : HEX3 = NULL;
			endcase
		end
		
endmodule
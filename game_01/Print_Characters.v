`timescale 1us / 1ps

module Print_Characters(CLK, LINE1, LINE2, PNTS1, PNTS2, PM_CLK, PM_POS, RDY, DATA_OUT, ENB, count_out);
	
	input CLK;
	input [15:0] LINE1, LINE2, PNTS1, PNTS2;
	input RDY, PM_CLK, PM_POS;
	
	output [5:0] count_out;
	
	output reg [9:0] DATA_OUT;
	output reg ENB;
	
	reg [5:0] COUNTER = 1'b0;
	reg [3:0] STATE = 1'b0;
	
	assign count_out = COUNTER;
	
	always @(posedge CLK) begin
		if(RDY == 1'b1 && ENB == 1'b0) begin
			ENB = 1'b1;			
			case(STATE)
				0: begin
					case(COUNTER)
						0:	DATA_OUT = 10'b0001000000;	
						1:	DATA_OUT = 10'b1000000000;	
						2:	DATA_OUT = 10'b1000001111;	
						3:	DATA_OUT = 10'b1000011110;	
						4:	DATA_OUT = 10'b1000011100;
						5:	DATA_OUT = 10'b1000011100;	
						6:	DATA_OUT = 10'b1000011110;	
						7:	DATA_OUT = 10'b1000001111;	
						8:	DATA_OUT = 10'b1000000000;	
							
						9:	DATA_OUT = 10'b0001001000;	
						10:DATA_OUT = 10'b1000000000;	
						11:DATA_OUT = 10'b1000001110;
						12:DATA_OUT = 10'b1000011111;
						13:DATA_OUT = 10'b1000011111;
						14:DATA_OUT = 10'b1000011111;
						15:DATA_OUT = 10'b1000011111;
						16:DATA_OUT = 10'b1000001110;
						17:DATA_OUT = 10'b1000000000;
								
						18:DATA_OUT = 10'b0001010000;	
						19:DATA_OUT = 10'b1000000000;	
						20:DATA_OUT = 10'b1000001110;
						21:DATA_OUT = 10'b1000011111;
						22:DATA_OUT = 10'b1000010101;
						23:DATA_OUT = 10'b1000011111;
						24:DATA_OUT = 10'b1000011111;
						25:DATA_OUT = 10'b1000011111;
						26:DATA_OUT = 10'b1000000000;	
						
						27:DATA_OUT = 10'b0001011000;	
						28:DATA_OUT = 10'b1000000000;	
						29:DATA_OUT = 10'b1000000000;
						30:DATA_OUT = 10'b1000000100;
						31:DATA_OUT = 10'b1000001110;
						32:DATA_OUT = 10'b1000001110;
						33:DATA_OUT = 10'b1000000100;	
						34:DATA_OUT = 10'b1000000000;	
						35:DATA_OUT = 10'b1000000000;
					endcase
					
					if(COUNTER < 36)
						COUNTER = COUNTER + 1'b1;
					else begin
						DATA_OUT = 10'b0010000000;
						STATE = 3'b001;
						COUNTER = 1'b0;
					end
				end
				//---------------------------------------------------------------------------------------
				1: begin
					if(PNTS1[COUNTER] == 1'b1)
						DATA_OUT = 10'b1000000011;
					else if(PNTS1[COUNTER] == 1'b0)
						DATA_OUT = 10'b1000100000;
						
					if(COUNTER < 16)
						COUNTER = COUNTER + 1'b1;
					else begin
						DATA_OUT = 10'b0011000000;
						COUNTER = 1'b0;
						STATE = 3'b010;
					end
				end
				//---------------------------------------------------------------------------------------
				2: begin
					if(PNTS2[COUNTER] == 1'b1)
						DATA_OUT = 10'b1000000011;
					else if(PNTS2[COUNTER] == 1'b0)
						DATA_OUT = 10'b1000100000;
							
					if(COUNTER < 16)
						COUNTER = COUNTER + 1'b1;
					else begin
						DATA_OUT = 10'b0010000000;
						COUNTER = 1'b0;
						STATE = 3'b011;
					end
				end
				//---------------------------------------------------------------------------------------
				3: begin
					if(COUNTER >= 16) begin
						DATA_OUT = 10'b0011000000;
						COUNTER = 1'b0;
						STATE = 3'b100;
					end
					else begin
						if(LINE1[COUNTER] == 1'b1)
							DATA_OUT = 10'b1000000010;
						else if(LINE1[COUNTER] == 1'b0)
							DATA_OUT = 10'b1000100000;
							
							COUNTER = COUNTER + 1'b1;
					end
				end
				//---------------------------------------------------------------------------------------
				4: begin
					if(COUNTER >= 16) begin
						COUNTER = 1'b0;
						STATE = 3'b101;
					end
					else begin
						if(LINE2[COUNTER] == 1'b1)
							DATA_OUT = 10'b1000000010;
						else if(LINE2[COUNTER] == 1'b0)
							DATA_OUT = 10'b1000100000;
							
						COUNTER = COUNTER + 1'b1;
					end
				end
				//---------------------------------------------------------------------------------------
				5: begin
					case(COUNTER) 
						0: begin
							if(PM_POS == 1'b1)
								DATA_OUT = 10'b0010000001;
							else if (PM_POS == 1'b0)
								DATA_OUT = 10'b0011000001;
						end
						1: begin
							if(PM_CLK == 1'b0)
								DATA_OUT = 10'b1000000000;
							else if (PM_CLK == 1'b1)
								DATA_OUT = 10'b1000000001;
						end
					endcase
					
					if(COUNTER < 2)
						COUNTER = COUNTER + 1'b1;
					else begin
						DATA_OUT = 10'b0010000000;
						STATE = 3'b001;
						COUNTER = 1'b0;
					end
				end
			endcase
		end
		else begin
			ENB = 1'b0;
		end
	end
endmodule
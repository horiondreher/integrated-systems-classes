`timescale 1ns / 1ps

module LCD_Controller(CLOCK_50, DATA, ENB, RST, LCD_RS, LCD_RW, LCD_EN, LCD_DATA, RDY);

	input CLOCK_50;	
	input [9:0] DATA;
	input ENB, RST;

	output reg RDY;
	output reg LCD_RS, LCD_RW, LCD_EN;
	output reg [7:0] LCD_DATA;
	
	parameter [5:0] FREQ 				= 50; 
	parameter [7:0] POWER_UP			= 8'b00110000;	
	parameter [7:0] SETUP				= 8'b00111000;	
	parameter [7:0] NOTHING				= 8'b00000000;
	parameter [7:0] DISPLAY_ON_OFF	= 8'b00001100;	
	parameter [7:0] CLEAR				= 8'b00000001;
	parameter [7:0] ENTRY_MODE			= 8'b00000110;
	
	reg [3:0] STATE = 0;
	integer COUNTER = 0;

	always @(posedge CLOCK_50) begin
		case(STATE) 
			0: begin		//-------------------------------------Power On
				RDY = 0;
				if(COUNTER < (50000 * FREQ)) begin
					STATE = STATE;
					COUNTER = COUNTER + 1;
				end
				else begin
					COUNTER = 0;
					LCD_RS = 0;
					LCD_RW = 0;
					LCD_DATA = POWER_UP;
					STATE = 1;
				end
			end
			
			1: begin		//-------------------------------------Initialize
				RDY = 0;
				COUNTER = COUNTER + 1;
				if(COUNTER < (10 * FREQ)) begin
					LCD_DATA = SETUP;
					LCD_EN = 1;
					STATE = STATE;
				end
				else if(COUNTER < (60 * FREQ)) begin
					LCD_DATA = NOTHING;
					LCD_EN = 0;
					STATE = STATE;
				end
				else if(COUNTER < (70 * FREQ)) begin
					LCD_DATA = DISPLAY_ON_OFF;
					LCD_EN = 1;
					STATE = STATE;
				end
				else if(COUNTER < (120 * FREQ)) begin
					LCD_DATA = NOTHING;
					LCD_EN = 0;
					STATE = STATE;
				end
				else if(COUNTER < (130 * FREQ)) begin
					LCD_DATA = CLEAR;
					LCD_EN = 1;
					STATE = STATE;
				end
				else if(COUNTER < (2130 * FREQ)) begin
					LCD_DATA = NOTHING;
					LCD_EN = 0;
					STATE = STATE;
				end
				else if(COUNTER < (2140 * FREQ)) begin
					LCD_DATA = ENTRY_MODE;
					LCD_EN = 1;		
					STATE = STATE;
				end
				else if(COUNTER < (2200 * FREQ)) begin
					LCD_DATA = NOTHING;
					LCD_EN = 0;
					STATE = STATE;
				end
				else begin
					COUNTER = 0;
					RDY = 1;
					STATE = 2;
				end
			end

			2: begin //------------------------------------- Ready
				if(ENB == 1) begin
					LCD_RS = DATA[9];
					LCD_RW = DATA[8];
					LCD_DATA = DATA[7:0];
					RDY = 0;
					COUNTER = 0;
					STATE = 3;
				end
				else begin
					RDY = 1;
					LCD_RS = 0;
					LCD_RW = 0;
					LCD_DATA = NOTHING;
					COUNTER = 0;
					STATE = 2;
				end
			end
		
			3: begin //-------------------------------------Send
				RDY = 0;
				if(COUNTER < (50 * FREQ)) begin
					RDY = 0;
					if(COUNTER < FREQ)
						LCD_EN = 0;
					else if(COUNTER < (14 * FREQ)) 
						LCD_EN = 1;
					else if(COUNTER < (27 * FREQ)) 
						LCD_EN = 0;
						
					COUNTER = COUNTER + 1;
					STATE = 3;
				end
				else begin
					COUNTER = 0;
					STATE = 2;
				end
			end
		endcase
		
		if(RST == 1)
			STATE = 0;
	end
endmodule

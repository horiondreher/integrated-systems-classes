module Joguinho(SW, CLOCK_50, LCD_RS, LCD_RW, LCD_EN, LCD_DATA);
	
	input [0:0] SW;
	input CLOCK_50;
	output LCD_RS, LCD_RW, LCD_EN;
	output [7:0] LCD_DATA;
	
	wire [15:0] LINE1, LINE2, PNTS1, PNTS2;
	wire RDY, ENB, RST, CLK_POS, PM_CLK, BUSY;
	wire [9:0] DATA;
	wire [1:0] OPER;
	wire [31:0] POS_COUNTER;
	
	Clock_Divider m0(CLOCK_50, CLK_POS);
	PacMan_Divider m1(CLOCK_50, PM_CLK);
	
	Shifter m2(CLK_POS, RST, LINE1, LINE2, PNTS1, PNTS2);
	Print_Characters m3(CLOCK_50, LINE1, LINE2, PNTS1, PNTS2, PM_CLK, SW[0], RDY,DATA, ENB);
	Comparator m4(LINE1, LINE2, PNTS1, PNTS2, SW[0], RST);
	LCD_Controller m5(CLOCK_50, DATA, ENB, 1'b0, LCD_RS, LCD_RW, LCD_EN, LCD_DATA, RDY);
	
endmodule
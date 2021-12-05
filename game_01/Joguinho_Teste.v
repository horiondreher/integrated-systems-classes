module Joguinho_Teste(CLOCK_50, LCD_RS, LCD_RW, LCD_EN, LCD_DATA);
	
	input CLOCK_50;
	output LCD_RS, LCD_RW, LCD_EN;
	
	output [7:0] LCD_DATA;
	wire RDY, ENB;
	wire [9:0] DATA;
	wire [1:0] OPER;
	
	Hello_World m0 (CLOCK_50, RDY, DATA, ENB);
	//FPGA_2_LCD m1(CLOCK_50, LCD_RS, LCD_RW, LCD_E, LCD_DATA, RDY, DATA, OPER, 1'b1, 1'b0);
	
	//Clock_Divider m0(CLOCK_50, CLOCK_1);
	//PacMan_Divider m1(CLOCK_50, PM_CLK);
	
	//Shifter m2(CLOCK_1, LINE1, LINE2);
	//Print_Characters m3(LINE1, LINE2, PM_CLK, SW[0], RDY, DATA);
	LCD_Controller m4(CLOCK_50, DATA, ENB, 1'b0, LCD_RS, LCD_RW, LCD_EN, LCD_DATA, RDY);
	
endmodule
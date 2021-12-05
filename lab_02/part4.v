module part4 (SW, LEDR, LEDG, HEX0, HEX1, HEX4, HEX6); 
   input [8:0] SW; 
	output [7:0] LEDR;
   output [5:0] LEDG; 
	output [7:0] HEX0, HEX1, HEX4, HEX6;
	wire co0, co1, co2;
	wire [5:0] fioout;
	wire [8:0] fioin;
	wire [3:0] ones, tens, hundreds;
	assign fioin = SW;
	assign fioout = LEDG;
	assign LEDR = SW;
   addcompleto add0 (SW[4], SW[0], SW[8], LEDG[0], co0); 
   addcompleto add1 (SW[5], SW[1], co0, LEDG[1], co1); 
   addcompleto add2 (SW[6], SW[2], co1, LEDG[2], co2); 
   addcompleto add3 (SW[7], SW[3], co2, LEDG[3], LEDG[4]); 
	binary2BCD b2b(fioout, ones, tens, hundreds);
	bcd2Hex h0(ones, HEX0);
	bcd2Hex h1(tens, HEX1);
	bcd2Hex h4(fioin [3:0], HEX4);
	bcd2Hex h6(fioin [7:4], HEX6);
	
endmodule
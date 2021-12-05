module part3 (SW, LEDR, LEDG); 
   input [7:0] SW; 
	output [7:0] LEDR;
   output [4:0] LEDG; 
	wire co0, co1, co2;
	assign LEDR = SW;
   addcompleto add0 (SW[4], SW[0], 1'b0, LEDG[0], co0); 
   addcompleto add1 (SW[5], SW[1], co0, LEDG[1], co1); 
   addcompleto add2 (SW[6], SW[2], co1, LEDG[2], co2); 
   addcompleto add3 (SW[7], SW[3], co2, LEDG[3], LEDG[4]); 
endmodule 
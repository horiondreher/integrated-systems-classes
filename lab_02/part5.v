module part5(SW, LEDR, HEX0, HEX1, HEX2, HEX4, HEX5, HEX6, HEX7);

	input [15:0] SW; 
	
	output [15:0] LEDR;
   //output [7:0] LEDG; 
	output [7:0] HEX0, HEX1, HEX2, HEX4, HEX5, HEX6, HEX7	;
	
	wire co00, co01, co02, co03;
	wire co10, co11, co12, co13;
	wire [4:0] fioout1, fioout2;
	reg [3:0] fioin1, fioin2, fioin3, fioin4;
	wire [3:0] ones1, tens1, hundreds1, ones2, tens2, hundreds2;
	
	assign LEDR = SW;
	
	always@(SW)
	begin
	
		if(SW[3:0] > 4'b1001)
			fioin1 = 4'b1001;
		else 
			fioin1 = SW[3:0];
			
		if(SW[7:4] > 4'b1001)
			fioin2 = 4'b1001;
		else 
			fioin2 = SW[7:4];
			
		if(SW[11:8] > 4'b1001)
			fioin3 = 4'b1001;
		else 
			fioin3 = SW[11:8];
			
		if(SW[15:12] > 4'b1001)
			fioin4 = 4'b1001;
		else 
			fioin4 = SW[15:12];
			
	end
		
	addcompleto add0 (fioin3[0], fioin1[0], 1'b0, fioout1[0], co00); 
	addcompleto add1 (fioin3[1], fioin1[1], co00, fioout1[1], co01); 
	addcompleto add2 (fioin3[2], fioin1[2], co01, fioout1[2], co02); 
	addcompleto add3 (fioin3[3], fioin1[3], co02, fioout1[3], co03);
	
	addcompleto add4 (fioin4[0], fioin2[0], co03, fioout2[0], co10); 
	addcompleto add5 (fioin4[1], fioin2[1], co10, fioout2[1], co11); 
	addcompleto add6 (fioin4[2], fioin2[2], co11, fioout2[2], co12); 
	addcompleto add7 (fioin4[3], fioin2[3], co12, fioout2[3], fioout2[4]);
	
	binary2BCD b2b1(fioout1, ones1, tens1, hundreds1);
	binary2BCD b2b2(fioout2, ones2, tens2, hundreds2);
	
	bcd2Hex h0(ones1, HEX0);
	bcd2Hex h1(tens1+ones2, HEX1);
	bcd2Hex h2(tens2, HEX2);
	
	bcd2Hex h4(fioin1 [3:0], HEX4);
	bcd2Hex h5(fioin2 [3:0], HEX5);
	bcd2Hex h6(fioin3 [3:0], HEX6);
	bcd2Hex h7(fioin4 [3:0], HEX7);

endmodule
module part6(SW, HEX0, HEX1, HEX2);

	input [15:0] SW;
	output [6:0] HEX0, HEX1, HEX2;
	
	reg [4:0] T0, T1;
	reg [3:0] Z0, Z1, S0, S1, S2;
	reg c1, c2;
	
	reg [3:0] fioin1, fioin2, fioin3, fioin4;
	
	bcd2Hex h0(S0, HEX0);
	bcd2Hex h1(S1, HEX1);
	bcd2Hex h2(S2, HEX2);
	
	always @(SW)
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
	
		T0 = fioin1[3:0] + fioin3[3:0];
		
		if (T0 > 5'b01001) begin
			Z0 = 4'b1010;
			c1 = 1'b1;
		end else begin
			Z0 = 4'b0000;
			c1 = 1'b0;
		end
		
		S0 = T0 - Z0;
		T1 = fioin2[3:0] + fioin4[3:0] + c1;
		
		if (T1 > 5'b01001) begin
			Z1 = 4'b1010;
			c2 = 1'b1;
		end else begin
			Z1 = 4'b0000;
			c2 = 1'b0;
		end
		
		S1 = T1 - Z1;
		S2 = c2;
	end 
endmodule
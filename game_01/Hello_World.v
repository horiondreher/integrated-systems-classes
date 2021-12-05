`timescale 1us / 1us

module Hello_World(CLK, RDY, DATA_OUT, ENB);
	
	input CLK, RDY;
	output reg [9:0] DATA_OUT;
	output reg ENB;
	
	reg [5:0] COUNTER = 0;
	reg lastRDY = 1'b0;
	
	always @(posedge CLK) begin
		
		if(RDY == 1'b1 && ENB == 1'b0) begin
			ENB = 1'b1;
			case(COUNTER)
				
				0: DATA_OUT = 10'b0010000000;
				1: DATA_OUT = 10'b1001001000;
				2: DATA_OUT = 10'b1001100101;
				3: DATA_OUT = 10'b1001101100;
				4: DATA_OUT = 10'b1001101100;
				5: DATA_OUT = 10'b1001101111;
				//-------------------------------------
				6: DATA_OUT = 10'b0011000000;
				7: DATA_OUT = 10'b1001010111;
				8: DATA_OUT = 10'b1001101111;
				9: DATA_OUT = 10'b1001110010;
				10: DATA_OUT = 10'b1001101100;
				//-------------------------------------
			endcase
		
			if(COUNTER < 11)
				COUNTER = COUNTER + 1'b1;
			else
				COUNTER = 0;
				
			lastRDY = 1'b1;
		end
		else
			ENB = 1'b0;
	end
endmodule
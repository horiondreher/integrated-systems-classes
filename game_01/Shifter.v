module Shifter(CLK, RST, LINE1, LINE2, PNTS1, PNTS2);
	
	input CLK, RST;
	output reg [15:0] LINE1, LINE2, PNTS1, PNTS2;
	
	reg line1_mem [0:511];
	reg line2_mem [0:511];
	reg point1_mem [0:511];
	reg point2_mem [0:511];
	
	initial begin
		$readmemb("line1.txt", line1_mem, 0, 511);
		$readmemb("line2.txt", line2_mem, 0, 511);
		$readmemb("point1.txt", point1_mem, 0, 511);
		$readmemb("point2.txt", point2_mem, 0, 511);
	end
	
	reg [511:0] COUNTER = 0;
	reg STATE = 0;
	
	always @(posedge CLK) begin
		
		case(STATE)
			0: begin
				LINE1[15] = line1_mem[COUNTER];
				LINE2[15] = line2_mem[COUNTER];
			
				PNTS1[15] = point1_mem[COUNTER];
				PNTS2[15] = point2_mem[COUNTER];
				
				COUNTER = COUNTER + 1'b1;
			end
			1: begin
				LINE1 = LINE1 >> 1'b1;
				LINE2 = LINE2 >> 1'b1;
				PNTS1 = PNTS1 >> 1'b1;
				PNTS2 = PNTS2 >> 1'b1;
			end			
		endcase 
		
		if(COUNTER >= 512 || RST == 1'b1) begin
			COUNTER = 0;
			LINE1 = 16'b000000000000;
			LINE2 = 16'b000000000000;
			PNTS1 = 16'b000000000000;
			PNTS2 = 16'b000000000000;
		end
			
		if(STATE == 1'b0)
			STATE = 1'b1;
		else 
			STATE = 1'b0;
			
	end
	
endmodule 
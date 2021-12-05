module Comparator(LINE1, LINE2, PNTS1, PNTS2, PM_POS, RST);

	input [15:0] LINE1, LINE2, PNTS1, PNTS2;
	input PM_POS;
	
	output reg RST;
	
	always @(LINE1 or LINE2 or PNTS1 or PNTS2 or PM_POS) begin
		
		if(LINE1[1] == 1 && PM_POS == 1)
			RST = 1;
		else if (LINE2[1] == 1 && PM_POS == 0)
			RST = 1;
		else 
			RST = 0;
	end

endmodule 
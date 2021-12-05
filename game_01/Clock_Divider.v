module Clock_Divider(CLOCK_50, CLK_OUT);

	input CLOCK_50;
	output CLK_OUT;
	
	reg [24:0] COUNT = 0;
	reg CLK_OUT = 0;

	always @(posedge CLOCK_50) 
	begin
		if (COUNT < 24999999) begin
				COUNT <= COUNT + 1;
		end
		else begin
			COUNT <= 0;
			CLK_OUT <= ~CLK_OUT;
		end
	end
endmodule  
module clockDivider(clk_50mhz, clkOut);

	input clk_50mhz;
	output clkOut;
	
	reg [24:0] count_reg = 0;
	reg clkOut = 0;

	always @(posedge clk_50mhz) 
	begin
		if (count_reg < 24999999) begin
				count_reg <= count_reg + 1;
		end
		else begin
			count_reg <= 0;
			clkOut <= ~clkOut;
		end
	end
endmodule
module clk_1hz(clk_50mhz, clk);

	input clk_50mhz;
	output clk;
	
	reg [24:0] count_reg = 0;
	reg clk = 0;

	always @(posedge clk_50mhz) begin
		if (count_reg < 24999999)
			count_reg <= count_reg + 1;
		else begin
			count_reg <= 0;
			clk <= ~clk;
		end
	end
endmodule
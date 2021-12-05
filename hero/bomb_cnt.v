module bomb_cnt(
	input clk_1hz,
	input b_key,
	output reg [3:0] b_cnt
);

always @(posedge clk_1hz) begin
	
	if(b_key == 1 || b_cnt != 4'h0) begin
		b_cnt <= b_cnt + 4'h1;
		
		if(b_cnt >= 3)
			b_cnt <= 4'h0;
	end
		
end

endmodule
module bomb(
	input [9:0] char_pos_x,
	input [9:0] char_pos_y,
	input clk_1hz,
	input b_key,	
	output reg [9:0] bomb_pos_x,
	output reg [9:0] bomb_pos_y,
	output [3:0] b_cnt
);

bomb_cnt m1(clk_1hz, b_key, b_cnt);

always @(posedge b_key) begin

	bomb_pos_x <= char_pos_x;
	bomb_pos_y <= char_pos_y;

end

endmodule

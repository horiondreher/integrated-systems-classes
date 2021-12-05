module rgb_out(
	input 	[7:0] r_status,
	input 	[7:0] g_status,
	input 	[7:0] b_status,
	
	input 	[7:0] r_level_one_part_one,
	input 	[7:0] g_level_one_part_one,
	input 	[7:0] b_level_one_part_one,
	
	input 	[7:0] r_level_one_part_two,
	input 	[7:0] g_level_one_part_two,
	input		[7:0] b_level_one_part_two,
	
	input 	[7:0] r_level_two_part_one,
	input 	[7:0] g_level_two_part_one,
	input		[7:0] b_level_two_part_one,
	
	input 	[7:0] r_level_two_part_two,
	input 	[7:0] g_level_two_part_two,
	input		[7:0] b_level_two_part_two,
	
	input 	[7:0] r_level_two_part_three,
	input 	[7:0] g_level_two_part_three,
	input		[7:0] b_level_two_part_three,
	
	input 	[7:0] r_level_two_part_four,
	input 	[7:0] g_level_two_part_four,
	input		[7:0] b_level_two_part_four,
	
	input 	[7:0] r_level_three_part_one,
	input 	[7:0] g_level_three_part_one,
	input		[7:0] b_level_three_part_one,
	
	input 	[7:0] r_level_three_part_two,
	input 	[7:0] g_level_three_part_two,
	input		[7:0] b_level_three_part_two,
	
	input 	[7:0] r_level_three_part_three,
	input 	[7:0] g_level_three_part_three,
	input		[7:0] b_level_three_part_three,
	
	input 	[7:0] r_level_three_part_four,
	input 	[7:0] g_level_three_part_four,
	input		[7:0] b_level_three_part_four,
	
	input 	[7:0] r_level_three_part_five,
	input 	[7:0] g_level_three_part_five,
	input		[7:0] b_level_three_part_five,
	
	input 	[7:0] r_level_three_part_six,
	input 	[7:0] g_level_three_part_six,
	input		[7:0] b_level_three_part_six,
	
	output 	[7:0] VGA_R,
	output 	[7:0] VGA_G,
	output 	[7:0] VGA_B
);


assign VGA_R = r_status | r_level_one_part_one | r_level_one_part_two | r_level_two_part_one | r_level_two_part_two | r_level_two_part_three | r_level_two_part_four | r_level_three_part_one | r_level_three_part_two | r_level_three_part_three | r_level_three_part_four | r_level_three_part_five | r_level_three_part_six;
assign VGA_G = g_status | g_level_one_part_one | g_level_one_part_two | g_level_two_part_one | g_level_two_part_two | g_level_two_part_three | g_level_two_part_four | g_level_three_part_one | g_level_three_part_two | g_level_three_part_three | g_level_three_part_four | g_level_three_part_five | g_level_three_part_six;
assign VGA_B = b_status | b_level_one_part_one | b_level_one_part_two | b_level_two_part_one | b_level_two_part_two | b_level_two_part_three | b_level_two_part_four | b_level_three_part_one | b_level_three_part_two | b_level_three_part_three | b_level_three_part_four | b_level_three_part_five | b_level_three_part_six;

endmodule
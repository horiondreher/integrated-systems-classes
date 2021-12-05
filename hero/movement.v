module movement(
	input u_arr,
	input d_arr,
	input l_arr,
	input r_arr,
	input clk_char,
	input collision,
	input coll_miner,
	input [15:0] death_flag,
	input win_flag,
	output reg [9:0] char_pos_x,
	output reg [9:0] char_pos_y,
	output reg [15:0] active 
);

localparam [9:0] initial_pos_x = 175;
localparam [9:0] initial_pos_y = 100;

reg [2:0] last_button;

initial begin
	char_pos_x <= initial_pos_x;
	char_pos_y <= initial_pos_y;
	last_button <= 0;
	active <= 16'b0000000000000001;
end

always @(posedge clk_char) begin
	if(u_arr == 0) begin
		last_button <= 0;
		if (collision == 0)
			char_pos_y <= char_pos_y - 1'b1;
		else if (collision == 1)
			char_pos_y <= char_pos_y + 1'b1;
	end

	if(d_arr == 0) begin
		last_button <= 1;
		if (collision == 0) 
			char_pos_y <= char_pos_y + 1'b1;
		else if (collision == 1)
			char_pos_y <= char_pos_y - 1'b1;
	end

	if(l_arr == 0) begin
		last_button <= 2;
		if (collision == 0)
			char_pos_x <= char_pos_x - 1'b1;
		else if (collision == 1)
			char_pos_x <= char_pos_x + 1'b1;
	end

	if(r_arr == 0) begin
		last_button <= 3;
		if (collision == 0)
			char_pos_x <= char_pos_x + 1'b1;
		else if (collision == 1)
			char_pos_x <= char_pos_x - 1'b1;
	end
	
	if(last_button == 0 && collision == 1) // cima
		char_pos_y <= char_pos_y + 1'b1;
	if(last_button == 1 && collision == 1) // baixo
		char_pos_y <= char_pos_y - 1'b1;
	if(last_button == 2 && collision == 1)	// esquerda
		char_pos_x <= char_pos_x + 1'b1;
	if(last_button == 3 && collision == 1) // direita
		char_pos_x <= char_pos_x - 1'b1;
		
	if (death_flag != 16'b000000000000000) begin
		active <= 16'b0000000000000001;
		char_pos_x <= initial_pos_x;
		char_pos_y <= initial_pos_y;
	end
		
	if(char_pos_y >= 400) begin
		case(active)
			16'b0000000000000001: begin
				active <= 16'b0000000000000010;
				char_pos_y <= 50;
			end
			16'b0000000000000100: begin
				active <= 16'b0000000000001000;
				char_pos_y <= 50;
			end
			16'b0000000000001000: begin
				active <= 16'b0000000000010000;
				char_pos_y <= 50;
			end
			16'b0000000000010000: begin
				active <= 16'b0000000000100000;
				char_pos_y <= 50;
			end
			16'b0000000001000000: begin
				active <= 16'b0000000010000000;
				char_pos_y <= 50;
			end
			16'b0000000010000000: begin
				active <= 16'b0000000100000000;
				char_pos_y <= 50;
			end
			16'b0000000100000000: begin
				active <= 16'b0000001000000000;
				char_pos_y <= 50;
			end
			16'b0000001000000000: begin
				active <= 16'b0000010000000000;
				char_pos_y <= 50;
			end
			16'b0000010000000000: begin
				active <= 16'b0000100000000000;
				char_pos_y <= 50;
			end
			16'b0000100000000000: begin
				active <= 16'b0001000000000000;
				char_pos_y <= 50;
			end
			default: char_pos_y <= char_pos_y - 1'b1;
		endcase
	end
	if(char_pos_y <= 40) begin
		case(active)
			16'b0000000000000001: begin
				char_pos_y <= char_pos_y + 1'b1;
			end
			16'b0000000000000010: begin
				active <= 16'b0000000000000001;
				char_pos_y <= 350;
			end
			16'b0000000000000100: begin
				char_pos_y <= char_pos_y + 1'b1;
			end
			16'b0000000000001000: begin
				active <= 16'b0000000000000100;
				char_pos_y <= 350;
			end
			16'b0000000000010000: begin
				active <= 16'b0000000000001000;
				char_pos_y <= 350;
			end
			16'b0000000000100000: begin
				active <= 16'b0000000000010000;
				char_pos_y <= 350;
			end
			16'b0000000001000000: begin
				char_pos_y <= char_pos_y + 1'b1;
			end
			16'b0000000010000000: begin
				active <= 16'b0000000010000000;
				char_pos_y <= 350;
			end
			16'b0000000100000000: begin
				active <= 16'b0000000100000000;
				char_pos_y <= 350;
			end
			16'b0000001000000000: begin
				active <= 16'b0000001000000000;
				char_pos_y <= 350;
			end
			16'b0000010000000000: begin
				active <= 16'b0000010000000000;
				char_pos_y <= 350;
			end
			16'b0000100000000000: begin
				active <= 16'b0000100000000000;
				char_pos_y <= 350;
			end
			default: char_pos_y <= char_pos_y + 1'b1;
		endcase
			
	end
	if(coll_miner == 1)begin
		case(active)
			16'b0000000000000010: active <= 16'b0000000000000100;
			16'b0000000000100000: active <= 16'b0000000001000000;
			//10'b0000100000000000: active = 10'b0000000000000001;
		endcase
		char_pos_x <= initial_pos_x;
		char_pos_y <= initial_pos_y;
	end
end

endmodule 
module level_three_part_two(
	input active,
	input enable,
	input [9:0] col,
	input [9:0] row,
	input [9:0] char_pos_x,
	input [9:0] char_pos_y,
	input [9:0] bomb_pos_x,
	input [9:0] bomb_pos_y,
	input [3:0] b_cnt,
	input f_key,
	output [7:0] VGA_R,
	output [7:0] VGA_G,
	output [7:0] VGA_B,
	output coll,
	output reg death
);

// Variáveis utilizadas para criação do personagem
localparam [9:0] x_pixels = 635;
localparam [9:0] y_pixels = 475;

localparam [9:0] char_size_x = 13; // Tamanho do personagem
localparam [9:0] char_size_y = 28; // Tamanho do personagem

localparam [9:0] bomb_size = 10; // Tamanho da bomba

localparam [9:0] aranha_size_x = 7; // Tamanho do aranha
localparam [9:0] aranha_size_y = 5; // Tamanho do aranha

wire	[9:0]	l_char_pos_x;	// Lado esquerdo do personagem
wire	[9:0]	r_char_pos_x;	// Lado direito
wire	[9:0]	u_char_pos_y; // Lado de cima
wire	[9:0]	d_char_pos_y; // Lado de baixo

assign l_char_pos_x = char_pos_x - char_size_x; // Distância entre o centro e o lado esquerdo
assign r_char_pos_x = char_pos_x + char_size_x;	// " " lado direito
assign u_char_pos_y = char_pos_y - char_size_y; // " " lado de cima
assign d_char_pos_y = char_pos_y + char_size_y; // " " lado de baixo

reg	[24:0] 	char	[0:56]; // Desenho do personagem
reg 	[7:0]		char_reg; 
wire	[9:0]	char_fig_x;
wire	[9:0]	char_fig_y;

assign char_fig_x = col - l_char_pos_x;
assign char_fig_y = row - u_char_pos_y;

// Variáveis utilizadas para criação do cenário
reg [7:0]	wall_1, wall_2, wall_3, wall_4, wall_5, wall_6; // Paredes da fase

reg [9:0]	wall_1_l = 0,		wall_1_r = 250,	wall_1_u = 0,		wall_1_d = 125; // Dimensões de cada parede
reg [9:0]	wall_2_l = 325,	wall_2_r = 635,	wall_2_u = 0,		wall_2_d = 125;

reg [9:0]	wall_3_l = 0,		wall_3_r = 75,		wall_3_u = 125,	wall_3_d = 250;
reg [9:0]	wall_4_l = 565,	wall_4_r = 635,	wall_4_u = 125,	wall_4_d = 250;

reg [9:0]	wall_5_l = 0,		wall_5_r = 100,	wall_5_u = 250,	wall_5_d = 375;
reg [9:0]	wall_6_l = 550,	wall_6_r = 635,	wall_6_u = 250,	wall_6_d = 375;

// Colisões
reg coll_edges = 1'b0;
reg coll_1 = 1'b0, coll_2 = 1'b0, coll_3 = 1'b0, coll_4 = 1'b0, coll_5 = 1'b0, coll_6 = 1'b0;

//Variáveis para a bomba
reg 	[7:0] bomb;
wire	[9:0]	l_bomb_pos_x; // Lado esquerdo do personagem
wire	[9:0]	r_bomb_pos_x; // Lado direito
wire	[9:0]	u_bomb_pos_y; // Lado de cima
wire	[9:0]	d_bomb_pos_y; // Lado de baixo

assign l_bomb_pos_x = bomb_pos_x - bomb_size; // Distância entre o centro e o lado esquerdo
assign r_bomb_pos_x = bomb_pos_x + bomb_size; // " " lado direito
assign u_bomb_pos_y = bomb_pos_y - bomb_size; // " " lado de cima
assign d_bomb_pos_y = bomb_pos_y + bomb_size; // " " lado de baixo

//Variáveis aranha

reg 	[9:0] aranha_pos_x = 250;
reg 	[9:0] aranha_pos_y = 200;
reg 			aranha_flag = 0;	

wire	[9:0]	l_aranha_pos_x;	// Lado esquerdo do aranha
wire	[9:0]	r_aranha_pos_x;	// Lado direito
wire	[9:0]	u_aranha_pos_y; // Lado de cima
wire	[9:0]	d_aranha_pos_y; // Lado de baixo

assign l_aranha_pos_x = aranha_pos_x - aranha_size_x; // Distância entre o centro e o lado esquerdo
assign r_aranha_pos_x = aranha_pos_x + aranha_size_x;	// " " lado direito
assign u_aranha_pos_y = aranha_pos_y - aranha_size_y; // " " lado de cima
assign d_aranha_pos_y = aranha_pos_y + aranha_size_y; // " " lado de baixo

reg	[13:0] 	aranha	[0:9]; // Desenho do aranha
reg 	[7:0]		aranha_reg;
wire	[9:0]	aranha_fig_x;
wire	[9:0]	aranha_fig_y;

assign aranha_fig_x = col - l_aranha_pos_x;
assign aranha_fig_y = row - u_aranha_pos_y;

always @(*) begin

	if(enable == 1 && active == 1) begin
	
		if(col > l_char_pos_x && col < r_char_pos_x && row > u_char_pos_y && row < d_char_pos_y) begin
			if(char[char_fig_y][char_fig_x] == 1)
				char_reg <= 8'hc8;
			else 
				char_reg <= 8'h00;
		end
		else 
			char_reg <= 8'h00;
			
		if(col > l_aranha_pos_x && col < r_aranha_pos_x && row > u_aranha_pos_y && row < d_aranha_pos_y) begin
			if(aranha[aranha_fig_y][aranha_fig_x] == 1)
				aranha_reg <= 8'hc8;
			else 
				aranha_reg <= 8'h00;
		end
		else 
			aranha_reg <= 8'h00;
				
		// Criação das paredes 
		wall_1 <= ((col > wall_1_l) && (col < wall_1_r) && (row > wall_1_u) && (row < wall_1_d)) ? 8'haf : 8'h00;
		wall_2 <= ((col > wall_2_l) && (col < wall_2_r) && (row > wall_2_u) && (row < wall_2_d)) ? 8'hff : 8'h00;
		wall_3 <= ((col > wall_3_l) && (col < wall_3_r) && (row > wall_3_u) && (row < wall_3_d)) ? 8'hff : 8'h00;
		wall_4 <= ((col > wall_4_l) && (col < wall_4_r) && (row > wall_4_u) && (row < wall_4_d)) ? 8'haf : 8'h00;
		wall_5 <= ((col > wall_5_l) && (col < wall_5_r) && (row > wall_5_u) && (row < wall_5_d)) ? 8'hff : 8'h00;
		wall_6 <= ((col > wall_6_l) && (col < wall_6_r) && (row > wall_6_u) && (row < wall_6_d)) ? 8'hff : 8'h00;
		
		// Determinação das colisões
		coll_edges <= (r_char_pos_x >= x_pixels) || (l_char_pos_x <= 0) || (u_char_pos_y <= 0) || (d_char_pos_y >= y_pixels) ? 1'b1 : 1'b0;
		
		coll_1 <= (r_char_pos_x >= wall_1_l) && (l_char_pos_x <= wall_1_r) && (u_char_pos_y <= wall_1_d) && (d_char_pos_y >= wall_1_u) ? 1'b1 : 1'b0;
		coll_2 <= (r_char_pos_x >= wall_2_l) && (l_char_pos_x <= wall_2_r) && (u_char_pos_y <= wall_2_d) && (d_char_pos_y >= wall_2_u) ? 1'b1 : 1'b0;
		coll_3 <= (r_char_pos_x >= wall_3_l) && (l_char_pos_x <= wall_3_r) && (u_char_pos_y <= wall_3_d) && (d_char_pos_y >= wall_3_u) ? 1'b1 : 1'b0;
		coll_4 <= (r_char_pos_x >= wall_4_l) && (l_char_pos_x <= wall_4_r) && (u_char_pos_y <= wall_4_d) && (d_char_pos_y >= wall_4_u) ? 1'b1 : 1'b0;
		coll_5 <= (r_char_pos_x >= wall_5_l) && (l_char_pos_x <= wall_5_r) && (u_char_pos_y <= wall_5_d) && (d_char_pos_y >= wall_5_u) ? 1'b1 : 1'b0;
		coll_6 <= (r_char_pos_x >= wall_6_l) && (l_char_pos_x <= wall_6_r) && (u_char_pos_y <= wall_6_d) && (d_char_pos_y >= wall_6_u) ? 1'b1 : 1'b0;
		
		if(b_cnt > 0)
			bomb <= ((col > l_bomb_pos_x) && (col < r_bomb_pos_x) && (row > u_bomb_pos_y) && (row < d_bomb_pos_y)) ? 8'hff : 8'h00;
		if(b_cnt == 3)
			bomb <= ((col > l_bomb_pos_x) && (col < r_bomb_pos_x) && (row > u_bomb_pos_y) && (row < d_bomb_pos_y)) ? 8'h00 : 8'h00;
		
	end
	else begin
		char[0][24:0]   <=	25'b0000000000001111111111111;
		char[1][24:0]	 <=	25'b0000000000001111111111111;
		char[2][24:0]	 <=	25'b0000000000000000111110000;
		char[3][24:0]	 <=	25'b0000000000000000011100000;
		char[4][24:0]   <=	25'b0000000000000000011100000;
		char[5][24:0]	 <=	25'b0000000000000000011100000;
		char[6][24:0]	 <=	25'b0000000000000000011100000;
		char[7][24:0]	 <=	25'b0011111100000000011100000;
		char[8][24:0]   <=	25'b0011111111000000011100000;
		char[9][24:0]	 <=	25'b0000000000110000011100000;
		char[10][24:0]  <=	25'b0000000000111000011100000;
		char[11][24:0]  <=	25'b0000000000111000011100000;
		char[12][24:0]  <=	25'b0000000000111000011100000;
		char[13][24:0]  <=	25'b0000000000111000011100000;
		char[14][24:0]  <=	25'b0000000000110000011100000;
		char[15][24:0]  <=	25'b0011111111000000011100000;
		char[16][24:0]  <=	25'b0011111100000000011100000;
		char[17][24:0]  <=	25'b0000001110000000011100000;
		char[18][24:0]  <=	25'b0000001111100000011100000;
		char[19][24:0]  <=	25'b0000001111110000011111110;
		char[20][24:0]  <=	25'b0000011111111000011111111;
		char[21][24:0]  <=	25'b0000011111111100011111111;
		char[22][24:0]  <=	25'b0011111111111111111111110;
		char[23][24:0]  <=	25'b0111111110000111111111110;
		char[24][24:0]  <=	25'b0011111110000111111111110;
		char[25][24:0]  <=	25'b0111111110000011111111111;
		char[26][24:0]  <=	25'b0111111110000011111111111;
		char[27][24:0]  <=	25'b0011111110000111111111110;
		char[28][24:0]  <=	25'b0000011110000111111100000;
		char[29][24:0]  <=	25'b0000011110000011111100000;
		char[30][24:0]  <=	25'b0000000000000011111100000;
		char[31][24:0]  <=	25'b0011100000000011111100000;
		char[32][24:0]  <=	25'b0011100000000111111000000;
		char[33][24:0]  <=	25'b0000011111111111110000000;
		char[34][24:0]  <=	25'b0000011111111111110000000;
		char[35][24:0]  <=	25'b0000011111111111100000000;
		char[36][24:0]  <=	25'b0000011111111000000000000;
		char[37][24:0]  <=	25'b0000011111111000000000000;
		char[38][24:0]  <=	25'b0000011111111000000000000;
		char[39][24:0]  <=	25'b0000011111111000000000000;
		char[40][24:0]  <=	25'b0000000011111000000000000;
		char[41][24:0]  <=	25'b0000000001111000000000000;
		char[42][24:0]  <=	25'b0000000001111000000000000;
		char[43][24:0]  <=	25'b0000000001111000000000000;
		char[44][24:0]  <=	25'b0000000001111100000000000;
		char[45][24:0]  <=	25'b0000000001111111100000000;
		char[46][24:0]  <=	25'b0000000001111111110000000;
		char[47][24:0]  <=	25'b0000000001111111110000000;
		char[48][24:0]  <=	25'b0000000001111111110000000;
		char[49][24:0]  <=	25'b0000000001111111110000000;
		char[50][24:0]  <=	25'b0000000000000111110000000;
		char[51][24:0]  <=	25'b0000000000000111110000000;
		char[52][24:0]  <=	25'b0000000000000111110000000;
		char[53][24:0]  <=	25'b0000000000000111110000000;
		char[54][24:0]  <=	25'b0000000000000111110000000;
		char[55][24:0]  <=	25'b0000000000000111110000000;
		char[56][24:0]  <=	25'b0000000000000111100000000;
		
		aranha[0][13:0]	<=	14'b00000011000000;
		aranha[1][13:0]	<=	14'b00000011000000;
		aranha[2][13:0]	<=	14'b00000011000000;
		aranha[3][13:0]	<=	14'b00000011000000;
		aranha[4][13:0]	<=	14'b00000011000000;
		aranha[5][13:0]	<=	14'b00000011000000;
		aranha[6][13:0]	<=	14'b00110011001100;
		aranha[7][13:0]	<=	14'b11001111110011;
		aranha[8][13:0]	<=	14'b11000111100011;
		aranha[9][13:0]	<=	14'b11000000000011;
		
		wall_1 <= 8'h00;
		wall_2 <= 8'h00;
		wall_3 <= 8'h00;
		wall_4 <= 8'h00;
		wall_5 <= 8'h00;
		wall_6 <= 8'h00;
		char_reg	 <= 8'h00;
		bomb <= 8'h00;
		coll_1 <= 1'b0;
		coll_2 <= 1'b0;
		coll_3 <= 1'b0;
		coll_4 <= 1'b0;
		coll_5 <= 1'b0;
		coll_6 <= 1'b0;
		coll_edges <= 1'b0;		
	end
end

assign VGA_R = char_reg | wall_1 | wall_2 | wall_3 | wall_4 | wall_5 | wall_6;
assign VGA_G = 8'h00;
assign VGA_B = bomb;

assign coll = coll_edges| coll_1 | coll_2 | coll_3 | coll_4 | coll_5 | coll_6;

endmodule
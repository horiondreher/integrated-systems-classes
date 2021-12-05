module keyboard(
	input vga_clk,
	input	PS2_CLK,
	input	PS2_DAT,
	output reg	u_arr = 0,
	output reg	d_arr = 0,
	output reg	l_arr = 0,
	output reg	r_arr = 0,
	output reg 	f_key = 0,
	output reg 	b_key = 0
);

reg	[3:0]		ps2_cntr;
reg	[7:0]		ps2_data_reg;
reg	[7:0]		ps2_data_reg_prev;
reg	[7:0]		ps2_data_reg_prev1;
reg	[10:0]	ps2_dat_r;

reg	[1:0]		ps2_clk_buf;
wire				ps2_clk_pos;

assign ps2_clk_pos = (ps2_clk_buf == 2'b01);

always @ (posedge vga_clk) begin

	ps2_clk_buf[1:0] <= {ps2_clk_buf[0], PS2_CLK};
	
	if(ps2_clk_pos == 1) begin
		ps2_cntr <= ps2_cntr + 1;
		
		if(ps2_cntr == 10) begin 
			ps2_cntr <= 0;			// so we have last 3 data values captured from PS2 keyboard
			ps2_data_reg[7] <= ps2_dat_r[0];
			ps2_data_reg[6] <= ps2_dat_r[1];
			ps2_data_reg[5] <= ps2_dat_r[2];
			ps2_data_reg[4] <= ps2_dat_r[3];
			ps2_data_reg[3] <= ps2_dat_r[4];
			ps2_data_reg[2] <= ps2_dat_r[5];
			ps2_data_reg[1] <= ps2_dat_r[6];
			ps2_data_reg[0] <= ps2_dat_r[7];
			ps2_data_reg_prev <= ps2_data_reg;
			ps2_data_reg_prev1 <= ps2_data_reg_prev;
		end
		
		ps2_dat_r <= {ps2_dat_r[9:0], PS2_DAT};	// data shift left
		
	end

	if(ps2_data_reg_prev1 == 8'he0 && ps2_data_reg_prev == 8'hf0) begin
		if(ps2_data_reg == 8'h75)
			u_arr <= 0;				//0x75 up key
		else if(ps2_data_reg == 8'h6b)
			l_arr <= 0;				//0x6B left key
		else if(ps2_data_reg == 8'h72)
			d_arr <= 0;				//0x72 down key
		else if(ps2_data_reg == 8'h74)
			r_arr <= 0;				//0x74 right key
	end
	
	if(ps2_data_reg_prev == 8'he0) begin			//0xE0	means key pressed
		if(ps2_data_reg == 8'h75)	
			u_arr <= 1;
		else if(ps2_data_reg == 8'h6b)	
			l_arr <= 1;
		else if(ps2_data_reg == 8'h72)
			d_arr <= 1;
		else if(ps2_data_reg == 8'h74)
			r_arr <= 1;
	end
	
	if(ps2_data_reg_prev == 8'hf0) begin
		if(ps2_data_reg == 8'h2b)
			f_key <= 0;
		else if(ps2_data_reg == 8'h32)
			b_key <= 0;
	end
	
	if(ps2_data_reg == 8'h2b)
		f_key <= 1;
	if(ps2_data_reg == 8'h32)
		f_key <= 1;
end
endmodule 
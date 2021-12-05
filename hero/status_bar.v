module status_bar(
	input enable,
	input clk_1hz,
	input [9:0] col,
	input [9:0] row,
	output [7:0] VGA_R,
	output [7:0] VGA_G,
	output [7:0] VGA_B
);

reg [7:0] status_r;
reg [7:0] status_g;
reg [7:0] status_b;

reg [9:0] l_status = 0, r_status = 635, u_status = 375, d_status = 475;

always @(*) begin
	
	if(enable == 1) begin
		status_r <= ((col > l_status) && (col < r_status) && (row > u_status) && (row < d_status)) ? 8'hb8 : 8'h00;
		status_g <= ((col > l_status) && (col < r_status) && (row > u_status) && (row < d_status)) ? 8'hb8 : 8'h00;
		status_b <= ((col > l_status) && (col < r_status) && (row > u_status) && (row < d_status)) ? 8'hb8 : 8'h00;
	end
	else begin
		status_r <= 0;
		status_g <= 0;
		status_b <= 0;
	end
end

assign VGA_R = status_r;
assign VGA_G = status_g;
assign VGA_B = status_b;

endmodule
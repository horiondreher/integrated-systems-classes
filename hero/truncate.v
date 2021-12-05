module truncate(
	input [31:0] column_in,
	input [31:0] row_in,
	output [9:0] column,
	output [9:0] row
);

assign column = column_in[9:0];
assign row = row_in[9:0];

endmodule
	
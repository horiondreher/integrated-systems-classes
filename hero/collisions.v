module collisions(
	input [15:0] active,
	input [15:0] coll_wall,
	output reg coll
);

always @(*) begin
	
	case(active)
		16'b0000000000000001: coll <= coll_wall[0];
		16'b0000000000000010: coll <= coll_wall[1];
		16'b0000000000000100: coll <= coll_wall[2];
		16'b0000000000001000: coll <= coll_wall[3];
		16'b0000000000010000: coll <= coll_wall[4];
		16'b0000000000100000: coll <= coll_wall[5];
		16'b0000000001000000: coll <= coll_wall[6];
		16'b0000000010000000: coll <= coll_wall[7];
		16'b0000000100000000: coll <= coll_wall[8];
		16'b0000001000000000: coll <= coll_wall[9];
		16'b0000010000000000: coll <= coll_wall[10];
		16'b0000100000000000: coll <= coll_wall[11];
		default: coll <= 1'b0;
	endcase
end
	
endmodule
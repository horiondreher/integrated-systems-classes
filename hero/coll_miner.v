module coll_miner(
	input [15:0] active,
	input coll_miner_1,
	input coll_miner_2,
	input coll_miner_3,
	output reg coll_miner
);

always @(*) begin
	
	case(active)
		16'b0000000000000010: coll_miner <= coll_miner_1;
		16'b0000000000100000: coll_miner <= coll_miner_2;
		16'b0000100000000000: coll_miner <= coll_miner_2;
		default: coll_miner <= 1'b0;
	endcase
end
	
endmodule
module PacMan_Divider(CLK_IN, CLK_OUT);

		input CLK_IN;
		output CLK_OUT;
		
		reg [24:0] COUNT = 0;
		reg CLK_OUT = 0;

		always @(posedge CLK_IN) 
		begin
			if (COUNT < 24999999) begin
					COUNT <= COUNT + 1;
			end
			else begin
				COUNT <= 0;
				CLK_OUT <= ~CLK_OUT;
			end
		end
	endmodule 
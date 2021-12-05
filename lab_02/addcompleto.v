module addcompleto (a, b, ci, s, co); 
   input a, b, ci; 
   output s, co; 
	wire xor1;
   assign xor1 = a ^ b; 
	assign co = (~xor1 & b) | (xor1 & ci);
	assign s = ci ^ xor1;
endmodule 

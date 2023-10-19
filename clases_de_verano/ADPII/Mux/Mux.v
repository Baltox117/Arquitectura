module Mux (
	input			a_i,
	input			b_i,
	input			s_i,
	output reg	c_o
);

	//Multiplexor - Algoritmo
	//assign c_o = (s_i) ? a_i : b_i;

	//Multiplexor - Comportamiento
	always @(*)
	begin
		if (s_i)
			c_o = a_i;
		else
			c_o = b_i;
	end
	
endmodule 
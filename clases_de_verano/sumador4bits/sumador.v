module sumador (
	
	input		[3:0] A_i,
	input		[3:0] B_i,
	input				carry_i,
	output	[3:0] S_o,
	output			carry_o

);

	//instancias relacionales
	//Sumador Bit 0
	fadder	fa0 (
	
		.a_i		(A_i[0]),
		.b_i		(B_i[0]),
		.c_i		(carry_i),
		.s_o		(S_o[0]),
		.c_o		(carry0_w)
	
	);
	
	//Sumador Bit 1
	fadder	fa1 (
	
		.a_i		(A_i[1]),
		.b_i		(B_i[1]),
		.c_i		(carry0_w),
		.s_o		(S_o[1]),
		.c_o		(carry1_w)
	
	);
	
	//Sumador Bit 2
	fadder	fa2 (
	
		.a_i		(A_i[2]),
		.b_i		(B_i[2]),
		.c_i		(carry1_w),
		.s_o		(S_o[2]),
		.c_o		(carry2_w)
	
	);
	
	//Sumador Bit 3
	fadder	fa3 (
	
		.a_i		(A_i[3]),
		.b_i		(B_i[3]),
		.c_i		(carry2_w),
		.s_o		(S_o[3]),
		.c_o		(carry_o)
	
	);

endmodule 
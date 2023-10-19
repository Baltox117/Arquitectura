module sumador4 (
	input			[3:0]	A_i,
	input			[3:0] B_i,
	input					C_i,
	output				C_o,
	output		[3:0]	S_o
);
	//acarreos intermedios
	wire			[2:0]	carry_w;
	//sumador del bit 0
	sumador1 sumbit0(
		.a_i		(A_i[0]), //operador a
		.b_i		(B_i[0]), //operador b
		.c_i		(C_i), //acarreo entrada
		.c_o		(carry_w[0]), //acarreo salida
		.s_o		(S_o[0])  //resultado
	);
	//sumador del bit 1
	sumador1 sumbit1(
		.a_i		(A_i[1]), //operador a
		.b_i		(B_i[1]), //operador b
		.c_i		(carry_w[0]), //acarreo entrada
		.c_o		(carry_w[1]), //acarreo salida
		.s_o		(S_o[1])  //resultado
	);
	//sumador del bit 2
	sumador1 sumbit2(
		.a_i		(A_i[2]), //operador a
		.b_i		(B_i[2]), //operador b
		.c_i		(carry_w[1]), //acarreo entrada
		.c_o		(carry_w[2]), //acarreo salida
		.s_o		(S_o[2])  //resultado
	);
	//sumador del bit 3
	sumador1 sumbit3(
		.a_i		(A_i[3]), //operador a
		.b_i		(B_i[3]), //operador b
		.c_i		(carry_w[2]), //acarreo entrada
		.c_o		(C_o), //acarreo salida
		.s_o		(S_o[3])  //resultado
	);
	
endmodule 
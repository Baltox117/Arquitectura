module sumador1 (
	input			a_i, //operador a
	input			b_i, //operador b
	input			c_i, //acarreo entrada
	output		c_o, //acarreo salida
	output		s_o  //resultado
);
	wire			co1;
	wire			co2;
	wire			co3;
	
	//calcular resultado
	xor	XOR1 (co1, a_i, b_i);
	xor	XOR2 (s_o, co1, c_i);
	
	//calcular acarreo salida
	and	AND1 (co2, c_i, co1);
	and	AND2 (co3, a_i, b_i);
	or		OR1  (c_o, co2, co3);
endmodule 
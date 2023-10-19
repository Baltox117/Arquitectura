module fulladder (
	
	input					a_i,//valor de entrada en A
	input					b_i,//valor de entrada en B
	input					c_i,//acarreo de entrada de nuestra suma
	output				c_o,//acarreo de salida de nuestra suma
	output				res_o//resultado de nuestra suma

);

	//cables que utilizamos dentro de nuestras operaciones
	wire					wirexor1_w;//cable de la operacion xor entre a_i y b_i
	wire					wireand1_w;//cable de la operacion and entre a_i y c_i
	wire					wireand2_w;//cable de la operacion and entre b_i y c_i
	wire					wireand3_w;//cable de la operacion and entre a_i y b_i
	
	//operaciones and
	assign	wireand1_w = c_i & a_i;
	assign	wireand2_w = c_i & b_i;
	assign	wireand3_w = b_i & a_i;
	
	//operaciones xor
	assign	wirexor1_w = a_i ^ b_i;
	
	//operacion or de nuestras salidas en las operaciones and
	assign	c_o		  = wireand1_w  | wireand2_w |wireand3_w;
	
	//operacion xor entre la suma de a_i y b_i con el c_i
	assign	res_o		  = wirexor1_w ^ c_i;
endmodule 
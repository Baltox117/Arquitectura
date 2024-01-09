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

// BANCO DE PRUEBAS - TEST BENCH
// 1er paso - modulo de TEST BENCH

module fulladder_tb ();

// 2do paso - input pasa a ser reg, output pasa a ser wire

	reg						a_i;//valor de entrada en A
	reg						b_i;//valor de entrada en B
	reg						c_i;//acarreo de entrada de nuestra suma
	wire					c_o;//acarreo de salida de nuestra suma
	wire					res_o;//resultado de nuestra suma
	
// 3er paso - Inicializar valores

	initial
		begin
			a_i	= 1'b0;
			b_i	= 1'b0;
			c_i	= 1'b0;
		end
		
// 4to paso - Realizar la instancia del modulo a verificar

	fulladder DUT(
	
		.a_i		(),
		.b_i		(),//valor de entrada en B
		.c_i		(),
		.c_o		(),
		.res_o	()

	);
	
// 5to paso - Modificar valores

	always
	begin
		#100
			a_i	= 1'b1;
			b_i	= 1'b0;
			c_i	= 1'b0;
		#100
			a_i	= 1'b0;
			b_i	= 1'b1;
			c_i	= 1'b0;
		#100
			a_i	= 1'b0;
			b_i	= 1'b0;
			c_i	= 1'b1;
		#100
			a_i	= 1'b1;
			b_i	= 1'b1;
			c_i	= 1'b0;
		#100
			a_i	= 1'b1;
			b_i	= 1'b1;
			c_i	= 1'b1;
	end

endmodule 
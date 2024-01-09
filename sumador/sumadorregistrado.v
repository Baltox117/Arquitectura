module sumadorregistrado (

	input								clk_i,
	input				[7:0]		a_i,
	input				[7:0]		b_i,
	input								c_i,
	output	reg					cr_o,
	output	reg	[7:0]		resr_o

);
	
	// Declaracion de señales de salida del sumador de 8 bits
	wire						c_o;
	wire	[7:0]			res_o;			


	// Declaracion de señales registradas
	reg			[7:0]		ar_i;
	reg			[7:0]		br_i;
	reg							cr_i;	

	// Registrar las entradas FFD_1
	always @(posedge clk_i)
	begin
		ar_i <= a_i;
		br_i <= b_i;
		cr_i <= c_i;
	end
	
	// Instanciacion del sumador
	
	fulladder8bits sumador(
	

		.a_i			(ar_i),
		.b_i			(br_i),
		.c_i			(cr_i),
		.c_o			(c_o),
		.res_o		(res_o)
	

	);
	
	
	// Registrar las salidas
	always @(posedge clk_i)
	begin
		cr_o 	 <= c_o;
		resr_o <= res_o;
	end


endmodule 
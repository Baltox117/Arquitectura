module alu_fpga (
	
	input			[3:0]	dira_i, //entrada para la direccion de memoria de la memoria A
	input			[3:0]	dirb_i, //entrada para la direccion de memoria de la memoria B
	input					c_i, // acarreo de entrada de nuestra ALU
	input			[1:0] operacion_i, //selector para la operacion que deseamos realizar
	output				c_o, // accarreo de salida de nuestra ALU
	output		[6:0] disp0, // display de 7 segmentos numero 0
	output		[6:0] disp1, // display de 7 segmentos numero 1
	output		[6:0] disp2, // display de 7 segmentos numero 2
	output		[6:0] disp3, // display de 7 segmentos numero 3
	output		[6:0] disp4, // display de 7 segmentos numero 4
	output		[6:0] disp5, // display de 7 segmentos numero 5
	output		[6:0] disp6, // display de 7 segmentos numero 6
	output		[6:0] disp7  // display de 7 segmentos numero 7
	
);
	
	wire			[31:0] operadora_w; // dato que sale de la memoria A
	wire			[31:0] operadorb_w; // dato que sale de la memoria B
	wire			[31:0] resultado_w; // daro que sale de la operacion entre A y B
	
	//instancia de rom para a
	rom	rom_a(
		.dir_i			(dira_i),
		.sal_o			(operadora_w)
	);
	
	//instancia de rom para b
	rom	rom_b(
		.dir_i			(dirb_i),
		.sal_o			(operadorb_w)
	);
	
	//instancia de la alu
	aluN #(
		.N				(32)
	)
	alu(
		.A_i			(operadora_w),
		.B_i			(operadorb_w),
		.c_i			(c_i),
		.ope_i		(operacion_i),
		.c_o			(c_o),
		.sal_o		(resultado_w)
	);
	
	//instancia del display
	disp7segs disp_0(
		
		.entrada_i		(resultado_w[3:0]),// se asignan los primeros 4 bits al display 0
		.salida_o		(disp0)
	
	);
	disp7segs disp_1(
		
		.entrada_i		(resultado_w[7:4]),// se asignan los siguientes 4 bits al display 1
		.salida_o		(disp1)
	
	);
	disp7segs disp_2(
		
		.entrada_i		(resultado_w[11:8]),// se asignan los siguientes 4 bits al display 2
		.salida_o		(disp2)
	
	);
	disp7segs disp_3(
		
		.entrada_i		(resultado_w[15:12]),// se asignan los siguientes 4 bits al display 3
		.salida_o		(disp3)
	
	);
	disp7segs disp_4(
		
		.entrada_i		(resultado_w[19:16]),// se asignan los siguientes 4 bits al display 4
		.salida_o		(disp4)
	
	);
	disp7segs disp_5(
		
		.entrada_i		(resultado_w[23:20]),// se asignan los siguientes 4 bits al display 5
		.salida_o		(disp5)
		
	);
	disp7segs disp_6(
		
		.entrada_i		(resultado_w[27:24]),// se asignan los siguientes 4 bits al display 6
		.salida_o		(disp6)
	
	);
	disp7segs disp_7(
		
		.entrada_i		(resultado_w[31:28]),// se asignan los ultimos 4 bits al display 7
		.salida_o		(disp7)
	
	);
endmodule

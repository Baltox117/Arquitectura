module monociclo_fpga(

	input					clk_i,
	input					rst_ni,
	output		[6:0] disp0, // display de 7 segmentos numero 0
	output		[6:0] disp1, // display de 7 segmentos numero 1
	output		[6:0] disp2, // display de 7 segmentos numero 2
	output		[6:0] disp3, // display de 7 segmentos numero 3
	output		[6:0] disp4, // display de 7 segmentos numero 4
	output		[6:0] disp5, // display de 7 segmentos numero 5
	output		[6:0] disp6, // display de 7 segmentos numero 6
	output		[6:0] disp7  // display de 7 segmentos numero 7

);

	wire 			[31:0] monitor_o;	
	
	monociclo monocilo_u0(
	
		.clk_i			(clk_i),
		.rst_ni			(rst_ni),
		.monitor_o		(monitor_o)

	);

	
	//instancia del display
	disp7segs disp_0(
		
		.entrada_i		(monitor_o[3:0]),// se asignan los primeros 4 bits al display 0
		.salida_o		(disp0)
	
	);
	disp7segs disp_1(
		
		.entrada_i		(monitor_o[7:4]),// se asignan los siguientes 4 bits al display 1
		.salida_o		(disp1)
	
	);
	disp7segs disp_2(
		
		.entrada_i		(monitor_o[11:8]),// se asignan los siguientes 4 bits al display 2
		.salida_o		(disp2)
	
	);
	disp7segs disp_3(
		
		.entrada_i		(monitor_o[15:12]),// se asignan los siguientes 4 bits al display 3
		.salida_o		(disp3)
	
	);
	disp7segs disp_4(
		
		.entrada_i		(monitor_o[19:16]),// se asignan los siguientes 4 bits al display 4
		.salida_o		(disp4)
	
	);
	disp7segs disp_5(
		
		.entrada_i		(monitor_o[23:20]),// se asignan los siguientes 4 bits al display 5
		.salida_o		(disp5)
		
	);
	disp7segs disp_6(
		
		.entrada_i		(monitor_o[27:24]),// se asignan los siguientes 4 bits al display 6
		.salida_o		(disp6)
	
	);
	disp7segs disp_7(
		
		.entrada_i		(monitor_o[31:28]),// se asignan los ultimos 4 bits al display 7
		.salida_o		(disp7)
	
	);


endmodule 
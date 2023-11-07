module monociclo(
	
	input					clk_i,
	input					rst_ni,
	output	[31:0]	monitor_o

);
	//Asignacion de señal de monitoreo
	assign				monitor_o = if_inst_o;
	
	//Definicion de Señales 
	reg 		[31:0]	pc_w;
	wire		[31:0]	pcnext_w;
	wire		[31:0]	if_inst_o;
	
	//---------------------------------------------
	// FETCH STAGE - IF
	//---------------------------------------------

	always @(posedge clk_i, negedge rst_ni)
	begin
		if(!rst_ni)
			pc_w = 32'b0;//empezamos a leer las instrucciones desde el principio
		else
			pc_w = pcnext_w;//seguimos leyendo las siguientes instrucciones
	end
	
	assign	pcnext_w = pc_w + 4'h4;//saltos de 4 en cuatro para leer las instrucciones
	
	ichache icache_u0(
	
		.addrrd_i	(pc_w[9:2]), //asignamos la direccion de la instruccion del bit 9 al 2
		.inst_o		(if_inst_o)	//mandamos la instruccion que obtuvimos 
		//etapa_definicion_sentido

);

endmodule 
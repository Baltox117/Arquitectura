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
			pc_w = 32'b0;
		else
			pc_w = pcnext_w;
	end
	
	assign	pcnext_w = pc_w + 4'h4;
	
	ichache icache_u0(
	
		.addrrd_i	(pc_w[9:2]),
		.inst_o		(if_inst_o)	//etapa_definicion_sentido

);

endmodule 
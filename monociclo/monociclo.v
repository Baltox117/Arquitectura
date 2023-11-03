module monociclo(
	
	input					clk_i,
	input					rst_ni,
	output	[31:0]	monitor_o

);
	//Asignacion de señal de monitoreo
	assign				monitor_o = wb_dato_o;
	
	//Definicion de Señales 
	reg 		[31:0]	pc_w;
	wire		[31:0]	pcnext_w;
	wire		[31:0]	if_inst_o;
	wire					id_regwrite_o;
	wire					id_memread_o;
	wire					id_memwrite_o;
	wire					id_memtoreg_o;
	wire		[31:0]	wb_dato_o;
	wire		[31:0]	rr_dators1_o;
	wire		[31:0]	rr_dators2_o;
	wire		[31:0]	ex_dato_o;
	wire		[31:0]	mem_dato_o;
	
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
		
	//
	// DECODE STAGE - ID
	//
	);
	
	decode decode_u0(

	.opcode_i		(if_inst_o[6:0]), //codigo de operacion de nuestra instruccion
	.regwrite_o		(id_regwrite_o),
	.memread_o		(id_memread_o),
	.memwrite_o		(id_memwrite_o),
	.memtoreg_o		(id_memtoreg_o)

	);
	
	//
	// READ REGISTER STAGE - RR
	//
	
	registerfile refile(
	
	.clk_i			(clk_i),
	.writeen_i		(id_regwrite_o),
	.addrrd_i		(if_inst_o[11:7]),
	.addrrs1_i		(if_inst_o[19:15]),
	.addrrs2_i		(if_inst_o[24:20]),
	.datord_i		(wb_dato_o),
	.dators1_o		(rr_dators1_o),
	.dators2_o		(rr_dators2_o)

	);
	
	//
	// EXECUTE STAGE - EX
	//
	
	aluN execute_u0(
	.A_i		(rr_dators1_o),
	.B_i		(rr_dators2_o),
	.c_i		(1'b0),
	.ope_i	({if_inst_o[30], if_inst_o[14:12]}),
	.c_o		(c_o),
	.sal_o	(ex_dato_o)
	);
	
	//
	// MEMORY ACCESS STAGE - MEM
	//
	dchache dcache_u0(
	
	.clk_i		(clk_i),
	.writeen_i	(id_memwrite_o),
	.readen_i	(id_memread_o),
	.addr_i		(ex_dato_o[11:2]),
	.dato_i		(rr_dators2_o),
	.dato_o		(mem_dato_o)
	);
	
	//
	// WRITE BACK - WB
	//
	
	assign wb_dato_o = (id_memtoreg) ? mem_dato_o : ex_dato_o;

endmodule 
module monociclo(
	
	input					clk_i,
	input					rst_ni,
	output	[31:0]	monitor_o

);
	//Asignacion de señal de monitoreo
	assign				monitor_o = rr_dators1_o; //wb_dato_o
	
	//Definicion de Señales 
	reg 		[31:0]	pc_w;
	wire		[31:0]	pcnext_w;
	wire		[31:0]	if_inst_o;
	wire					id_regwrite_o;
	wire					id_alusrc_o;
	wire					id_memread_o;
	wire					id_memwrite_o;
	wire					id_memtoreg_o;
	wire					id_branch_o;
	wire		[31:0]	wb_dato_o;
	wire		[31:0]	rr_dators1_o;
	wire		[31:0]	rr_dators2_o;
	wire		[31:0]	ex_dato_o;
	wire		[31:0]	se_dato_o;
	wire		[31:0]	alusrc_dato_o;
	wire		[31:0]	mem_dato_o;
	wire					ex_brflag_o;
	wire		[31:0]	sl_dato_o;
	wire					and_flag_o;
	wire		[31:0] 	to_dato_o;
	wire		[4:0]		id_aluop_o;
	wire		[3:0]		aluctrl_aluoperacion_o;
	
	
	//---------------------------------------------
	// FETCH STAGE - IF
	//---------------------------------------------

	always @(posedge clk_i, negedge rst_ni)
	begin
		if(!rst_ni)
			pc_w = 32'b0; // iniciamos en la instruccion 0 
		else
			pc_w = pcnext_w; // utilizamos la siguiente instruccion indicada 
	end
	
	
	// MEMORIA DE INSTRUCCIONES
	
	ichache icache_u0(
	
		.addrrd_i	(pc_w[9:2]),
		.inst_o		(if_inst_o)	//etapa_definicion_sentido
		
	);
	
	//---------------------------------------------
	// DECODE STAGE - ID
	//---------------------------------------------
	
	decode decode_u0(

		.opcode_i		(if_inst_o[6:0]), //codigo de operacion de nuestra instruccion
		.alusrc_o		(id_alusrc_o),
		.regwrite_o		(id_regwrite_o),
		.memread_o		(id_memread_o),
		.memwrite_o		(id_memwrite_o),
		.memtoreg_o		(id_memtoreg_o),
		.branch_o		(id_branch_o),
		.aluop_o			(id_aluop_o)

	);
	
	//---------------------------------------------
	// READ REGISTER STAGE - RR
	//---------------------------------------------
	
	registerfile regfile(
	
		.clk_i				(clk_i),
		.writeen_i			(id_regwrite_o),
		.addrrd_i			(if_inst_o[11:7]),
		.addrrs1_i			(if_inst_o[19:15]),
		.addrrs2_i			(if_inst_o[24:20]),
		.datord_i			(wb_dato_o),
		.dators1_o			(rr_dators1_o),
		.dators2_o			(rr_dators2_o)

	);
	
	
	//---------------------------------------------
	// EXTENSION DE SIGNO - SE
	//---------------------------------------------
	
	SignExtend signex(

		.inst_i	(if_inst_o),
		.sal_o	(se_dato_o)

	);
	
	// MUX ALU SOURCE
	
	assign alusrc_dato_o = (id_alusrc_o) ? se_dato_o : rr_dators2_o;
	
	
	//---------------------------------------------
	// TARGET OFFSET - TO
	//---------------------------------------------
	
	// hacemos el salto al siguiente bloque de instrucciones de 4 bytes
	assign sl_dato_o = se_dato_o << 1; 
	
	// indicamos cual es el siguiente bloque de instruccion que debe ejecutarse
	assign to_dato_o = sl_dato_o + pc_w; 
	
	// verificamos si la extencion de signo y el salto estan activos 
	assign and_flag_o = ex_brflag_o & id_branch_o; 
	
	// si la extencion de signo y el salto son 1 utilizamos el salto para el 
	// siguiente bloque de instrucciones, si no solo ejecutamos la instruccion siguiente
	assign pcnext_w = (and_flag_o) ? to_dato_o : pc_w + 4'h4; 
	
	//---------------------------------------------
	// ALU CONTROL - ALUCTRL
	//---------------------------------------------
	
	aluctrl aluctrl_u0(

		.f7_i						(if_inst_o[30]),
		.f3_i						(if_inst_o[14:12]),
		.aluop_i					(id_aluop_o),
		.aluoperacion_o		(aluctrl_aluoperacion_o)
	
	);
	
	//---------------------------------------------
	// EXECUTE STAGE - EX
	//---------------------------------------------
	
	aluN execute_u0(
	
		.A_i			(rr_dators1_o),
		.B_i			(alusrc_dato_o),
		.c_i			(aluctrl_aluoperacion_o[2]),
		.branch_i	(id_branch_o),
		.brctrl_i	(if_inst_o[14:12]),// f3 de la instruccion
		.ope_i		(aluctrl_aluoperacion_o),
		.c_o			(c_o),
		.sal_o		(ex_dato_o),
		.brflag_o	(ex_brflag_o)
	
	);
	
	
	//---------------------------------------------
	// MEMORY ACCESS STAGE - MEM
	//---------------------------------------------
	
	dchache dcache_u0(
	
		.clk_i			(clk_i),
		.writeen_i		(id_memwrite_o),
		.readen_i		(id_memread_o),
		.addr_i			(ex_dato_o[11:2]),
		.dato_i			(rr_dators2_o),
		.dato_o			(mem_dato_o)
		
	);
	
	
	//---------------------------------------------
	// WRITE BACK - WB
	//---------------------------------------------
	
	assign wb_dato_o = (id_memtoreg_o) ? mem_dato_o : ex_dato_o;

endmodule 
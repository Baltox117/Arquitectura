module monociclo (

	input							clk_i,
	input							rst_ni,
	output			[31:0] 	monitor,
	output	reg	[31:0]	pc_o,
	output			[31:0]	if_instr_o

);
	
	// seccion de definicion de señales
	
	wire 		[31:0]	next_pc;
	//wire		[31:0]	if_instr_o;
	//reg					pc_o;
	wire					id_regwrite_o;
	wire					id_alusrc_o;
	wire					id_memread_o;	
	wire					id_memwrite_o;
	wire					id_memtoreg_o;
	wire 		[63:0]	wb_data_o;
	wire 		[63:0]	rr_dators1_o;
	wire 		[63:0]	rr_dators2_o;
	wire		[63:0]	ex_dato_o;
	wire		[63:0]	se_dato_o;
	wire		[63:0]	alusrc_dato_o;
	wire		[63:0]	mem_dato_o;
	assign 	monitor = wb_data_o;
	
	// Etapa de Fetch
	// Busqueda y emision de instrucciones
	
	always @(posedge clk_i, negedge rst_ni)
	begin
		if (!rst_ni)
			pc_o = 4'b0;
		else
			pc_o = next_pc;
	end
	
	// calculo de next pc
	
	assign next_pc = pc_o + 4'h4;

	//Memoria de instrucciones
	memoria icache (
	
		.clk_i		(clk_i),
		.wren_i		(1'b0),			//Habilitacion de escritura
		.wraddr_i	(8'b0),			//@ de escritura
		.wrdata_i	(32'b0),			//dato de escritura
		.rden_i		(1'b1),			//habilitacion de lectura
		.rdaddr_i	(pc_o[9:2]),	//@ de lectura
		.rddata_o	(if_instr_o) 	//dato leido
	
	);
	
	// Etapa de Decodificacion
	deco decode (
	
		.opcode_i		(if_instr_o[6:0]),
		.regwrite_o		(id_regwrite_o),
		.alusrc_o		(id_alusrc_o	),
		.memread_o		(id_memread_o	),
		.memwrite_o		(id_memwrite_o),
		.memtoreg_o		(id_memtoreg_o)
	);

	//Etapa de busqueda de operando
	
	regfile registerread (
	
		.clk_i		(clk_i),
		.wren_i		(id_regwrite_o),		//Habilitacion de escritura
		.wraddr_i	(if_instr_o[11:7]),		//@ de escritura
		.wrdata_i	(wb_data_o),		//dato de escritura
		.rden1_i		(1'b1),		//habilitacion de lectura
		.rdaddr1_i	(if_instr_o[19:15]),		//@ de lectura
		.rddata1_o	(rr_dators1_o),		//dato leido
		.rden2_i		(1'b1),		//habilitacion de lectura
		.rdaddr2_i	(if_instr_o[24:20]),		//@ de lectura
		.rddata2_o	(rr_dators2_o)			//dato leido
	);
	
	//Mux ALU source
	
	assign	alusrc_dato_o = (id_alusrc_o) ? se_dato_o : rr_dators2_o;
	
	//Ejecucion 
	
	alu execute (
		.opers1_i	(rr_dators1_o),
		.opers2_i	(alusrc_dato_o),
		.control_i	({if_instr_o[30], if_instr_o[14:12]}),
		.res_o		(ex_dato_o)
	);

	//Extension de signo
	
	SignExtend signex (
	
		.inst_i	(if_instr_o),
		.sal_o	(se_dato_o)
	
	);
	
	//Acceso a memoria
	
	memoria #(
	
		.ANCHO	(64),
		.PROF		(10)
	
	)
	
	dcache (
	
		.clk_i		(clk_i),
		.wren_i		(id_memwrite_o),			//Habilitacion de escritura
		.wraddr_i	(ex_dato_o[12:3]),			//@ de escritura
		.wrdata_i	(rr_dators2_o),			//dato de escritura
		.rden_i		(id_memread_o),			//habilitacion de lectura
		.rdaddr_i	(ex_dato_o[12:3]),	//@ de lectura
		.rddata_o	(mem_dato_o) 	//dato leido
	
	);
	
	//Write back
	
	assign	wb_data_o = (id_memtoreg_o) ? mem_dato_o : ex_dato_o;
	
	
endmodule 
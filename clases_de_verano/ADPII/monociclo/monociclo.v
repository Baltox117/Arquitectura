module monociclo (
	input					rst_ni,
	input					clk_i,
	output		[63:0]monitor_o
);
	//señal a monitorear
	assign	monitor_o = wb_data_o;
	//Seccion de declaracion de señales
	wire			[63:0]icache_inst_o;
	reg			[31:0]pc_o;
	wire			[31:0]pc_next;
	wire			[63:0]wb_data_o;
	wire			[63:0]rr_datars1_o;
	wire			[63:0]rr_datars2_o;
	wire			[63:0]ex_data_o;
	wire			[63:0]se_data_o;
	wire					deco_regwrite_o;
	wire					deco_alusrc_o;
	wire			[63:0]alusrc_data_o;
	//Generacion de PC - Contador de Programa
	always @(posedge clk_i, negedge rst_ni)
	begin
		if (rst_ni == 1'b0)
			pc_o	<=	32'b0;
		else
			pc_o <= pc_next;
	end
	//Generar PC_NEXT 
	assign	pc_next = pc_o + 32'h4;
	
	//Instruction Cache
	memoria icache_u0(
		.clk_i		(clk_i),
		.wren_i		(1'b0),		//Habilitacion de escritura
		.wraddr_i	(10'b0),	//@ de escritura
		.wrdata_i	(32'b0),	//dato de escritura
		.rden_i		(1'b1),		//habilitacion de lectura
		.rdaddr_i	(pc_o[11:2]),	//@ de lectura
		.rddata_o	(icache_inst_o)		//dato leido
	);
	//Decode - Decodificacion
	deco decode_u0(
		.opcode_i	(icache_inst_o[6:0]),
		.regwrite_o	(deco_regwrite_o),
		.alusrc_o	(deco_alusrc_o)
	);

	//Register Read - Buscar operandos
	regfile regread_u0(
		.clk_i		(clk_i),
		.wren_i		(deco_regwrite_o),		//Habilitacion de escritura
		.wraddr_i	(icache_inst_o[11:7]),	//@ de escritura
		.wrdata_i	(wb_data_o),	//dato de escritura
		.rden1_i		(1'b1),		//habilitacion de lectura
		.rdaddr1_i	(icache_inst_o[19:15]),		//@ de lectura
		.rddata1_o	(rr_datars1_o),	//dato leido
		.rden2_i		(1'b1),		//habilitacion de lectura
		.rdaddr2_i	(icache_inst_o[24:20]),	//@ de lectura
		.rddata2_o	(rr_datars2_o)	//dato leido
	);
	//Sign Extend - Extension de Signo
	SignExtend SignExtend_u0(
		.inst_i		(icache_inst_o),
		.sal_o		(se_data_o)
	);
	//Multiplexor de ALU source
	assign	alusrc_data_o = (deco_alusrc_o) ? se_data_o : rr_datars2_o;
	
	//Execution - Ejecucion
	alu execute_u0(
		.opers1_i	(rr_datars1_o),
		.opers2_i	(alusrc_data_o),
		.control_i	({icache_inst_o[30],icache_inst_o[14:12]}),
		.res_o		(ex_data_o)
	);
	
	//Write Back - Escritura de resultado al RF
	assign	wb_data_o = ex_data_o;
endmodule 
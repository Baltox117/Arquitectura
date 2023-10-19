module monocilo_fpga (
	input				clk_i,
	input				rst_ni,
	output	[6:0]	disp0,
	output	[6:0]	disp1,
	output	[6:0]	disp2,
	output	[6:0]	disp3,
	output	[6:0]	disp4,
	output	[6:0]	disp5,
	output	[6:0]	disp6,
	output	[6:0]	disp7,
	output			lcd_on,	
	output			lcd_blon,
	output			lcd_rw,	
	output			lcd_en,	
	output			lcd_rs,	
	output	[7:0]	lcd_data
//	output			enable_int_0
);
	wire	[255:0]	MP;
//	wire	[31:0]	PC_o;
//	wire	[63:0]	data_int_0;
//	wire	[4:0]		addr_int_0;
//	wire				enable_int_0;
	wire	[31:0]	wb_result_o;
	wire	[31:0]	mux_branch;	
	wire	[31:0]	if_inst_o;	
	wire				clk_div;
	
	divfreq divisor	(
		.clk_i		(clk_i),
		.rst_ni		(rst_ni),
		.clk_o		(clk_div)
	);

	assign	MP[255:248]	=	8'd80;	//P
	assign	MP[247:240]	=	8'd67;	//C
	assign	MP[239:232]	=	8'd58;	//:
	assign	MP[231:224]	=	8'd45;	//-
	assign	MP[223:216]	=	8'd45;	//-
	assign	MP[215:208]	=	8'd45;	//-
	assign	MP[207:200]	=	8'd45;	//-
	assign	MP[199:192]	=	8'd45;	//-
	assign	MP[191:184]	=	(mux_branch[31:28]<10) ?	mux_branch[31:28] + 8'h30 : mux_branch[31:28] + 8'h37;	//-
	assign	MP[183:176]	=	(mux_branch[27:24]<10) ?	mux_branch[27:24] + 8'h30 : mux_branch[27:24] + 8'h37;	//-
	assign	MP[175:168]	=	(mux_branch[23:20]<10) ?	mux_branch[23:20] + 8'h30 : mux_branch[23:20] + 8'h37;	//-
	assign	MP[167:160]	=	(mux_branch[19:16]<10) ?	mux_branch[19:16] + 8'h30 : mux_branch[19:16] + 8'h37;	//-
	assign	MP[159:152]	=	(mux_branch[15:12]<10) ?	mux_branch[15:12] + 8'h30 : mux_branch[15:12] + 8'h37;	//-
	assign	MP[151:144]	=	(mux_branch[11:8]<10 ) ? 	mux_branch[11:8]  + 8'h30 : mux_branch[11:8] + 8'h37;	//-
	assign	MP[143:136]	=	(mux_branch[7:4]<10  ) ? 	mux_branch[7:4]   + 8'h30 : mux_branch[7:4] + 8'h37;	//-
	assign	MP[135:128]	=	(mux_branch[3:0]<10  ) ? 	mux_branch[3:0]   + 8'h30 : mux_branch[3:0] + 8'h37;	//-
	
	assign	MP[127:120]	=	 8'd73;	
	assign	MP[119:112]	=	 8'd78;
	assign	MP[111:104]	=	 8'd83;
	assign	MP[103:96]	=	 8'd84;
	assign	MP[95:88]	=	 8'd58;
	assign	MP[87:80]	=	 8'd45;	
	assign	MP[79:72]	=	 8'd45;	
	assign	MP[71:64]	=	 8'd45;	
	assign	MP[63:56]	=	(if_inst_o[31:28]<10) ? if_inst_o[31:28] + 8'h30 : if_inst_o[31:28] + 8'h37;
	assign	MP[55:48]	=	(if_inst_o[27:24]<10) ? if_inst_o[27:24] + 8'h30 : if_inst_o[27:24] + 8'h37;
	assign	MP[47:40]	=	(if_inst_o[23:20]<10) ? if_inst_o[23:20] + 8'h30 : if_inst_o[23:20] + 8'h37;
	assign	MP[39:32]	=	(if_inst_o[19:16]<10) ? if_inst_o[19:16] + 8'h30 : if_inst_o[19:16] + 8'h37;
	assign	MP[31:24]	=	(if_inst_o[15:12]<10) ? if_inst_o[15:12] + 8'h30 : if_inst_o[15:12] + 8'h37;
	assign	MP[23:16]	=	(if_inst_o[11:8]<10) ?  if_inst_o[11:8] + 8'h30 :  if_inst_o[11:8] + 8'h37;	
	assign	MP[15:8]		=	(if_inst_o[7:4]<10) ?   if_inst_o[7:4] + 8'h30 :   if_inst_o[7:4] + 8'h37;	
	assign	MP[7:0]		=	(if_inst_o[3:0]<10) ?   if_inst_o[3:0] + 8'h30 :   if_inst_o[3:0] + 8'h37;		
	
	monociclo monociclocompleto_debug(
		.clk_i				(clk_div),
		.rst_ni				(rst_ni),
		.monitor				(wb_result_o),
		.pc_o					(mux_branch	),
		.if_instr_o			(if_inst_o	)
	);
	
	deco7seg deco0(
		.hex_i		(wb_result_o[3:0]),
		.num_o		(disp0)
	);
	deco7seg deco1(
		.hex_i		(wb_result_o[7:4]),
		.num_o		(disp1)
	);
	deco7seg deco2(
		.hex_i		(wb_result_o[11:8]),
		.num_o		(disp2)
	);
	deco7seg deco3(
		.hex_i		(wb_result_o[15:12]),
		.num_o		(disp3)
	);
	deco7seg deco4(
		.hex_i		(wb_result_o[19:16]),
		.num_o		(disp4)
	);
	deco7seg deco5(
		.hex_i		(wb_result_o[23:20]),
		.num_o		(disp5)
	);
	
	deco7seg deco6(
		.hex_i		(wb_result_o[27:24]),
		.num_o		(disp6)
	);
	deco7seg deco7(
		.hex_i		(wb_result_o[31:28]),
		.num_o		(disp7)
	);	
	LCDASCII	lcd_screen(				
		.CLK			(clk_i),
		.RST_N		(clk_div),
		.MP			(MP),
		//LCD Module 16X2																	
		.LCD_ON		(lcd_on	),														//LCD Power ON/OFF
		.LCD_BLON	(lcd_blon),													//LCD Back Light ON/OFF
		.LCD_RW		(lcd_rw	),														//LCD Read/Write Select, 0 = Write, 1 = Read
		.LCD_EN		(lcd_en	),														//LCD Enable
		.LCD_RS		(lcd_rs	),														//LCD Command/Data Select, 0 = Command, 1 = Data
		.LCD_DATA	(lcd_data)													//LCD Data bus 8 bits
	);
endmodule 
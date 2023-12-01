module aluctrl_fpga (
		
	input						clk_i, //señal de reloj
	input						rst_ni,//señal de reset		
	input						sw_opcode_0,
	input						sw_opcode_1,
	input						sw_opcode_2,
	input						sw_opcode_3,
	input						sw_opcode_4,
	input						sw_f3_0,
	input						sw_f3_1,
	input						sw_f3_2,
	input						sw_f7_0,
	output		[6:0] disp0 
);

	wire  			[3:0] salida_o;
	wire					 		clk1hz_W;
	
	
	divisor50mhz div50_u0(

		.clk_i		(clk_i),
		.rst_ni		(rst_ni),
		.clk1hz_o	(clk1hz_W)	
	
	);
	
	aluctrl aluctrl_u0(
	
		.f7_i						(sw_f7_0),
		.f3_i						({sw_f3_2, sw_f3_1, sw_f3_0}),
		.aluop_i				({sw_opcode_4, sw_opcode_3, sw_opcode_2, sw_opcode_1, sw_opcode_0}),
		.aluoperacion_o	(salida_o)
	);
	
	
	disp7segs disp_0(
		
		.entrada_i		(salida_o),// se asignan los primeros 4 bits al display 0
		.salida_o			(disp0)
	
	);



endmodule 
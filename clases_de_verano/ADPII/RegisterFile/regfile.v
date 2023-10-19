module regfile # ( 
	parameter			ANCHO =  64,
	parameter			PROF	=	5
)
(
	//señales generales
	input						clk_i,
	//señales del puerto de escritura
	input						wren_i,		//Habilitacion de escritura
	input		[PROF-1:0]	wraddr_i,	//@ de escritura
	input		[ANCHO-1:0]	wrdata_i,	//dato de escritura
	//señales del primer puerto de lectura
	input						rden1_i,		//habilitacion de lectura
	input		[PROF-1:0]	rdaddr1_i,	//@ de lectura
	output	[ANCHO-1:0]	rddata1_o,	//dato leido
	//señales del segundo puerto de lectura
	input						rden2_i,		//habilitacion de lectura
	input		[PROF-1:0]	rdaddr2_i,	//@ de lectura
	output	[ANCHO-1:0]	rddata2_o	//dato leido
);
	//Resgistrar la @ de lectura
	reg		[ANCHO-1:0]	rdaddr_r;
	//Definicion de la memoria	
	reg		[ANCHO-1:0]	mem	[(2**PROF)-1:0];	

	initial
	begin
		mem[0]	=	{ANCHO{1'b0}};		//x0 - zero
//		mem[5]	=	64'h5;				//x5 - t0
//		mem[6]	=	64'h8;				//x6 - t1
	end
	
	//Definicion de puerto de escritura
	always @(posedge clk_i)
	begin
		if (wren_i)
			begin
				mem[wraddr_i]	<=	wrdata_i;
			end
//		rdaddr_r	<=	rdaddr_i;
	end

	//Definicion del primer puerto de lectura
	assign	rddata1_o = (rden1_i) ? mem[rdaddr1_i] : {ANCHO{1'b0}};
	//Definicion del segundo puerto de lectura
	assign	rddata2_o = (rden2_i) ? mem[rdaddr2_i] : {ANCHO{1'b0}};
	
endmodule 
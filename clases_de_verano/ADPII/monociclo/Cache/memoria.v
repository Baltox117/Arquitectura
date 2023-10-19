module memoria # ( 
	parameter			ANCHO =  32,
	parameter			PROF	=	10
)
(
	//señales generales
	input						clk_i,
	//señales del puerto de escritura
	input						wren_i,		//Habilitacion de escritura
	input		[PROF-1:0]	wraddr_i,	//@ de escritura
	input		[ANCHO-1:0]	wrdata_i,	//dato de escritura
	//señales del puerto de lectura
	input						rden_i,		//habilitacion de lectura
	input		[PROF-1:0]	rdaddr_i,	//@ de lectura
	output	[ANCHO-1:0]	rddata_o		//dato leido
);
	//Resgistrar la @ de lectura
	reg		[ANCHO-1:0]	rdaddr_r;
	//Definicion de la memoria	
	reg		[ANCHO-1:0]	mem	[(2**PROF)-1:0];	

	initial
	begin
		mem[0]	=	32'h007302B3;
		/*mem[0]	=	32'h00500293;
		mem[1]	=	32'h00800313;
		mem[2]	=	32'h00628433;
		mem[3]	=	32'h0062F4B3;
		mem[4]	=	32'h00803023;
		mem[5]	=	32'h00503423;
		mem[6]	=	32'h00003903;
		mem[7]	=	32'h00803983;
		mem[8]	=	32'h01394A33;*/
		
	end	
	
	//Definicion de puerto de escritura
	always @(posedge clk_i)
	begin
		if (wren_i)
			begin
				mem[wraddr_i]	<=	wrdata_i;
			end
		rdaddr_r	<=	rdaddr_i;
	end

	//Definicion de puerto de lectura
	assign	rddata_o = mem[rdaddr_i];
	
endmodule 
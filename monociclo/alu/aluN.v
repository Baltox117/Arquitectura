module aluN #(
	parameter			N=32
)
(
	input			[N-1:0]	A_i, 		// Dato de entrada 1
	input			[N-1:0]	B_i, 		// Dato de entrada 2
	input						c_i, 		// Acarreo de entrada
	input			[3:0]		ope_i,	// codigo de operacion
	input						branch_i,// entrada para saber si es una instruccion tipo B
	input			[2:0]		brctrl_i,// entrada de control para el salto
	output					c_o,		// Acarreo de salida
	output		[N-1:0]	sal_o,	// resultado de la operacion
	output					brflag_o	// bandera para 
);

	wire			[N:0]		carryint_w;
	wire			[N:0]		shift_o;
	wire			[N:0]		alu_o;
	
	assign					carryint_w[0] = c_i;
	
	genvar		i;
	generate
		for	(i=0;	i<N; i=i+1)
			begin:alutag
			
				if (i==0)
					alu alu_N(
						.a_i			(A_i[i]),
						.b_i			(B_i[i]),
						.c_i			(carryint_w[i]),
						.sel_i		(ope_i),
						.res_o		(alu_o[i]),
						.c_o			(carryint_w[i+1]),
						.set_i		(alu_o[N-1]),
						.inver_i		(c_i)
					);	
				else
					alu alu_N(
						.a_i			(A_i[i]),
						.b_i			(B_i[i]),
						.c_i			(carryint_w[i]),
						.sel_i		(ope_i),
						.res_o		(alu_o[i]),
						.c_o			(carryint_w[i+1]),
						.set_i		(1'b0),
						.inver_i		(c_i)
					);	
			end
	endgenerate
	
	assign	c_o = carryint_w[N];
	
	ShiftModule ShiftModule_u0 (
		.A					(A_i),				
		.B					(B_i),  			
		.Operation		(ope_i),  
		.salida_o		(shift_o)
	);
	
	//assign variable_resultado = (condición) ? valor_si_cierto : valor_si_falso;
	assign sal_o = (ope_i[3] == 1'b1) ? shift_o : alu_o;
	
	
	flagdetector flagdetector_u0(
	
		.branch_i			(branch_i),
		.brctrl_i			(brctrl_i),
		.resultado_i		(alu_o),
		.brflag_o			(brflag_o)

	);
	
	//assign	zeroflag_o	=	~(|(res_o)); //Igualdad para los branches
	
	
endmodule 
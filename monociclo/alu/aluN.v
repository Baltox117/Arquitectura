module aluN #(
	parameter			N=32
)
(
	input			[N-1:0]	A_i,
	input			[N-1:0]	B_i,
	input						c_i,
	input			[3:0]		ope_i,
	input						branch_i,
	input			[2:0]		brctrl_i,
	output					c_o,
	output		[N-1:0]	sal_o,
	output					brflag_o
);

	wire			[N:0]		carryint_w;
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
						.res_o		(sal_o[i]),
						.c_o			(carryint_w[i+1]),
						.set_i		(sal_o[N-1]),
						.inver_i		(c_i)
					);	
				else
					alu alu_N(
						.a_i			(A_i[i]),
						.b_i			(B_i[i]),
						.c_i			(carryint_w[i]),
						.sel_i		(ope_i),
						.res_o		(sal_o[i]),
						.c_o			(carryint_w[i+1]),
						.set_i		(1'b0),
						.inver_i		(c_i)
					);	
			end
	endgenerate
	
	assign	c_o = carryint_w[N];
	//assign	set_w =	()
	
	flagdetector flagdetector_u0(
	
		.branch_i		(branch_i),
		.brctrl_i		(op),
		.resultado_i	(sal_o),
		.brflag_o		(brflag_o)

);
	
endmodule 
module fulladder8bits(
	

	input		[7:0]		a_i,
	input		[7:0]		b_i,
	input						c_i,
	output					c_o,
	output	[7:0]		res_o
	

);

	wire 		[6:0]		carry_w;

	fulladder adder1bit_0(

		.a_i			(a_i[0]),
		.b_i			(b_i[0]),
		.c_i			(c_i),
		.c_o			(carry_w[0]),
		.res_o		(res_o[0])

	);
	
	fulladder adder1bit_1(

		.a_i			(a_i[1]),
		.b_i			(b_i[1]),
		.c_i			(carry_w[0]),
		.c_o			(carry_w[1]),
		.res_o		(res_o[1])

	);
	
	fulladder adder1bit_2(

		.a_i			(a_i[2]),
		.b_i			(b_i[2]),
		.c_i			(carry_w[1]),
		.c_o			(carry_w[2]),
		.res_o		(res_o[2])

	);
	
	fulladder adder1bit_3(

		.a_i			(a_i[3]),
		.b_i			(b_i[3]),
		.c_i			(carry_w[2]),
		.c_o			(carry_w[3]),
		.res_o		(res_o[3])

	);
	
	fulladder adder1bit_4(

		.a_i			(a_i[4]),
		.b_i			(b_i[4]),
		.c_i			(carry_w[3]),
		.c_o			(carry_w[4]),
		.res_o		(res_o[4])

	);
	
	fulladder adder1bit_5(

		.a_i			(a_i[5]),
		.b_i			(b_i[5]),
		.c_i			(carry_w[4]),
		.c_o			(carry_w[5]),
		.res_o		(res_o[5])

	);
	
	fulladder adder1bit_6(

		.a_i			(a_i[6]),
		.b_i			(b_i[6]),
		.c_i			(carry_w[5]),
		.c_o			(carry_w[6]),
		.res_o		(res_o[6])

	);
	
	fulladder adder1bit_7(

		.a_i			(a_i[7]),
		.b_i			(b_i[7]),
		.c_i			(carry_w[6]),
		.c_o			(c_o),
		.res_o		(res_o[7])

	);
		

endmodule 
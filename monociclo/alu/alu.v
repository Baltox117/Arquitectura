module alu (

	input						a_i,//valor de entrada en A
	input						b_i,//valor de entrada en B
	input						c_i,//acarreo de entrada del sumador
	input			[3:0]		sel_i,//selector para la operacion 
	input						set_i,//bit de set, STL
	input						inver_i,
	output reg				res_o,//resultado de la operacion
	output					c_o//acarreo de salida de la suma 

);
	//cables internos en nuestra alu
	wire			wireand1_w;//cable de la operacion and entre a_i y b_w
	wire			wireor1_w;//cable de la operacion or entre a_i y b_w
	wire			wiresume_w;//cable del sumador entre a_i y b_w
	wire			nob_w;// cable de la negacion del valor en b_i
	wire			b_w;//valor de b_i despues de pasar por un multiplexor
	wire			wirexor_w;

	//operaciones para b_i
	assign		nob_w			=	~b_i;//negacion del valor que hay en b_i
	assign		b_w			=	(inver_i) ? nob_w : b_i;//sentencia condicional para tomar el valor b_i o nob_w
	
	//operaciones and, or Y XOR entre a_i y b_w
	assign		wireand1_w	=	a_i & b_w;
	assign		wireor1_w	=	a_i | b_w;
	assign		wirexor_w   =  a_i ^ b_w;
	/////////////////////////
	
	//instanciacion de nuestro sumador y le asignamos sus respectivas variables
	fulladder fa(
	
		.a_i			(a_i),
		.b_i			(b_w),
		.c_i			(c_i),
		.c_o			(c_o),
		.res_o		(wiresume_w)
		
	);	
	
	//sentecia always para listar las señales de entrada
	always @(*)
	begin
		case (sel_i)//case para seleccionar el resultado que va a tomar nuestra alu
			4'b0_0_00:
					res_o	= wiresume_w;//ADD
			4'b0_0_01:
					res_o	= wireand1_w;//AND
			4'b0_0_10:
					res_o = wireor1_w;//OR
			4'b0_0_11:
					res_o = wirexor_w;//XOR
			4'b0_1_00:
					res_o	= (nob_w < a_i) ? 1'b1 : 1'b0;// SLTU
			4'b0_1_01:
					res_o	= wiresume_w;//SUB
			4'b0_1_10:
					res_o	= set_i;//STL
			
			default:
					res_o	= 1'b0;
		endcase
	end
	

endmodule 
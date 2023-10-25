module alu (

	input				a_i,//valor de entrada en A
	input				b_i,//valor de entrada en B
	input				c_i,//acarreo de entrada del sumador
	input		[3:0]	sel_i,//selector para la operacion 
	input				set_i,//colo
	input				inver_i,
	output reg		res_o,//resultado de la operacion
	output			c_o//acarreo de salida de la suma 

);
	//cables internos en nuestra alu
	wire			wireand1_w;//cable de la operacion and entre a_i y b_w
	wire			wireor1_w;//cable de la operacion or entre a_i y b_w
	wire			wiresume_w;//cable del sumador entre a_i y b_w
	wire			nob_w;// cable de la negacion del valor en b_i
	wire			b_w;//valor de b_i despues de pasar por un multiplexor
	////////////////////////////////
	wire			wirexor_w;
	wire			wiresll_w;
	wire			wiresrl_w;
	wire			wiresra_w;
	
	//operaciones para b_i
	assign		nob_w			=	~b_i;//negacion del valor que hay en b_i
	assign		b_w			=	(inver_i) ? nob_w : b_i;//sentencia condicional para tomar el valor b_i o nob_w
	
	//operaciones and y or entre a_i y b_w
	assign		wireand1_w	=	a_i & b_w;
	assign		wireor1_w	=	a_i | b_w;
	/////////////////////////
	assign		wirexor_w   =  a_i ^ b_w;
	assign		wiresll_w   =  a_i << b_w;
	assign		wiresrl_w   =  a_i >> b_w;
	assign		wiresra_w   =  a_i >>> b_w;
	
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
			3'b000:
					res_o	= wireand1_w;//resultado de la operacion and
			3'b001:
					res_o = wireor1_w;//resultado de la operacion or
			3'b010:
					res_o	= wiresume_w;//resultado del sumador
			3'b011:
					res_o	= set_i;
			3'b100:
					res_o = wirexor_w;
			3'b101:
					res_o = wiresll_w;
			3'b110:
					res_o = wiresrl_w;
			3'b111:
					res_o = wiresra_w;
			/*3'b000:
			3'b000:
			3'b000:
			3'b000:*/
			default:
					res_o	= 1'b0;
		endcase
	end
	
	//assign		res_o			=	(sel_i==1'b1) ? wireor1_w : wireand1_w;
endmodule 
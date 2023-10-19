module alu (
	input				[63:0]	opers1_i,
	input				[63:0]	opers2_i,
	input				[3:0]		control_i,
	output reg		[63:0]	res_o
);
	always @(*)
	begin
		case (control_i)
			4'b0_000:			//Suma
						res_o	=	opers1_i	+	opers2_i;
			4'b1_000:			//Resta
						res_o	=	opers1_i	-	opers2_i;
			4'b0_001:			//Shift Left Logical
						res_o	=	opers1_i	<<	opers2_i;
			4'b0_010:			//Set if Less Than
						if (opers1_i < opers2_i)
							res_o	=	1'b1;
						else
							res_o =	1'b0;
			4'b0_011:			//Set if Less Than Unsigned
						if (opers1_i < opers2_i)
							res_o	=	1'b1;
						else
							res_o =	1'b0;		
			4'b0_100:			//XOR
						res_o	=	opers1_i ^ opers2_i;
			4'b0_101:			//Shift Right Logical
						res_o	=	opers1_i >> opers2_i;
			4'b1_101:			//Shith Right Arithmetic
						res_o	=	opers1_i	>>> opers2_i;
			4'b0_110:			//OR
						res_o	=	opers1_i	|	opers2_i;
			4'b0_111:			//AND
						res_o	=	opers1_i &	opers2_i;
			default:
						res_o	=	64'b0;
		endcase
	end
endmodule 
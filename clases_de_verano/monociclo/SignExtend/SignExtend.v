module SignExtend (
	input			[31:0]	inst_i,
	output reg	[63:0]	sal_o
);

	always @(*)
	begin
		case (inst_i[6:0])
			7'b0010011:				//Tipo Inmediata
							sal_o	=	{{52{inst_i[31]}}, inst_i[31:20]};
			7'b0000011:				//Tipo Load
							sal_o	=	{{52{inst_i[31]}}, inst_i[31:20]};
			7'b0100011:				//Tipo Store
							sal_o	=	{{52{inst_i[31]}}, inst_i[31:25], inst_i[11:7]};
			default:
							sal_o	=	64'b0;
			
		endcase
	end
endmodule 
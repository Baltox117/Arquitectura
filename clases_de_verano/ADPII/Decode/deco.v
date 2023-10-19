/*
	Archivo: 		deco.v
	Descripción:	Decoficador del procesador
	Autor:			Lagarto Dev Team
	Contacto:		lagarto@cic.ipn.mx
*/

module deco (
	input			[6:0] opcode_i,
	output reg			regwrite_o,
	output reg			alusrc_o,
	output reg			memread_o,
	output reg			memwrite_o,
	output reg			memtoreg_o
);
	always @(*)
	begin
		case (opcode_i)
			7'b0110011:			//Instruccion tipo R
						begin
							regwrite_o	= 1'b1;
							alusrc_o		= 1'b0;
							memread_o	= 1'b0;
							memwrite_o	= 1'b0;
							memtoreg_o	= 1'b0;
						end
			7'b0010011:			//Instrucciones tipo I
						begin
							regwrite_o	= 1'b1;
							alusrc_o		= 1'b1;
							memread_o	= 1'b0;
							memwrite_o	= 1'b0;
							memtoreg_o	= 1'b0;
						end
			7'b0000011:			//Instruccion de tipo Load
						begin
							regwrite_o	= 1'b1;
							alusrc_o		= 1'b1;
							memread_o	= 1'b1;
							memwrite_o	= 1'b0;
							memtoreg_o	= 1'b1;
						end
			7'b0100011:			//Instruccion de tipo Store
						begin
							regwrite_o	= 1'b0;
							alusrc_o		= 1'b1;
							memread_o	= 1'b0;
							memwrite_o	= 1'b1;
							memtoreg_o	= 1'b0;
						end
			default
						begin
							regwrite_o	= 1'b0;
							alusrc_o		= 1'b0;
							memread_o	= 1'b0;
							memwrite_o	= 1'b0;
							memtoreg_o	= 1'b0;
						end
		endcase 
	end
endmodule 
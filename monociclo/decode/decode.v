module decode(

	input 			[6:0] opcode_i, //codigo de operacion de nuestra instruccion
	output	reg			regwrite_o,
	output	reg			alusrc_o,
	output	reg			memread_o,
	output	reg			memwrite_o,
	output	reg			memtoreg_o,
	output	reg			branch_o,
	output	reg	[4:0]	aluop_o

);

	always @(*)
	begin
		case (opcode_i)
			7'b0110011: // Tipo R 10 operaciones
				begin
					regwrite_o 	= 1'b1;
					alusrc_o		= 1'b0;
					memread_o 	= 1'b0;// instrucciones tipo l 1
					memwrite_o 	= 1'b0; // instrucciones tipo s 1
					memtoreg_o 	= 1'b0; // vale 0 porque no pasa a memoria
					branch_o		= 1'b0;
					aluop_o		= 5'b01100; 
				end
			7'b0010011: // Tipo I
				begin
					regwrite_o 	= 1'b1;
					alusrc_o		= 1'b1;
					memread_o 	= 1'b0;
					memwrite_o 	= 1'b0;
					memtoreg_o 	= 1'b0;
					branch_o		= 1'b0;
					aluop_o		= 5'b00100; 
				end
			7'b0100011: // Tipo S
				begin
					regwrite_o 	= 1'b0;
					alusrc_o		= 1'b1;
					memread_o 	= 1'b0;
					memwrite_o 	= 1'b1;
					memtoreg_o 	= 1'b0;
					branch_o		= 1'b0;
					aluop_o		= 5'b01000; 
				end
			7'b0000011: // Tipo L
				begin
					regwrite_o 	= 1'b1;
					alusrc_o		= 1'b1;
					memread_o 	= 1'b1;
					memwrite_o 	= 1'b0;
					memtoreg_o 	= 1'b1;
					branch_o		= 1'b0;
					aluop_o		= 5'b00000; 
				end
			7'b1100011: // Tipo B
				begin
					regwrite_o 	= 1'b0;
					alusrc_o		= 1'b1;
					memread_o 	= 1'b0;
					memwrite_o 	= 1'b0;
					memtoreg_o 	= 1'b0;
					branch_o		= 1'b1;// solo se pone en 1 en las tipo b
					aluop_o		= 5'b11000; 
				end
			default:
				begin
					regwrite_o 	= 1'b0;
					alusrc_o		= 1'b0;
					memread_o 	= 1'b0;
					memwrite_o 	= 1'b0;
					memtoreg_o 	= 1'b0;
					branch_o		= 1'b0;
					aluop_o		= 5'b00000;
				end
		endcase
	end


endmodule 
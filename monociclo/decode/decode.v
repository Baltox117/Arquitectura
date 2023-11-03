module decode(

	input 			[6:0] opcode_i, //codigo de operacion de nuestra instruccion
	output	reg			regwrite_o,
	output	reg			memread_o,
	output	reg			memwrite_o,
	output	reg			memtoreg_o

);

	always @(*)
	begin
		case (opcode_i)
			7'b0110011: // Tipo R
				begin
					regwrite_o 	= 1'b1;
					memread_o 	= 1'b0;// instrucciones tipo l 1
					memwrite_o 	= 1'b0; // instrucciones tipo s 1
					memtoreg_o 	= 1'b0; // vale 0 porque no pasa a memoria
				end
			7'b0100011: // Tipo S
				begin
					regwrite_o 	= 1'b1;
					memread_o 	= 1'b0;
					memwrite_o 	= 1'b0;
					memtoreg_o 	= 1'b0;
				end
			
			default:
				begin
					regwrite_o 	= 1'b0;
					memread_o 	= 1'b0;
					memwrite_o 	= 1'b0;
					memtoreg_o 	= 1'b0;
				end
		endcase
	end


endmodule 
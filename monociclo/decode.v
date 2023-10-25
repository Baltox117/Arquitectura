module decode(

	input 			[6:0] opcode_i, //codigo de operacion de nuestra instruccion
	output	reg			regwrite_0

);

	always @(*)
	begin
		case (opcode_i)
			7'b0110011:
				regwrite_o = 1'b1;
			default:
				regwrite_o = 1'b0;
	end


endmodule 
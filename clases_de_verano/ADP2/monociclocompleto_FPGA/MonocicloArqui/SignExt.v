//**********************************************************************************************//
//  TITLE:                  Sign Extension 		                                                //
//                                                                                              //
//  PROJECT:                Monociclo                                                           //
//                                                                                              //
//  LANGUAGE:               Verilog						                                             //
//                                                                                              //
//  AUTHOR:                 Lagarto Development Team - lagarto@cic.ipn.mx						      //
//                                                                                              //
//  REVISION:               1.0 - Monociclo CORE2021                                            //
//                                                                                              //
//**********************************************************************************************//

module	SignExt #(
	parameter		WORD			= 32,
	parameter		OPCODE		= 7,
	parameter		IMM			= 20	
)(
	input			[WORD-1:0]		if_inst_i,						//Instrucción de IF
	output reg	[WORD-1:0]		se_datars2_o					//Segundo operador de ALU
);
	wire			[OPCODE-1:0]	opecode;
	assign							opecode = if_inst_i[6:0];	//Código de Operación

	always @(*)
	begin		
		
		case (opecode)
			//Extension de signo para inmediate
			7'b0010011:	se_datars2_o = {{IMM{if_inst_i[31]}},if_inst_i[31:20]};
			//Extension de signo para sw
			7'b0100011:	se_datars2_o = {{IMM{if_inst_i[31]}},if_inst_i[31:25],if_inst_i[11:7]};		
			//Extension de signo para lw
			7'b0000011:	se_datars2_o = {{IMM{if_inst_i[31]}},if_inst_i[31:20]};		
			//Extension de signo para branch
			7'b1100011:	se_datars2_o = {{IMM{if_inst_i[31]}},if_inst_i[31],if_inst_i[7],if_inst_i[30:25],if_inst_i[11:8]};		
			//Caso por defecto
			default:		se_datars2_o = {WORD{1'b0}};											
		endcase
	end

endmodule 
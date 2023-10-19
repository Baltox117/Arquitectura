//**********************************************************************************************//
//  TITLE:                  ALU Source Multiplexor                                              //
//                                                                                              //
//  PROJECT:                Monociclo                                                           //
//                                                                                              //
//  LANGUAGE:               Verilog                                                             //
//                                                                                              //
//  AUTHOR:                 Lagarto Development Team - lagarto@cic.ipn.mx                       //
//                                                                                              //
//  REVISION:               1.0 - Monociclo CORE2021                                            //
//                                                                                              //
//**********************************************************************************************//

module Mux_ALUSrc #(
	parameter					WORD	= 32
)(
	input			[WORD-1:0]	register_i,
	input			[WORD-1:0]	sign_ext_i,
	input							control,
	output  reg	[WORD-1:0]	data_o
);
	always @(*)
	begin
		 case (control)
			  0:	data_o	<=	register_i;
			  1:	data_o	<=	sign_ext_i; 
		 endcase
	end
endmodule 
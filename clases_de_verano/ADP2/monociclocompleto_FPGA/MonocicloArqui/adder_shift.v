//**********************************************************************************************//
//  TITLE:                  ADDER SHIFTER                                                       //
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

module adder_shift#(
	parameter		N = 32	//ancho de operadores
  )(
 	input		[N-1:0]	opea,		//operador a
 	input		[N-1:0]	opeb,
	input					cin,		//acarreo de entrada
	output	[N-1:0]	sal,		//resultado
	output				cout		//acarreo de salida
 
);

 Sumador sumador_u10 (
 
 	opea,		//operador a
	opeb,		//operador b
	cin,		//acarreo de entrada
	sal,		//resultado
	cout		//acarreo de salida
 
 );
 
 endmodule

//**********************************************************************************************//
//  TITLE:                  ADDER CALC                                                          //
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
module adder_calc #(
	parameter		N = 32	//ancho de operadores
  )(
 	input		[N-1:0]	opea,		//operador a
	input					cin,		//acarreo de entrada
	output	[N-1:0]	sal,		//resultado
	output				cout		//acarreo de salida
 
);

wire			[N-1:0]	opeb;
assign opeb=32'h4;


 Sumador sumador_u20 (
 
 	opea,		//operador a
	opeb,		//operador b
	cin,		//acarreo de entrada
	sal,		//resultado
	cout		//acarreo de salida
 
 );
 
 endmodule
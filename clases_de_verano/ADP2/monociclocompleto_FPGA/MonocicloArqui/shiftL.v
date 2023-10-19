//**********************************************************************************************//
//  TITLE:                  Shift Left 		                                                   //
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

module shiftL #(
	parameter					WORD = 32
	)(
	input  [WORD-1:0]  sign_ext ,
	output [WORD-1:0]  ls_o 
    );   
        assign ls_o = (sign_ext<<1);
endmodule

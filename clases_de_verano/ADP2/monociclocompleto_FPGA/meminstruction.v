//**********************************************************************************************//
//  TITLE:                  Memory Instruction                                                  //
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
module meminstruction (
//	input				clk_i,
	input			[7:0]		addread_i,
	output reg	[31:0]	dataread_o
);
	reg			[31:0]		Cache			[255:0];
	
	initial
	begin
		$readmemh ("bubbleworkshop.hex", Cache);		//Hexadecimal
		//$readmemb ("bubbleworkshop.bin", Cache);		//Binario
		//Cache[0] = 32'h03000313;
		//Cache[1] = 32'h00c00393;
		//Cache[2] = 32'h007302B3;
		//Cache[3] = 32'h407302b3;
	end
	
	always @(*)
	begin
		dataread_o = Cache[addread_i];
	end

endmodule 
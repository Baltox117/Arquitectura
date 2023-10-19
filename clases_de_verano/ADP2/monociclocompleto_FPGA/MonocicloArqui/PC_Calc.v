//**********************************************************************************************//
//  TITLE:                  PC_calc.v  					                                             //
//                                                                                              //
//  PROJECT:                PC Generation                                                               //
//  LANGUAGE:               Verilog						                                             //
//                                                                                              //
//  AUTHOR:                 Lagarto Development Team - lagarto@cic.ipn.mx						      //
//                                                                                              //
//  REVISION:               0.1 - First Revision - Creation                                     //
//                                                                                              //
//**********************************************************************************************//


module	PC_Calc #(
	parameter					WORD = 32
	)(
	input							clk_i,
	input							rst_ni,
	input   [WORD-1:0] pc_i,
	output reg	[WORD-1:0]	pc_o	

);


	always @(posedge clk_i, negedge rst_ni)
	begin
		if (!rst_ni) 
			pc_o <=	32'b0;
		
		else  
		pc_o	<= pc_i ;
			
		
	
	end
endmodule 
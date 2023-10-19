//**********************************************************************************************//
//  TITLE:                  Branch Control                                                       //
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

module branch_control(
    input   [2:0]       Funct3_i,
    input               branch, // resultado de la ALU
	 input               ex_zerof_o,
    output reg       	Ex_branch_o // salida a PC y a AND
    );
	 
	 wire [3:0] signal_control;
	 
	 assign signal_control = { branch,Funct3_i};
	 
	 always @(*)
	begin
	 
	    case (signal_control) 
	   
		 4'h8: 
		
	        if (ex_zerof_o)
			  Ex_branch_o=1;
			  
			    else 
				 
				    Ex_branch_o=0;

		 4'h9: 
		 
		     
	        if (ex_zerof_o)
			  Ex_branch_o=0;
			  
			    else 
				 
				    Ex_branch_o=1;

		 
		 default:  Ex_branch_o=0;
		 
		 
		 endcase
	
	
	
	end 
	
	endmodule
	
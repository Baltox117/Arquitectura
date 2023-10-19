//**********************************************************************************************//
//  TITLE:                  Control - Decode                                                    //
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

module Control(
	input			[6:0]	Instruction_i,
	output reg			Branch_o,
	output reg			Memread_o,
	output reg			Memtoreg_o,
	output reg	[1:0]	Aluop_o,
	output reg			Memwrite_o,
	output reg			Alusrc_o,
	output reg			Regwrite_o
);
  
	always @(*)
	begin		
		case (Instruction_i)
			7'b1100011: begin
								Aluop_o		=	2'b01;	//tipo B=01
								Alusrc_o		=	1'b0;
								Memtoreg_o	=	1'bx;			                 
								Regwrite_o	=	1'b0;
								Memread_o	=	1'b0;
								Memwrite_o	=	1'b0;
								Branch_o		=	1'b1;
							end
							
			7'b0100011: begin
								Aluop_o		=	2'b00;	//tipo sd,sw store information to the memory
								Alusrc_o		=	1'b1;		//information to the alu comes from the 
								Memtoreg_o	=	1'bx;		//data is writen back to the registers from the ALU		                 
								Regwrite_o	=	1'b0;		//no data is writen to the registers, data is writen to the memory
								Memread_o	=	1'b0;		//we are not reading from the memory, we are storing data to it
								Memwrite_o	=	1'b1;		//enable to write data to the memory
								Branch_o		=	1'b0;		//we are not branching from this, this is only for the B type instructions
							end	
							
			7'b0000011: begin
								Aluop_o		=	2'b00;	//tipo ld,lw load information from memory
								Alusrc_o		=	1'b1;
								Memtoreg_o	=	1'b1;			                 
								Regwrite_o	=	1'b1;
								Memread_o	=	1'b1;
								Memwrite_o	=	1'b0;
								Branch_o		=	1'b0;			                 
							end	
							
			7'b0010011: begin
								Aluop_o		=	2'b11;	//tipo I=11 immediate operations
								Alusrc_o		=	1'b1;		//information should come from the imm generator
								Memtoreg_o	=	1'b0;		//data is writen back to registers from the ALU
								Regwrite_o	=	1'b1;		//enable to write to the registers
								Memread_o	=	1'b0;		//we are reading from the memory (the data)
								Memwrite_o	=	1'b0;		//we block from writing to the memory
								Branch_o		=	1'b0;		//we are not branching from this, this is only for the B type instructions
							end

			7'b0110011: begin
								Aluop_o		=	2'b10;	//tipo R=10
								Alusrc_o		=	1'b0;
								Memtoreg_o	=	1'b0;			                 
								Regwrite_o	=	1'b1;
								Memread_o	=	1'b0;
								Memwrite_o	=	1'b0;
								Branch_o		=	1'b0;			                 
			            end			 
			7'b0001111:		Aluop_o		=	2'b11;	//tipo I=11  fence
				
			7'b1110011:		Aluop_o		=	2'b11;	//tipo I=11  ecall,ebreak,etc		
				
			default:			Aluop_o		=	2'b10;	//defaults to R
		endcase
	end 
endmodule 
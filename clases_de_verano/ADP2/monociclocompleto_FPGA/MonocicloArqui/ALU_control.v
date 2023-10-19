//**********************************************************************************************//
//  TITLE:                  ALU Control                                                         //
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
module ALU_control(
    input   [2:0]       Funct3_i,
    input               Funct7_i,
    input   [1:0]       Aluop_i,
    output  reg [3:0]   Ex_aluop_o
    );
    wire [3:0] control_signal_i;
    assign control_signal_i={Funct7_i,Funct3_i};
    
	always @(*)
	begin		
		case(Aluop_i)
			2'b00:	Ex_aluop_o=4'h8;
			2'b01:
				case (Funct3_i)
					3'b000:	Ex_aluop_o=4'h1;		//beq
					3'b001:	Ex_aluop_o=4'h5;		//bne
					default:	Ex_aluop_o=4'h0;
				endcase
			2'b10, 2'b11:
				case (control_signal_i)
					4'b0110: Ex_aluop_o=4'h6;     //or
					4'b0111: Ex_aluop_o=4'h4;     //and
					4'b1101: Ex_aluop_o=4'hD;     //sra  //pendiente
					4'b0101: Ex_aluop_o=4'hE;     //srl //pendiente
					4'b0100: Ex_aluop_o=4'h5;     //xor  
					4'b0011: Ex_aluop_o=4'hA;     //sltu  //pendiente
					4'b0010: Ex_aluop_o=4'h9;     //slt  //pendiente
					4'b0001: Ex_aluop_o=4'h7;     //sll  //pendiente
					4'b1000: Ex_aluop_o=4'h1;     //sub
					4'b0000: Ex_aluop_o=4'h8;     //add
					default: Ex_aluop_o=4'b0000;
				endcase
			default: Ex_aluop_o=4'b0000;

		endcase
	end    
endmodule

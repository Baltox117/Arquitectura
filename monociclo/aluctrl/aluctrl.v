module aluctrl (

	input 					f7_i,
	input				[2:0]	f3_i,
	input				[4:0]	aluop_i,
	output	reg	[3:0]	aluoperacion_o
	
);
	
	always @(*)
	begin
		case (aluop_i)
			5'b01100:	// INSTRUCCIONES TIPO R
				begin
					case ({f7_i, f3_i}) //  - RESTA - -
						4'b0_000:
							aluoperacion_o = 4'b0_0_00; // Suma
						4'b1_000:
							aluoperacion_o = 4'b0_1_01; // Resta
						4'b0_010:
							aluoperacion_o = 4'b0_1_10; // SLT
						4'b0_111:
							aluoperacion_o = 4'b0_0_01; // ADN
						4'b0_110:
							aluoperacion_o = 4'b0_0_10; // OR
						4'b0_100:
							aluoperacion_o = 4'b0_0_11; //XOR	
						4'b0_011:
							aluoperacion_o = 4'b0_1_00; //SLTU
						4'b1_001:
							aluoperacion_o = 4'b1_0_01; //SLL	
						4'b1_101:
							aluoperacion_o = 4'b1_0_10; //SRL	
						4'b1_101:
							aluoperacion_o = 4'b1_0_11; //SRA
					endcase
				end
			5'b00100:	// INSTRUCCIONES TIPO I
				begin
					case (f3_i)
						3'b000:
							aluoperacion_o = 4'b0_0_00; // Suma inmediata
						3'b001:
							aluoperacion_o = 4'b1_0_01; // SLLI
						3'b010:
							aluoperacion_o = 4'b0_1_10; // SLTI
						3'b011:
							aluoperacion_o = 4'b0_1_00; // SLTIU
						3'b100:
							aluoperacion_o = 4'b0_0_11; // XORI
						3'b101:
							if (f7_i)					//-----------si f7 es 1 es a y si es 0 es b----------
								aluoperacion_o = 4'b1_0_11; // SRAI
							else
								aluoperacion_o = 4'b1_0_10; // SRLI
						3'b110:
							aluoperacion_o = 4'b0_0_10; // ORI
						3'b111:
							aluoperacion_o = 4'b0_0_01; // ANDI
					endcase
				end
			5'b01000:	// INSTRUCCIONES TIPO S
				begin
					aluoperacion_o = 4'b0_0_00;
				end
			5'b00000:	// INSTRUCCIONES TIPO L
				begin
					aluoperacion_o = 4'b0_0_00;
				end
			5'b11000:	// INSTRUCIONES TIPO B
				begin		// BEQ, BNE, BLT, BGT
					case (f3_i)
						3'b000:
							aluoperacion_o = 4'b0_1_01; // BEQ
						3'b001:
							aluoperacion_o = 4'b0_1_01; // BNE
						3'b100:
							aluoperacion_o = 4'b0_1_10; // BLT
						3'b101:
							aluoperacion_o = 4'b0_1_10; // BGE
						/*3'b110:
							aluoperacion_o = 4'b0_1_00; // BLTU
						3'b111:
							aluoperacion_o = 4'b0_1_10; // BGEU*/
					endcase
				end
			default:
				aluoperacion_o = 4'b1_1_11;
		endcase
	end



endmodule 
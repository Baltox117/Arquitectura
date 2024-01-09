module ShiftModule (

	input 			[31:0] 	A,				//	El dato A
	input 			[31:0] 	B,  			// Será desplazado B posiciones
	input 			[3:0] 	Operation,  
	output 	reg 	[31:0] 	salida_o

);

	always @(*) 
	begin
	  case (Operation)
			4'b1_0_10: 
				salida_o = A << B[4:0];  			// Desplazamiento lógico a la izquierda
			4'b1_0_10:
				salida_o = A >> B[4:0];  			// Desplazamiento lógico a la derecha
			4'b1_0_11:
				salida_o = A <<< B[4:0]; 			// Extensión aritmética hacia la izquierda 
			default: 
				salida_o = A;  
	  endcase
	end
	
endmodule

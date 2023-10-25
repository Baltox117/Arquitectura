module disp7segs (
	input			[3:0]	entrada_i,//dato de entrada de 4 bits para el display
	output reg	[6:0]	salida_o //dato de salida de 7 bits para nuesro display de 7 segmentos

);
	always @(*)
	begin
		case(entrada_i)
			4'h0:
				salida_o	=	7'b1000000;//numero 0 pintado en el display
			4'h1:
				salida_o	=	7'b1111001;//numero 1 pintado en el display
			4'h2:
				salida_o	=	7'b0100100;//numero 2 pintado en el display
			4'h3:
				salida_o	=	7'b0110000;//numero 3 pintado en el display
			4'h4:
				salida_o	=	7'b0011001;//numero 4 pintado en el display
			4'h5:
				salida_o	=	7'b0010010;//numero 5 pintado en el display
			4'h6:
				salida_o	=	7'b0000010;//numero 6 pintado en el display
			4'h7:
				salida_o	=	7'b0111000;//numero 7 pintado en el display
			4'h8:
				salida_o	=	7'b0000000;//numero 8 pintado en el display
			4'h9:
				salida_o	=	7'b0010000;//numero 9 pintado en el display
			4'ha:
				salida_o	=	7'b0001000;//numero A pintado en el display
			4'hb:
				salida_o	=	7'b0000011;//numero B pintado en el display
			4'hc:
				salida_o	=	7'b0100111;//numero C pintado en el display
			4'hd:
				salida_o	=	7'b0100001;//numero D pintado en el display
			4'he:
				salida_o	=	7'b0000110;//numero E pintado en el display
			4'hf:
				salida_o	=	7'b0001110;//numero F pintado en el display
		endcase
	end	
endmodule		

		
		
		
		
		
		
		

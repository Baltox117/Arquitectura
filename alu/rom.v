module rom (

	input				[3:0]		dir_i,//entrada de 4 bits para seleccinar los registros que tenemos en memoria
	output	reg	[31:0]	sal_o//salida de 32 bits para el dato almacenado en nuestra memoria 

);
	

	always @(dir_i)
		begin
			case (dir_i)
				4'h0:
					sal_o = 32'h00000001;// valor de 1 almacenado en 0
				4'h1:
					sal_o = 32'h777abcfe;// valor de 2004532478 almacenado en 1
				4'h2:
					sal_o = 32'h48151623;// valor de 1209341475 almacenado en 2
				4'h3:
					sal_o = 32'hfedcba98;// valor de 4275878552 almacenado en 3
				4'h4:
					sal_o = 32'haabbccdd;// valor de 2864434397 almacenado en 4
				4'h5:
					sal_o = 32'hfc963011;// valor de 4237701137 almacenado en 5
				4'h6:
					sal_o = 32'h02468ace;// valor de 38177486 almacenado en 6
				4'h7:
					sal_o = 32'h39992aaf;// valor de 966339247 almacenado en 7
				4'h8:
					sal_o = 32'h88ffadca;// valor de 2298457546 almacenado en 8
				4'h9:
					sal_o = 32'hffaa9911;// valor de 4289370385 almacenado en 9
				4'ha:
					sal_o = 32'h88925378;// valor de 2291291000 almacenado en 10
				4'hb:
					sal_o = 32'habbdff89;// valor de 2881355657 almacenado en 11
				4'hc:
					sal_o = 32'hfffa8524;// valor de 4294608164 almacenado en 12
				4'hd:
					sal_o = 32'h3628162b;// valor de 908596779 almacenado en 13
				4'he:
					sal_o = 32'h8376a9cb;// valor de 2205592011 almacenado en 14
				4'hf:
					sal_o = 32'hffffffff;// valor de 4294967295 almacenado en 15
				
			endcase
		end
	

endmodule 

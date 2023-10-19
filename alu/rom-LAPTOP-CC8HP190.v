module rom (

	input				[3:0]		dir_i,
	output	reg	[31:0]	sal_o

);
	

	always @(dir_i)
		begin
			case (dir_i)
				4'h0:
					sal_o = 32'h00000001;
				4'h1:
					sal_o = 32'h00000002;
				4'h2:
					sal_o = 32'h00000003;
				4'h3:
					sal_o = 32'hfedcba98;
				4'h4:
					sal_o = 32'haabbccdd;
				4'h5:
					sal_o = 32'hfc963011;
				4'h6:
					sal_o = 32'h02468ace;
				4'h7:
					sal_o = 32'h39992aaf;
				4'h8:
					sal_o = 32'h88ffadca;
				4'h9:
					sal_o = 32'hffaa9911;
				4'ha:
					sal_o = 32'h88925378;
				4'hb:
					sal_o = 32'habbdff89;
				4'hc:
					sal_o = 32'hfffa8524;
				4'hd:
					sal_o = 32'h3628162b;
				4'he:
					sal_o = 32'h8376a9cb;
				4'hf:
					sal_o = 32'hffffffff;
				
			endcase
		end
	

endmodule 

module flagdetector(
	
	input						 branch_i,
	input				[2:0]	 brctrl_i,
	input				[31:0] resultado_i,
	output	reg			 brflag_o

);

	always @(*)
	begin
		if (branch_i)
			case(brctrl_i)
				3'b000:		// BEQ
					if (resultado_i == 32'b0)
						brflag_o = 1'b1;
					else
						brflag_o = 1'b0;
				
			endcase
			
		else
			brflag_o = 1'b0;
	end

endmodule 
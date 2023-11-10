module SignExtend(

	input				[31:0]	inst_i,
	output	reg	[31:0]	sal_o

);

	always @(*)
	begin
		case (inst_i[6:0])
			7'b0010011://Instrucciones tipo I
				sal_o = {{20{inst_i[31]}}, inst_i[31:20]};
			7'b0000011://Instrucciones tipo L
				sal_o = {{20{inst_i[31]}}, inst_i[31:20]};
			7'b0100011://Instrucciones tipo S
				sal_o = {{20{inst_i[31]}}, inst_i[31:25], inst_i[11:7]};
			7'b1100011://Instrucciones tipo B
				sal_o = {{20{inst_i[31]}}, inst_i[31], inst_i[7], inst_i[30:25], inst_i[11:8]};
			default
				sal_o = 32'b0;
		endcase
	end

endmodule 
module dchache(
	
	input					clk_i,
	input					writeen_i,
	input					readen_i,
	// las instrucciones son de 5 bits por el numero de registros que tenemos
	
	input		[9:0]		addr_i,
	input		[31:0]	dato_i,
	output	[31:0]	dato_o
	

);

	reg		[31:0]	datacache	[2**10-1:0];

	
	always @(posedge clk_i)
	begin
		if (writeen_i)
			datacache[addr_i] = dato_i;
	end
	
	assign 	dato_o = (readen_i) ? datacache[addr_i] : 32'b0;

endmodule 
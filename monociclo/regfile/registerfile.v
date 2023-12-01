module registerfile(
	
	input					clk_i,
	input					writeen_i,
	input		[4:0]		addrrd_i,
	// las instrucciones son de 5 bits por el numero de registros que tenemos
	input		[4:0]		addrrs1_i,
	input		[4:0]		addrrs2_i,
	input		[31:0]	datord_i,
	output	[31:0]	dators1_o,
	output	[31:0]	dators2_o

);

	reg		[31:0]	regfile	[2**5-1:0]; // registros totales 
	
	initial
	begin
		regfile[0] = 32'b0;
	end
	
	always @(posedge clk_i)
	begin
		if (writeen_i)
			regfile[addrrd_i] = datord_i;
	end
	
	assign 	dators1_o = regfile[addrrs1_i]; // dato fuente 1
	assign 	dators2_o = regfile[addrrs2_i]; // dato fuente 2

endmodule 
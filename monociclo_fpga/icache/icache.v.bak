module ichache(
	
	input		[7:0]		addrrd_i,
	output	[31:0]	inst_o

);

	reg		[31:0]	memory	[2**8-1:0];
	
	initial
	begin
		$readmemh ("bubblesort_inst_5cv1.hex", memory);
	end
	
	assign 	inst_o = memory[addrrd_i];

endmodule 
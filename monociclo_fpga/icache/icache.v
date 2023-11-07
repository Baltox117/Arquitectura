module ichache(
	
	input		[7:0]		addrrd_i,//entrada de nuestra direccion de memoria de 8 bits
	output	[31:0]	inst_o//salida de la instruccion de 32 bits

);

	reg		[31:0]	memory	[2**8-1:0];//dimensionamiento de nuestra memoria que es de 256 localidades y de de 32 bits cada localidad
	
	initial
	begin
		$readmemh ("bubblesort_inst_5cv1.hex", memory);//leemos nuestro archivo de ensamblador
	end
	
	assign 	inst_o = memory[addrrd_i];//asignamos cada instruccion a nuestra memoria de instrucciones

endmodule 
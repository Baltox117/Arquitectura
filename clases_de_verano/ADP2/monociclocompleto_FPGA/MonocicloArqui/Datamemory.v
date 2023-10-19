module Datamemory #(
	parameter				ADDRW = 10,		//Ancho de palabra
	parameter				DATAW = 32		//Ancho de datos)

)(
	input						clk_i,
	input						we_i,
	input						rst_ni,			//Reset bajo activo
	input		[ADDRW-1:0]	addr_i,			//adress
	input		[DATAW-1:0]	dataw_i,			//write data
	output	[DATAW-1:0]	datar_o,			//read data
	input						memread
);
 
    
    
	memory_data memory_u0(
		.clk_i				(clk_i),
		.rst_ni				(rst_ni),		//Reset bajo activo
		.we_i					(we_i),
		.addr_i				(addr_i),		//Direccion de lectura
		.dataw_i				(dataw_i),		//Dato de escritura
		.datar_o				(datar_o),		//Dato de lectura
		.memread				(memread)
	);  
  
  endmodule
  
module	memory_data #(
	parameter					ADDRW = 10,		//Ancho de palabra
	parameter					DATAW = 32		//Ancho de datos
  )(    
	input							clk_i,			//Reloj
	input							rst_ni,			//Reset bajo activo
	input							we_i,				//Habilitacion de Escritura
	input			[ADDRW-1:0]	addr_i,			//Direccion de lectura
	input			[DATAW-1:0]	dataw_i,			//Dato de escritura
	output reg	[DATAW-1:0]	datar_o,			//Dato de lectura
	input							memread
  );
  
	//Cache
	reg			[DATAW-1:0]		Cache	[2**ADDRW-1:0];
	//Valid Bit
	reg			[2**ADDRW-1:0]	Valid;        
	reg								Validbit_r;
	//Tag field

	//Puerto de escritura
	always @(posedge clk_i, negedge rst_ni)	//Dispara por flanco pos clk, y flanco neg rst
	begin
		if (!rst_ni) begin							//Reset activo
			Valid = 128'h1FFFFFFFF;
		end else begin									//Reset inactivo
			if (we_i) begin
				Cache[addr_i]    <=    dataw_i;	//Escribimos Dato de entrada
				Valid[addr_i]    <= 1'b1;			//Escribimos Bit de Valido
			end
		end
	end

	//Puerto de lectura
	always @(*)
	begin
		Validbit_r <= Valid[addr_i];				//Leemos bit de valido
		if (Validbit_r ) begin						//Si el dato y el tag son valido, se lee
			datar_o     <= Cache[addr_i];
		end else begin
			datar_o = {DATAW{1'b0}};
		end	
    end	 
endmodule 
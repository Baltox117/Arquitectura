//xc7a100tcsg324-2

//**********************************************************************************************//
//  TITLE:                  MSync.v  					                                             //
//                                                                                              //
//  PROJECT:                Cache                                                               //
//  LANGUAGE:               Verilog						                                             //
//                                                                                              //
//  AUTHOR:                 Lagarto Development Team - lagarto@cic.ipn.mx						      //
//                                                                                              //
//  REVISION:               0.1 - First Revision - Creation                                     //
//                          0.2 - Valid Bit                                                     //
//									 0.3 - Tag                                                           //
//  								 0.4 - Init                                                           //
//                                                                                              //
//**********************************************************************************************//

/*
ADD = 32
----------------------------------
|		TAG	|		INDEX	|	OFF	|
|		20		|		 10	|	 2		|
----------------------------------
31			 12 11 		  2  1		0
*/


module	MSync #(
	parameter						ADDRW = 10,		//Ancho de palabra
	parameter						DATAW = 32,		//Ancho de datos
	parameter						TAGW	= 20
)(	
	input								clk_i,			//Reloj
	input								rst_ni,			//Reset bajo activo
	input								we_i,				//Habilitación de Escritura
	input			[DATAW-1:0]		addr_i,			//Dirección de lectura
	input			[DATAW-1:0]		addw_i,			//Dirección de escritura
	input			[DATAW-1:0]		dataw_i,			//Dato de escritura
	output		[DATAW-1:0]		datar_o,			//Dato de lectura		
	output							Hit_o				//Bit de Hit
);

	MSyncData	MSync_U0 (
		.clk_i						(clk_i),				//Reloj
		.rst_ni						(rst_ni),			//Reset bajo activo
		.we_i							(we_i),				//Habilitación de Escritura
		.addr_i						(addr_i[11:2]),	//Dirección de lectura
		.addw_i						(addw_i[11:2]),	//Dirección de escritura
		.dataw_i						(dataw_i),			//Dato de escritura
		.tagw_i						(addw_i[31:12]),	//Tag de escritura
		.tagr_i						(addr_i[31:12]),	//Tag de escritura
		.datar_o						(datar_o),			//Dato de lectura
		.Hit_o						(Hit_o)
	);

endmodule

module	MSyncData #(
	parameter						ADDRW = 10,		//Ancho de palabra
	parameter						DATAW = 32,		//Ancho de datos
	parameter						TAGW	= 20
)(	
	input								clk_i,			//Reloj
	input								rst_ni,			//Reset bajo activo
	input								we_i,				//Habilitación de Escritura
	input			[ADDRW-1:0]		addr_i,			//Dirección de lectura
	input			[ADDRW-1:0]		addw_i,			//Dirección de escritura
	input			[DATAW-1:0]		dataw_i,			//Dato de escritura
	input			[TAGW-1:0]		tagw_i,			//Tag de escritura
	input			[TAGW-1:0]		tagr_i,			//Tag de lectura
	output reg	[DATAW-1:0]		datar_o,			//Dato de lectura
	output reg						Hit_o				//Bit de Hit
);
	//Cache
	reg			[DATAW-1:0]		Cache			[2**ADDRW-1:0];
	//Valid Bit
	reg			[2**ADDRW-1:0] Valid;		
	reg								Validbit_r;
	//Tag field
	reg			[TAGW-1:0]		Tag			[2**ADDRW-1:0];
	reg			[TAGW-1:0]		TagField_r;
	reg								TagValid_r;
	
	//Iniciar Cache
	initial
	begin
//		$readmemb ("bubblesort_inst.bin", Cache);		//Binario
		$readmemh ("bubblesort_inst.hex", Cache);		//Hexadecimal
		$readmemh ("Tag.hex", Tag);						//Init Tag
	end
	
	
	//Puerto de escritura
	always @(posedge clk_i, negedge rst_ni)	//Dispara por flanco pos clk, y flanco neg rst
	begin
		if (!rst_ni) begin							//Reset activo
//			Valid = {2**ADDRW{1'b0}};				//Invalida datos
			Valid = 128'h1FFFFFFFF;					//Invalida datos

		end else begin									//Reset inactivo
			if (we_i) begin
				Cache[addw_i]	<=	dataw_i;			//Escribimos Dato de entrada
				Valid[addw_i]	<= 1'b1;				//Escribimos Bit de Válido
				Tag[addw_i]		<= tagw_i;			//Escribimos Tag de entrada
				
			end
		end
	end

	//Puerto de lectura
	always @(posedge clk_i)
	begin
		Validbit_r <= Valid[addr_i];			//Leemos bit de válido
		TagField_r <= Tag[addr_i];				//Leemos Tag
		
		if (TagField_r == tagr_i)				//Compara Tag de entrada con tag almacenado
		begin
			TagValid_r <= 1'b1;					//Tag válido
		end else begin
			TagValid_r <= 1'b0;					//Tag inválido
		end
		
		if (Validbit_r && TagValid_r) begin	//Si el dato y el tag son válido, se lee
			Hit_o		<= 1'b1;
			datar_o 	<= Cache[addr_i];
		end else begin
			Hit_o		<= 1'b0;
		end
	end
endmodule 
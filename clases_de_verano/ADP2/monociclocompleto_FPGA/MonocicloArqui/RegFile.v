//*********************************************************************************************//
//  TITLE:                  RegFile.v  					                                          //
//                                                                                              //
//  PROJECT:                Register File                                                       //
//  LANGUAGE:               Verilog						                                             //
//                                                                                              //
//  AUTHOR:                 Lagarto Development Team - lagarto@cic.ipn.mx						      //
//                                                                                              //
//  REVISION:               0.1 - First Revision - Creation                                     //
//                                                                                              //
//**********************************************************************************************//

module RegFile # (
	parameter				ADDRW = 5,		//Ancho de la dirección
	parameter				DATAW = 32		//Ancho de la palabra
)(
	input						clk_i,			//Reloj
	input						we_i,				//Habilitación de Escritura
	input		[ADDRW-1:0]	addar_i,			//Puerto A de lectura
	input		[ADDRW-1:0]	addbr_i,			//Puerto B de lectura
	input		[ADDRW-1:0]	addaw_i,			//Puerto A de escritura
	input		[DATAW-1:0]	dataaw_i,		//Dato A de escritura
	output	[DATAW-1:0]	dataar_o,		//Dato A de lectura
	output	[DATAW-1:0]	databr_o			//Dato B de lectura
);

	//Definir Banco de Registros
	reg		[DATAW-1:0]RegFile [2**ADDRW-1:0];

	initial
	begin
		RegFile[0]	=	{DATAW{1'b0}};
		RegFile[1]	=	{DATAW{1'b0}};
		RegFile[2]	=	{DATAW{1'b0}};
		RegFile[3]	=	{DATAW{1'b0}};
		RegFile[4]	=	{DATAW{1'b0}};
		RegFile[5]	=	{DATAW{1'b0}};
		RegFile[6]	=	{DATAW{1'b0}};
		RegFile[7]	=	{DATAW{1'b0}};
		RegFile[8]	=	{DATAW{1'b0}};
		RegFile[9]	=	{DATAW{1'b0}};
		RegFile[10]	=	{DATAW{1'b0}};
		RegFile[11]	=	{DATAW{1'b0}};
		RegFile[12]	=	{DATAW{1'b0}};
		RegFile[13]	=	{DATAW{1'b0}};
		RegFile[14]	=	{DATAW{1'b0}};
		RegFile[15]	=	{DATAW{1'b0}};
		RegFile[16]	=	{DATAW{1'b0}};
		RegFile[17]	=	{DATAW{1'b0}};
		RegFile[18]	=	{DATAW{1'b0}};
		RegFile[19]	=	{DATAW{1'b0}};
		RegFile[20]	=	{DATAW{1'b0}};
		RegFile[21]	=	{DATAW{1'b0}};
		RegFile[22]	=	{DATAW{1'b0}};
		RegFile[23]	=	{DATAW{1'b0}};
		RegFile[24]	=	{DATAW{1'b0}};
		RegFile[25]	=	{DATAW{1'b0}};
		RegFile[26]	=	{DATAW{1'b0}};
		RegFile[27]	=	{DATAW{1'b0}};
		RegFile[28]	=	{DATAW{1'b0}};
		RegFile[29]	=	{DATAW{1'b0}};
		RegFile[30]	=	{DATAW{1'b0}};
		RegFile[31]	=	{DATAW{1'b0}};
	end
	
	
	
	//Definir un puerto de escritura
	always @(posedge clk_i)
	begin
		if (we_i) begin
			RegFile[addaw_i] <= dataaw_i;
		end
	end

	//Puerto A de lectura
	assign	dataar_o = RegFile[addar_i];
	
	//Puerto B de lectura
	assign	databr_o = RegFile[addbr_i];
	
endmodule 
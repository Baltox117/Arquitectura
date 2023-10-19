module mux (
	//seccion para definir entradas
	
	input		a_i,
	input		b_i,
	input		s_i,
	
	//seccion para definir salidas
	output	reg	c_o

);
	//Abstraccion Comportamiento
	//always @(a_i, b_i, s_i)listar señales
	always @(*)//tomar todas las señales
	//begin
		if (s_i)
			begin
				c_o = a_i;
			end
		else
			begin
				c_o = b_i;
			end
		
	//end
	
	
	/*
	//Abtraccion algoritmo
	assign 	c_o = (s_i) ? a_i : b_i; 
	*/
	
	/*
	//Abstraccion Estructural
	//seccion de definicion de señales
	
	wire 		and1_w;
	wire		and2_w;
	wire		nots_w;
	
	not	not1	(nots_w, s_i);
	and	and1	(and1_w, a_1, s_i);
	and	and2	(and2_w, nots_w, b_i);
	or		or1	(c_o, and1_w, and2_w);
	*/
	
endmodule 
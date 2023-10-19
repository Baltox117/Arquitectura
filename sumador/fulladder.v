module fulladder (

	input		a_i,
	input		b_i,
	input		c_i,
	output	c_o,
	output	res_o

);

	wire		wireand1_w;
	wire		wireand2_w;
	wire		wireand3_w;
	wire		wirexor1_w;
	
	
	assign	wireand1_w = c_i & a_i;
	assign	wireand2_w = c_i & b_i;
	assign	wireand3_w = b_i & a_i;
	assign	wirexor1_w = a_i ^ b_i;
	assign	c_o		  = wireand1_w | wireand2_w | wireand3_w; 
	assign 	res_o 	  = wirexor1_w ^ c_i;

endmodule 
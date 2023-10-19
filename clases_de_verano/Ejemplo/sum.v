module sum (

	input			a_i,
	input			b_i,
	input			c_i,
	output		s_o,
	output		c_o
	
);

	wire	xor1_w;
	wire	and1_w;
	wire	or1_w;
	wire	and2_w;
	xor	xor1	(xor1_w, a_i, b_i);
	assign 		and1_w = a_i & b_i;
	//and	and1	(and1_w, a_i, b_i);
	or 	or1	(or1_w, a_i, b_i);
	and	and2	(and2_w, or1_w, c_i);
	xor	xor2	(s_o, xor1_w, c_i);
	or		or2	(c_o, and1_w, and2_w);

endmodule 
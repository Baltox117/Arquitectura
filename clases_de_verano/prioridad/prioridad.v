module prioridad (
	input				[3:0]	a_i,
	output	reg	[3:0]	y_o


);

	always @(*)
	begin
		if (a_i[3])
			y_o = 4'b1000;
		else if (a_i[2])
			y_o = 4'b0100;
		else if (a_i[1])
			y_o = 4'b0010;
		else if (a_i[0])
			y_o = 4'b0001;
		else
			y_o = 4'b0000;
	end

endmodule 
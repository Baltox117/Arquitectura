module divisor50mhz(

	input					clk_i,
	input					rst_ni,
	output	reg		clk1hz_o	
	
);

	reg 		[31:0]	ctr_w;
	
	always @(posedge clk_i, negedge rst_ni)
	begin
		if(!rst_ni)
			begin
				ctr_w 	= 32'b0;
				clk1hz_o = 1'b1;
			end
		else 
			if(ctr_w == 32'd50_000_000)
				begin
					ctr_w = 32'b0;
					clk1hz_o = ~clk1hz_o;
				end
			else
				begin
					ctr_w = ctr_w + 1'b1;
				end
	end


endmodule 
module divisor50mhz(

	input					clk_i, //señal de entrada para el reloj
	input					rst_ni,//señal de reset
	output	reg		clk1hz_o	//salida del la señal de reloj
	
);

	reg 		[31:0]	ctr_w;//variable de regristo para contar el numero de ciclos del reloj
	
	always @(posedge clk_i, negedge rst_ni)//bloque always se ejecuta con la señal positiva del reloj y en la señal negativa de reinicio del reset
	begin
		if(!rst_ni)// bloque de reinicio 
			begin
				ctr_w 	= 32'b0;// contador se pone en cero
				clk1hz_o = 1'b1;// señal de salida en alto
			end
		else 
			if(ctr_w == 32'd50_000_000)//comprobamos si alcanzo el valor de 50MHz
				begin
					ctr_w = 32'b0;//contador se pone en 0
					clk1hz_o = ~clk1hz_o;//invertimos la señal de salid
				end
			else
				begin
					ctr_w = ctr_w + 1'b1;// incremento del contador hasta que llegue a 50MHz
				end
	end


endmodule 
`timescale 1ns / 1ps


module shift1 #(parameter N = 32)
(input  [N-1:0] shift_i, 
output  [2*N-1:0]  shift_o);

assign shift_o = shift_i<<1 ;
endmodule

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/bdvth/OneDrive/Escritorio/Arquitectura_Practicas/practica1/alu/alu/sumador {C:/Users/bdvth/OneDrive/Escritorio/Arquitectura_Practicas/practica1/alu/alu/sumador/fulladder.v}
vlog -vlog01compat -work work +incdir+C:/Users/bdvth/OneDrive/Escritorio/Arquitectura_Practicas/practica1/alu/alu {C:/Users/bdvth/OneDrive/Escritorio/Arquitectura_Practicas/practica1/alu/alu/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/bdvth/OneDrive/Escritorio/Arquitectura_Practicas/practica1/alu/alu {C:/Users/bdvth/OneDrive/Escritorio/Arquitectura_Practicas/practica1/alu/alu/aluN.v}
vlog -vlog01compat -work work +incdir+C:/Users/bdvth/OneDrive/Escritorio/Arquitectura_Practicas/practica1/alu/alu {C:/Users/bdvth/OneDrive/Escritorio/Arquitectura_Practicas/practica1/alu/alu/disp7segs.v}
vlog -vlog01compat -work work +incdir+C:/Users/bdvth/OneDrive/Escritorio/Arquitectura_Practicas/practica1/alu/alu {C:/Users/bdvth/OneDrive/Escritorio/Arquitectura_Practicas/practica1/alu/alu/rom.v}
vlog -vlog01compat -work work +incdir+C:/Users/bdvth/OneDrive/Escritorio/Arquitectura_Practicas/practica1/alu/alu {C:/Users/bdvth/OneDrive/Escritorio/Arquitectura_Practicas/practica1/alu/alu/alu_fpga.v}


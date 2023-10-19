transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui {/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui/Sumador.v}
vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui {/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui/SignExt.v}
vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui {/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui/shiftL.v}
vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui {/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui/RegFile.v}
vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui {/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui/PC_Calc.v}
vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui {/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui/Mux_ALUSrc.v}
vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui {/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui/Monociclo.v}
vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui {/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui/Datamemory.v}
vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui {/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui/Control.v}
vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui {/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui/ALU_control.v}
vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui {/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui/ALU.v}
vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui {/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui/adder_shift.v}
vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui {/home/mars/ADP_Ronda3/ADP/monociclocompleto/MonocicloArqui/adder_calc.v}
vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto {/home/mars/ADP_Ronda3/ADP/monociclocompleto/branch_control.v}
vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto {/home/mars/ADP_Ronda3/ADP/monociclocompleto/meminstruction.v}

vlog -vlog01compat -work work +incdir+/home/mars/ADP_Ronda3/ADP/monociclocompleto/simulation/modelsim {/home/mars/ADP_Ronda3/ADP/monociclocompleto/simulation/modelsim/Monociclo.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  Monociclo_vlg_tst

add wave *
view structure
view signals
run -all

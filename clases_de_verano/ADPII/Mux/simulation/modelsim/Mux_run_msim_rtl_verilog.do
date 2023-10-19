transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/ADPII/Mux {F:/ADPII/Mux/Mux.v}

vlog -vlog01compat -work work +incdir+F:/ADPII/Mux/simulation/modelsim {F:/ADPII/Mux/simulation/modelsim/Mux.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  Mux_vlg_tst

add wave *
view structure
view signals
run -all

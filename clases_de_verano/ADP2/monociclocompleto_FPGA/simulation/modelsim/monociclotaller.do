onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/clk_i
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/rst_ni
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/wb_result_o
add wave -noupdate -divider {Fetch Stage}
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/InstMem_U2/addread_i
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/InstMem_U2/dataread_o
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/InstMem_U2/Cache
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/pc_o
add wave -noupdate -divider {Decode Stage}
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Control_U3/Instruction_i
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Control_U3/Branch_o
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Control_U3/Memread_o
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Control_U3/Memtoreg_o
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Control_U3/Aluop_o
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Control_U3/Memwrite_o
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Control_U3/Alusrc_o
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Control_U3/Regwrite_o
add wave -noupdate -divider {Read Register Stage}
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/RegFile_U3/we_i
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/RegFile_U3/addar_i
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/RegFile_U3/addbr_i
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/RegFile_U3/addaw_i
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/RegFile_U3/dataaw_i
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/RegFile_U3/dataar_o
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/RegFile_U3/databr_o
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/RegFile_U3/RegFile
add wave -noupdate -divider {Execution Stage}
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Execution_U5/ex_datars1_i
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Execution_U5/ex_datars2_i
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Execution_U5/ex_aluop_i
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Execution_U5/ex_data_o
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Execution_U5/ex_zerof_o
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Execution_U5/add_result_o
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Execution_U5/add_cout_o
add wave -noupdate -divider {Mem Access Stage}
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Data_memory_U15/we_i
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Data_memory_U15/rst_ni
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Data_memory_U15/addr_i
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Data_memory_U15/dataw_i
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Data_memory_U15/datar_o
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/Data_memory_U15/memread
add wave -noupdate -divider {Write Back Stage}
add wave -noupdate -radix hexadecimal /Monociclo_vlg_tst/DUT/wb_result_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6069 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {50369 ps}

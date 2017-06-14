onerror {quit -f}
vlib work
vlog -work work controlecooler.vo
vlog -work work controlecooler.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.controlecooler_vlg_vec_tst
vcd file -direction controlecooler.msim.vcd
vcd add -internal controlecooler_vlg_vec_tst/*
vcd add -internal controlecooler_vlg_vec_tst/i1/*
add wave /*
run -all

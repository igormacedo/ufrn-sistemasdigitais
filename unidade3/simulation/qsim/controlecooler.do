onerror {quit -f}
vlib work
vlog -work work controlecooler.vo
vlog -work work controlecooler.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.TestLatch_vlg_vec_tst
vcd file -direction controlecooler.msim.vcd
vcd add -internal TestLatch_vlg_vec_tst/*
vcd add -internal TestLatch_vlg_vec_tst/i1/*
add wave /*
run -all

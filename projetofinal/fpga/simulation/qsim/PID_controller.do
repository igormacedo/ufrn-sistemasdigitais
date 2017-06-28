onerror {quit -f}
vlib work
vlog -work work PID_controller.vo
vlog -work work PID_controller.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.rising_edge_detector_vlg_vec_tst
vcd file -direction PID_controller.msim.vcd
vcd add -internal rising_edge_detector_vlg_vec_tst/*
vcd add -internal rising_edge_detector_vlg_vec_tst/i1/*
add wave /*
run -all

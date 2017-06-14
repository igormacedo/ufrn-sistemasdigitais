library verilog;
use verilog.vl_types.all;
entity controlecooler_vlg_check_tst is
    port(
        PWM1_signal_out : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end controlecooler_vlg_check_tst;

library verilog;
use verilog.vl_types.all;
entity TestLatch_vlg_sample_tst is
    port(
        Clear           : in     vl_logic;
        D               : in     vl_logic;
        enable          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end TestLatch_vlg_sample_tst;

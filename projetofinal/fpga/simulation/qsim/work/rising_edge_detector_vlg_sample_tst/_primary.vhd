library verilog;
use verilog.vl_types.all;
entity rising_edge_detector_vlg_sample_tst is
    port(
        clear           : in     vl_logic;
        clk             : in     vl_logic;
        enable          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end rising_edge_detector_vlg_sample_tst;

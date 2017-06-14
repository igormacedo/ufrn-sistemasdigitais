library verilog;
use verilog.vl_types.all;
entity controlecooler_vlg_sample_tst is
    port(
        CLK_50MHz       : in     vl_logic;
        PWM1_clr        : in     vl_logic;
        PWN1_en         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end controlecooler_vlg_sample_tst;

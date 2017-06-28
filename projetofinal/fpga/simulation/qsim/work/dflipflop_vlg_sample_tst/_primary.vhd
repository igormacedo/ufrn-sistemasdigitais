library verilog;
use verilog.vl_types.all;
entity dflipflop_vlg_sample_tst is
    port(
        clear           : in     vl_logic;
        clk             : in     vl_logic;
        d               : in     vl_logic_vector(31 downto 0);
        enable          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end dflipflop_vlg_sample_tst;

library verilog;
use verilog.vl_types.all;
entity controller_block_vlg_sample_tst is
    port(
        clock_controler_in: in     vl_logic;
        enable_in       : in     vl_logic;
        kd_in           : in     vl_logic_vector(31 downto 0);
        ki_in           : in     vl_logic_vector(31 downto 0);
        kp_in           : in     vl_logic_vector(31 downto 0);
        pv_speed_in     : in     vl_logic_vector(31 downto 0);
        set_speed_in    : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end controller_block_vlg_sample_tst;

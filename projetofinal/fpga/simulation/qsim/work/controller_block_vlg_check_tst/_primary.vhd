library verilog;
use verilog.vl_types.all;
entity controller_block_vlg_check_tst is
    port(
        pwm_float       : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end controller_block_vlg_check_tst;

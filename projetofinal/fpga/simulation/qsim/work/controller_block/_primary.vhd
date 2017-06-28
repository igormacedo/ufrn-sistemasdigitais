library verilog;
use verilog.vl_types.all;
entity controller_block is
    port(
        pwm_float       : out    vl_logic_vector(31 downto 0);
        clock_controler_in: in     vl_logic;
        set_speed_in    : in     vl_logic_vector(31 downto 0);
        pv_speed_in     : in     vl_logic_vector(31 downto 0);
        kp_in           : in     vl_logic_vector(31 downto 0);
        enable_in       : in     vl_logic;
        kd_in           : in     vl_logic_vector(31 downto 0);
        ki_in           : in     vl_logic_vector(31 downto 0)
    );
end controller_block;

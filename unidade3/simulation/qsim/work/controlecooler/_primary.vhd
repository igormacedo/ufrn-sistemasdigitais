library verilog;
use verilog.vl_types.all;
entity controlecooler is
    port(
        PWM1_signal_out : out    vl_logic;
        CLK_50MHz       : in     vl_logic;
        PWN1_en         : in     vl_logic;
        PWM1_clr        : in     vl_logic
    );
end controlecooler;

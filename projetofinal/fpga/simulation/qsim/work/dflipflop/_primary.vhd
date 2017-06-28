library verilog;
use verilog.vl_types.all;
entity dflipflop is
    port(
        d               : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        clear           : in     vl_logic;
        enable          : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end dflipflop;

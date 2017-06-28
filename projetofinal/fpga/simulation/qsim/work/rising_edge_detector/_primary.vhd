library verilog;
use verilog.vl_types.all;
entity rising_edge_detector is
    port(
        clk             : in     vl_logic;
        clear           : in     vl_logic;
        enable          : in     vl_logic;
        q               : out    vl_logic_vector(31 downto 0)
    );
end rising_edge_detector;

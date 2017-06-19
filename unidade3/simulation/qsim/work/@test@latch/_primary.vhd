library verilog;
use verilog.vl_types.all;
entity TestLatch is
    port(
        \OUt\           : out    vl_logic;
        Clear           : in     vl_logic;
        D               : in     vl_logic;
        enable          : in     vl_logic
    );
end TestLatch;

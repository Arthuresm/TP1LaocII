library verilog;
use verilog.vl_types.all;
entity cache_ass_conj is
    port(
        reset           : in     vl_logic;
        clock           : in     vl_logic;
        habilita        : in     vl_logic;
        endereco        : in     vl_logic_vector(3 downto 0);
        DIN             : in     vl_logic_vector(7 downto 0);
        hit             : out    vl_logic;
        WB_needed       : out    vl_logic;
        DOUT            : out    vl_logic_vector(7 downto 0);
        WB              : out    vl_logic_vector(13 downto 0);
        via0_lru        : out    vl_logic_vector(3 downto 0);
        via1_lru        : out    vl_logic_vector(3 downto 0)
    );
end cache_ass_conj;

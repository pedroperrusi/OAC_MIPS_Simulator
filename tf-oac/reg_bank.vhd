library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_bank is

	generic
	(
		DATA_WIDTH 		: natural := 32;
		ADDRESS_WIDTH 	: natural := 5
	);
	port (
		clk, wren 				: in std_logic;
		radd1, radd2, wadd 	: in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
		raddFpga					: in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
		wdata 					: in std_logic_vector(DATA_WIDTH -1 downto 0);
		rdata1, rdata2 		: out std_logic_vector(DATA_WIDTH -1 downto 0);
		rdataFpga				: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);
	
end entity reg_bank;

architecture rtl of reg_bank is
	
  constant ZERO32: std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
  type reg_array_t is array(natural range <>) of std_logic_vector(DATA_WIDTH-1 downto 0);
  signal breg: reg_array_t((2**ADDRESS_WIDTH)-1 downto 0) := (others => (others => '0'));


	
begin
	--leitura dos registradores
	rdata1 <= ZERO32 when (radd1 = "00000") else breg(to_integer(unsigned(radd1)));
	rdata2 <= ZERO32 when (radd2 = "00000") else breg(to_integer(unsigned(radd2)));
	rdataFpga <= ZERO32 when (raddFpga = "00000") else breg(to_integer(unsigned(raddFpga)));
	
	--processo de escrita de um registrador do banco
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(wren = '1') then
				breg(to_integer(unsigned(wadd))) <= wdata;
			end if;
		end if;
	end process;

end rtl;

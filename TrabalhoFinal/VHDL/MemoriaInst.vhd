library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade que representa a memoória de instruções do processador MIPS --
entity MemoriaInst is

 generic(N: integer := 7; M: integer := 32);
 port(
			clk:  in  STD_LOGIC; 
			adr: in std_logic_vector(N-1 downto 0) := (others => '0');
			inst: out std_logic_vector(M-1 downto 0) := (others => '0')
		);
		
end entity MemoriaInst;

architecture arch of MemoriaInst is

	type mem_array is array(0 to (2**N-1)) of std_logic_vector(M-1 downto 0);
	signal mem: mem_array := (
										x"21080005",
										others => (others => '1')
									 );
									 
begin
	
	process(clk) begin
	
		if clk'event and clk='1' then 
			
			inst <= mem(to_integer(unsigned(adr)));
			
		end if;
		
	end process;
	
end arch;

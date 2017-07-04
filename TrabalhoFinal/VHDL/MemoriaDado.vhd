library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade que representa a memoória de dados do processador MIPS --
entity MemoriaDado is

 generic(N: integer := 7; M: integer := 32);
 port(
			clk, escreveMem:  in  STD_LOGIC; 
			adr: in std_logic_vector(N-1 downto 0) := (others => '0');
			dado: out std_logic_vector(M-1 downto 0) := (others => '0')
		); 
		
end entity MemoriaDado;

architecture arch of MemoriaDado is

	type mem_array is array(0 to (2**N-1)) of std_logic_vector(M-1 downto 0);
	signal mem: mem_array := (
										x"0000001b",
										x"0000002e",
										x"00000000",
										x"00000000",
										x"00000000",
										x"00000000",
										x"00000000",
										x"00000000",
										x"00000000",
										x"00000000",
										x"00000000",
										x"00000000",
										x"00000000",
										x"00000000",
										x"00000000",
										x"00000000",
										others => (others => '1')
									 );
									 
begin
	
	process(clk,escreveMem) begin
	
		if clk'event and clk = '1' and escreveMem = '1' then 
			
			dado <= mem(to_integer(unsigned(adr)));
			
		end if;
	end process;
	
end arch;

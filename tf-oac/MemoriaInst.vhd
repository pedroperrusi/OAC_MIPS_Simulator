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
											x"00000000",
											x"8c092000",
											x"8c0a2004",
											x"212bfff6",
											x"212bffff",
											x"312bffff",
											x"3c010f0f",
											x"34210f0f",
											x"01416025",
											x"294b0032",
											x"294b000a",
											x"3c010fff",
											x"3421ffff",
											x"01215826",
											x"012a6020",
											x"012a5822",
											x"012a6024",
											x"012a5825",
											x"012a6027",
											x"012a582a",
											x"012a602a",
											x"00094940",
											x"00055142",
											x"00065143",
											x"00a64826",
											x"0800001e",
											x"112a000a",
											x"152a0009",
											x"ac0c2000",
											x"000b4820",
											x"20090090",
											x"01200008",
											x"00002820",
											x"00002820",
											x"00002820",
											x"00007820",
											x"0c00001a",
											x"20090005",

										others => (others => '1')
									 );
									 
begin
	
	process(clk) begin
	
		if clk'event and clk='1' then 
			
			inst <= mem(to_integer(unsigned(adr)));
			
		end if;
		
	end process;
	
end arch;

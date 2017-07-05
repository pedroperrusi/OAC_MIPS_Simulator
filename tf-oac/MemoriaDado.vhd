library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade que representa a memoória de dados do processador MIPS --
entity MemoriaDado is

 generic(N: integer := 7; M: integer := 32);
 port(
			clk, escreveMem:  in  STD_LOGIC; 
			adr: in std_logic_vector(N-1 downto 0) := (others => '0');
			input_fpga : in std_logic_vector(N-1 downto 0);
			wdata: in std_logic_vector(M-1 downto 0);
			dado: out std_logic_vector(M-1 downto 0) := (others => '0');
			output_fpga : out std_logic_vector(M-1 downto 0)
		); 
		
end entity MemoriaDado;

architecture arch of MemoriaDado is

	type mem_array is array(0 to (2**N-1)) of std_logic_vector(M-1 downto 0);
	signal mem: mem_array := (
										x"0000001b",
										x"0000002e",
										x"0000002a",
										x"0000002b",
										x"0000002c",
										x"0000002d",
										x"0000002f",
										x"00000030",
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
	
	process(clk,escreveMem,mem,adr) begin
		
		dado <= mem(to_integer(unsigned(shift_right(unsigned(adr),2))));
		output_fpga <= mem(to_integer(unsigned(input_fpga)));
		
		if rising_edge(clk) and escreveMem = '1' then 
			
			mem(to_integer(unsigned(adr))) <= wdata;
			
		end if;
	end process;
	
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade Multiplexador no MIPS com duas entradas --
entity Mux2 is
	generic (DATA_WIDTH : natural := 32);

port( 
	a,b: in std_logic_vector(DATA_WIDTH -1 downto 0) := (OTHERS => '0');
	operation : in std_logic;
	output: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end entity Mux2;

--Definição da arquitetura --
architecture arch of Mux2 is

constant ALL_X : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => 'X');

begin

	process(a,b,operation)
	begin
	
		if operation = '0' and a /= ALL_X then
		
			output <= a;
				
		elsif operation = '1' and b /= ALL_X then
				
			output <= b;
			
		end if;
	end process;
	
end architecture;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade que representa o contador de programa do sistema --
entity Contador_Programa is
port( 
	input: in std_logic_vector(31 downto 0) := x"00000000";
	output: out std_logic_vector(31 downto 0)
	);
	
end entity Contador_Programa;

architecture arch of Contador_Programa is
begin

	process(input)
	begin
			
		output <= input;
		
	end process;

end arch;

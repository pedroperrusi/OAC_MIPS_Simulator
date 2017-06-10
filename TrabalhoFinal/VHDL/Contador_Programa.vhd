library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade que representa o contador de programa do sistema --
entity Contador_Programa is
port( 
	input: in std_logic_vector(32 downto 0);
	w: in std_logic;
	output: out std_logic_vector(32 downto 0)
	);
	
end entity Contador_Programa;

architecture arch of Contador_Programa is
begin

	process(w,input)
	begin
		
		if w = '1' then
			
			output <= input;
		
		else

		end if;
	end process;

end arch;

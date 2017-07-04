library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade que representa o contador de programa do sistema --
entity Contador_Programa is
port( 
	input: in std_logic_vector(31 downto 0) := (OTHERS => '0');
	clk: in std_logic;
	output: out std_logic_vector(31 downto 0) := (OTHERS => '0')
	);
	
end entity Contador_Programa;

architecture arch of Contador_Programa is

signal output_signal : std_logic_vector(31 downto 0);

begin
	
	process(clk,input)
	begin
		
		output_signal <= input;
		
		if falling_edge(clk) then
			
			output <= output_signal;
			
		end if;
		
	end process;

end arch;

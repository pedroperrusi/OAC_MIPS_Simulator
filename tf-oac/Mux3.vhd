library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade Multiplexador no MIPS com duas entradas --
entity Mux3 is
	generic (DATA_WIDTH : natural := 5);

port( 
	a,b,c: in std_logic_vector(DATA_WIDTH -1 downto 0);
	operation : in std_logic_vector(1 downto 0);
	output: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end entity Mux3;

--Definição da arquitetura --
architecture arch of Mux3 is
begin

	process(a,b,operation)
	begin
	
		if operation = "00" then
		
			output <= a;
		
		elsif operation = "01" then
		
			output <= b;
		
		elsif operation = "10" then
		
			output <= c;
		
		end if;
	end process;
	
end architecture;
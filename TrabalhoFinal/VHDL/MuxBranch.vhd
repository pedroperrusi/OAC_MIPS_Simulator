library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade Multiplexador no MIPS com duas entradas --
entity MuxBranch is

port( 
	a,b: in std_logic;
	operation : in std_logic;
	output: out std_logic
	);

end entity MuxBranch;

--Definição da arquitetura --
architecture arch of MuxBranch is
begin

	process(a,b,operation)
	begin
	
		if operation = '0' then
		
			output <= a;
				
		elsif operation = '1' then
				
			output <= b;
			
		end if;
	end process;
	
end architecture;
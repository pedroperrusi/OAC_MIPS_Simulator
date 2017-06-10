library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade que detecta quando a saída da ULA é negativa --
entity Detector_Negative is
	generic (DATA_WIDTH : natural := 32);

port( 
	output: in std_logic_vector(DATA_WIDTH -1 downto 0);
	negative: out std_logic
	);

end entity Detector_Negative;

--Definição da arquitetura --
architecture arch of Detector_Negative is
begin
	
	process(output)
	begin 
		
		if signed(output) < 0 then
		
			negative <= '1';
		
		else
			
			negative <= '0';
			
		end if;
	end process;

end architecture;
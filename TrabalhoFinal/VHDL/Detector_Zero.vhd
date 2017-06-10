library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade que detecta quando a saída da ULA é igual a 0 --
entity Detector_Zero is
	generic (DATA_WIDTH : natural := 32);

port( 
	output: in std_logic_vector(DATA_WIDTH -1 downto 0);
	zero: out std_logic
	);

end entity Detector_Zero;

--Definição da arquitetura --
architecture arch of Detector_Zero is
begin
	
	process(output)
	begin 
		
		if output = std_logic_vector(to_signed(0, DATA_WIDTH)) then
		
			zero <= '1';
		
		else
			
			zero <= '0';
			
		end if;
	end process;

end architecture;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade que detecta quando há overflow nas operações de SOMA --
entity Detector_Overflow is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b, z: in std_logic_vector(DATA_WIDTH -1 downto 0);
	operation : in std_logic_vector(3 downto 0);
	overflow: out std_logic
	);

end entity Detector_Overflow;

--Definição da arquitetura --
architecture arch of Detector_Overflow is
begin
	
	process(a,b,z,operation)
	begin 
		
		if operation = "0010" then
			-- Caso a e b sejam maiores que zero e sua soma seja negativa, deu overflow
			if (signed(a) > to_signed(0,DATA_WIDTH)) and (signed(b) > to_signed(0,DATA_WIDTH)) and (signed(z) < to_signed(0,DATA_WIDTH)) then 	 
			
				overflow <= '1';
			
			-- Caso a e b sejam menores que zero e sua soma seja positiva, deu overflow
			elsif (signed(a) < to_signed(0,DATA_WIDTH)) and (signed(b) < to_signed(0,DATA_WIDTH)) and (signed(z) > to_signed(0,DATA_WIDTH)) then
			
				overflow <= '1';
			
			else
			
				overflow <= '0';
			
			end if;
		
		else
			
			overflow <= '0';
		
		end if;
	end process;

end architecture;
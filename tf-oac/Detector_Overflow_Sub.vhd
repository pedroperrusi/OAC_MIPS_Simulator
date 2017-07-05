library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade que detecta quando há overflow nas operações de SUBTRAÇÃO --
entity Detector_Overflow_Sub is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b, z: in std_logic_vector(DATA_WIDTH -1 downto 0);
	operation : in std_logic_vector(3 downto 0);
	overflow: out std_logic
	);

end entity Detector_Overflow_sub;

--Definição da arquitetura --
architecture arch of Detector_Overflow_sub is
begin
	
	process(a,b,z,operation)
	begin 
		
		if operation = "0011" then
			-- Caso subtraia-se um negativo de um positivo e o resultado for negativo, deu overflow
			if (signed(a) > to_signed(0,DATA_WIDTH)) and (signed(b) < to_signed(0,DATA_WIDTH))
				and (signed(z) < to_signed(0,DATA_WIDTH)) then 	 
			
				overflow <= '1';
			
			-- Caso subtraia-se um positivo de um negativo e o resultado for positivo, deu overflow
			elsif (signed(a) < to_signed(0,DATA_WIDTH)) and (signed(b) > to_signed(0,DATA_WIDTH))
					and (signed(z) > to_signed(0,DATA_WIDTH)) then
			
				overflow <= '1';
			
			else
			
				overflow <= '0';
			
			end if;
		else
		
			overflow <= '0';
		
		end if;
	end process;

end architecture;
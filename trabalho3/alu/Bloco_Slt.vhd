library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade do bloco que efetua operações SLT na ULA --
entity Bloco_Slt is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end entity Bloco_Slt;

--Definição da arquitetura --
architecture arch of Bloco_Slt is
begin 
	
	process(a,b)
	begin
	
		if a < b then
		
			z <= std_logic_vector(to_signed(1, DATA_WIDTH));
	
		end if;
	end process;

end architecture;
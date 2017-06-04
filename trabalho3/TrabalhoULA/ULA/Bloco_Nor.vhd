library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade do bloco que efetua operações NOR na ULA --
entity Bloco_Nor is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end entity Bloco_Nor;

--Definição da arquitetura --
architecture arch of Bloco_Nor is
begin
	
	z <= std_logic_vector(signed(a) nor signed(b));

end architecture;
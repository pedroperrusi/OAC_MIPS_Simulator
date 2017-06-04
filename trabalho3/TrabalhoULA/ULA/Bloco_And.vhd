library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade do bloco que efetua operações AND na ULA --
entity Bloco_And is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end entity Bloco_And;

--Definição da arquitetura --
architecture arch of Bloco_And is
begin
	
	z <= std_logic_vector(signed(a) and signed(b));

end architecture;
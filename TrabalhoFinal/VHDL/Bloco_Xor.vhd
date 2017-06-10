library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade do bloco que efetua operações XOR na ULA --
entity Bloco_Xor is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end entity Bloco_Xor;

--Definição da arquitetura --
architecture arch of Bloco_Xor is
begin
	
	z <= std_logic_vector(signed(a) xor signed(b));

end architecture;
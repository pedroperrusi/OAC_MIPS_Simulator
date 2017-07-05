library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade do bloco que efetua operações SUB na ULA --
entity Subtrator is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0) := x"00000000";
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end entity Subtrator;

--Definição da arquitetura --
architecture arch of Subtrator is
begin
	
	z <= std_logic_vector(signed(a) - signed(b));

end architecture;
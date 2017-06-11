library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade que extende o sinal na ULA --
entity ExtensorDeSinal is
	generic (DATA_WIDTH : natural := 16);

port( 
	input: in std_logic_vector(DATA_WIDTH -1 downto 0);
	output: out std_logic_vector(31 downto 0)
	);

end entity ExtensorDeSinal;

--Definição da arquitetura --
architecture arch of ExtensorDeSinal is
begin
	
	output <= std_logic_vector(resize(signed(input), output'length));

end architecture;
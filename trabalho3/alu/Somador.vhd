library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade do bloco que efetua operações Add na ULA --
entity Somador is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0);
	c_out: out std_logic
	);

end entity Somador;

--Definição da arquitetura --
architecture arch of Somador is
begin
	
	z <= std_logic_vector(signed(a) + signed(b));

end architecture;
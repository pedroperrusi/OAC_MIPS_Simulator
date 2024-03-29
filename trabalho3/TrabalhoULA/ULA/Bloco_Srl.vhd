library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade do bloco que efetua operações SRL na ULA --
entity Bloco_Srl is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end entity Bloco_Srl;

--Definição da arquitetura --
architecture arch of Bloco_Srl is
begin
	
	z <= std_logic_vector(shift_right(unsigned(a),to_integer(signed(b))));

end architecture;
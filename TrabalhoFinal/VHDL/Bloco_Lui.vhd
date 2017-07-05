library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade do bloco que efetua operações LUI na ULA --
entity Bloco_Lui is
	generic (DATA_WIDTH : natural := 32);

port( 
	a : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end entity Bloco_Lui;

--Definição da arquitetura --
architecture arch of Bloco_Lui is
begin
	
	z <= std_logic_vector(shift_left(signed(a),16));

end architecture;
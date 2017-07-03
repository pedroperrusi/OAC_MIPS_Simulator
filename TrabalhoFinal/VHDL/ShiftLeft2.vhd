library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade do bloco que efetua operações SLL 2 --
entity ShiftLeft2 is

port( 
	a: in std_logic_vector(25 downto 0);
	z: out std_logic_vector(27 downto 0)
	);

end entity ShiftLeft2;

--Definição da arquitetura --
architecture arch of ShiftLeft2 is
begin
	
	z(27 downto 2) <= a;
	z(1 downto 0) <= (others => '0');
	
end architecture;
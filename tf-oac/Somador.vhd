library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade do bloco que efetua operações Add na ULA --
entity Somador is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0) := x"00000000";
	z: out std_logic_vector(DATA_WIDTH -1 downto 0);
	c_out: out std_logic
	);

end entity Somador;

--Definição da arquitetura --
architecture arch of Somador is

signal z_ext,a_ext,b_ext : signed(DATA_WIDTH downto 0);

begin
	
	z <= std_logic_vector(signed(a) + signed(b));
	
	-- Detecção do carry --
	a_ext <= signed("0" & a);			-- Extendendo valor de a em 1 bit
	b_ext <= signed("0" & b);			-- Extendendo valor de b em 1 bit
		
	z_ext <= a_ext + b_ext;				-- Somando para calcular o carry 
	c_out <= z_ext(DATA_WIDTH);		-- O último bit de z_ext representa o carry out da soma 
	
end architecture;
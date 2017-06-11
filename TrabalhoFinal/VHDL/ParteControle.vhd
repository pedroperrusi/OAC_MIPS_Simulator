library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade que representa a parte de controle do processador MIPS --
entity ParteControle is
port( 
	input : in std_logic_vector(5 downto 0);
	regdst, jump, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite: out std_logic
	);

end entity ParteControle;

architecture arch of ParteControle is
begin
end arch;

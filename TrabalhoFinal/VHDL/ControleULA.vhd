library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade que controla a ULA --
entity ControleULA is

port( 
	instrucao: in std_logic_vector(5 downto 0);
	ALUop : in std_logic;
	operation: out std_logic_vector(3 downto 0)
	);

end entity ControleULA;

--Definição da arquitetura --
architecture arch of ControleULA is
begin

	process(instrucao, ALUop)
	begin
		
		if ALUop = '1' then
			
			operation <= "1111";
			
		else
			
			if instrucao = "100100" then
					
				operation <= "0000";
			
			elsif instrucao = "100101" then
			
				operation <= "0001";
				
			elsif instrucao = "100000" then
			
				operation <= "0010";
			
			elsif instrucao = "100010" then
			
				operation <= "0011";
			
			elsif instrucao = "101010" then
			
				operation <= "0100";
				
			elsif instrucao = "100111" then
			
				operation <= "0101";
			
			elsif instrucao = "100110" then
			
				operation <= "0110";
			
			elsif instrucao = "000000" then
			
				operation <= "0111";
			
			elsif instrucao = "000010" then
			
				operation <= "1000";
				
			elsif instrucao = "000011" then
			
				operation <= "1001";
			
			end if;
		
		end if;
	end process;
	
end architecture;
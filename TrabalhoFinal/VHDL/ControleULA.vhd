library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade que controla a ULA --
entity ControleULA is

port( 
	instrucao: in std_logic_vector(5 downto 0);
	ALUop : in std_logic_vector(3 downto 0) := "0000";
	operation: out std_logic_vector(3 downto 0)
	);

end entity ControleULA;

--Definição da arquitetura --
architecture arch of ControleULA is
begin

	process(instrucao, ALUop)
	begin
		
		if ALUop = "0000" then
			
			operation <= "0010"; -- ADD
		
		elsif ALUop = "0001" then
			
			operation <= "0110"; -- SUB
		
		elsif ALUop = "10" then
			
			if instrucao = "100100" then	
					
				operation <= "0000";	-- AND
			
			elsif instrucao = "100101" then
			
				operation <= "0001";	-- OR
				
			elsif instrucao = "100000" then
			
				operation <= "0010";	-- ADD
			
			elsif instrucao = "100010" then
			
				operation <= "0011";	-- SUB
			
			elsif instrucao = "101010" then
			
				operation <= "0100"; -- SLT
				
			elsif instrucao = "100111" then
			
				operation <= "0101"; -- NOR
			
			elsif instrucao = "100110" then
			
				operation <= "0110"; -- XOR
			
			elsif instrucao = "000000" then
			
				operation <= "0111"; -- SLL
			
			elsif instrucao = "000010" then
			
				operation <= "1000"; -- SRL
				
			elsif instrucao = "000011" then
			
				operation <= "1001"; -- SRA
			
			end if;
		
		elsif ALUop = "0011" then 
			
				operation <= "0010"; -- ADDI
		
		elsif ALUop = "0100" then 
			
				operation <= "0000"; -- ANDI
				
		elsif ALUop = "0101" then 
			
				operation <= "0001"; -- ORI
				
		elsif ALUop = "0110" then 
			
				operation <= "0100"; -- SLTI
		
		elsif ALUop = "0111" then 
			
				operation <= "0110"; -- XORI
				
		end if;
	end process;
	
end architecture;
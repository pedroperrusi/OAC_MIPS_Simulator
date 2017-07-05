library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade que representa a parte de controle do processador MIPS --
entity ParteControle is
port( 
	input : in std_logic_vector(5 downto 0);
	inst5 : in std_logic_vector(5 downto 0);
	jump, branch, branchNotEqual, seletor_branch, memread, memwrite, alusrc, regwrite, jumpRegister: out std_logic;
	regdst, memtoreg : out std_logic_vector(1 downto 0);
	aluop: out std_logic_vector(3 downto 0)
	);

end entity ParteControle;

architecture arch of ParteControle is
begin

	process(input, inst5)
	begin
		
		if input = "000000" then 	-- Tipo R
			
			if inst5 = "001000" then  -- JR 
					
					regdst <= "01";
					jump <= '0';
					branch <= '0';
					branchNotEqual <= '0';
					seletor_branch <= '0';
					memread <= '0';
					memtoreg <= "00";
					aluop <= "0010";
					memwrite <= '0';
					alusrc <= '0';
					regwrite <= '1';
					jumpRegister <= '1';
				
			else		-- OUTRA QUE NAO EH JR
				
					regdst <= "01";
					jump <= '0';
					branch <= '0';
					branchNotEqual <= '0';
					seletor_branch <= '0';
					memread <= '0';
					memtoreg <= "00";
					aluop <= "0010";
					memwrite <= '0';
					alusrc <= '0';
					regwrite <= '1';
					jumpRegister <= '0';
			
			end if;
					
		
		elsif input = "100011" then	-- LW
		
			regdst <= "00";
			jump <= '0';
			branch <= '0';
			branchNotEqual <= '0';
			seletor_branch <= '0';
			memread <= '1';
			memtoreg <= "01";
			aluop <= "0000";
			memwrite <= '0';
			alusrc <= '1';
			regwrite <= '1';
			jumpRegister <= '0';
		
		elsif input = "101011" then	-- SW
		
			regdst <= "00"; -- 'X'
			jump <= '0';
			branch <= '0';
			branchNotEqual <= '0';
			seletor_branch <= '0';
			memread <= '0';
			memtoreg <= "00"; -- 'X'
			aluop <= "0000";
			memwrite <= '1';
			alusrc <= '1';
			regwrite <= '0';
			jumpRegister <= '0';
		
		elsif input = "000100" then	-- BEQ
		
			regdst <= "00"; -- 'X'
			jump <= '0';
			branch <= '1';
			branchNotEqual <= '0';
			seletor_branch <= '0';
			memread <= '0';
			memtoreg <= "00";
			aluop <= "0001";
			memwrite <= '0';
			alusrc <= '0';
			regwrite <= '0';
			jumpRegister <= '0';
			
		elsif input = "001000" then 	-- ADDI
		
			regdst <= "00"; 
			jump <= '0';
			branch <= '0';
			branchNotEqual <= '0';
			seletor_branch <= '0';
			memread <= '0';
			memtoreg <= "00";
			aluop <= "0011";
			memwrite <= '0';
			alusrc <= '1';
			regwrite <= '1';
			jumpRegister <= '0';
			
		elsif input = "001100" then 	-- ANDI
		
			regdst <= "00"; 
			jump <= '0';
			branch <= '0';
			branchNotEqual <= '0';
			seletor_branch <= '0';
			memread <= '0';
			memtoreg <= "00";
			aluop <= "0100";
			memwrite <= '0';
			alusrc <= '1';
			regwrite <= '1';
			jumpRegister <= '0';
		
		elsif input = "001101" then 	-- ORI
		
			regdst <= "00"; 
			jump <= '0';
			branch <= '0';
			branchNotEqual <= '0';
			seletor_branch <= '0';
			memread <= '0';
			memtoreg <= "00";
			aluop <= "0101";
			memwrite <= '0';
			alusrc <= '1';
			regwrite <= '1';
			jumpRegister <= '0';
			
		elsif input = "001010" then 	-- SLTI
		
			regdst <= "00"; 
			jump <= '0';
			branch <= '0';
			branchNotEqual <= '0';
			seletor_branch <= '0';
			memread <= '0';
			memtoreg <= "00";
			aluop <= "0110";
			memwrite <= '0';
			alusrc <= '1';
			regwrite <= '1';
			jumpRegister <= '0';
			
		elsif input = "001110" then 	-- XORI 
		
			regdst <= "00"; 
			jump <= '0';
			branch <= '0';
			branchNotEqual <= '0';
			seletor_branch <= '0';
			memread <= '0';
			memtoreg <= "00";
			aluop <= "0111";
			memwrite <= '0';
			alusrc <= '1';
			regwrite <= '1';
			jumpRegister <= '0';
			
		elsif input = "000010" then 	-- JUMP    
		
			regdst <= "00"; 
			jump <= '1';
			branch <= '0';
			branchNotEqual <= '0';
			seletor_branch <= '0';
			memread <= '0';
			memtoreg <= "00";
			aluop <= "0000";
			memwrite <= '0';
			alusrc <= '1';
			regwrite <= '1';
			jumpRegister <= '0';
			
		elsif input = "001111" then 	-- LUI
		
			regdst <= "00"; 
			jump <= '0';
			branch <= '0';
			branchNotEqual <= '0';
			seletor_branch <= '0';
			memread <= '0';
			memtoreg <= "00";
			aluop <= "1000";
			memwrite <= '0';
			alusrc <= '1';
			regwrite <= '1';
			jumpRegister <= '0';
			
		elsif input = "000101" then 	-- BNE
		
			regdst <= "00"; -- 'X'
			jump <= '0';
			branch <= '0';
			branchNotEqual <= '1';
			seletor_branch <= '1';
			memread <= '0';
			memtoreg <= "00";
			aluop <= "0001";
			memwrite <= '0';
			alusrc <= '0';
			regwrite <= '0';
			jumpRegister <= '0';
			
		elsif input = "000011" then 	-- JAL
		
			regdst <= "10";
			jump <= '1';
			branch <= '0';
			branchNotEqual <= '0';
			seletor_branch <= '0';
			memread <= '0';
			memtoreg <= "10";
			aluop <= "0000";
			memwrite <= '0';
			alusrc <= '0';
			regwrite <= '1';
			jumpRegister <= '0';
			
		else	-- OUTROS
			
			regdst <= "XX"; 
			jump <= 'X';
			branch <= 'X';
			branchNotEqual <= 'X';
			seletor_branch <= 'X';
			memread <= 'X';
			memtoreg <= "XX";
			aluop <= "XXXX";
			memwrite <= 'X';
			alusrc <= 'X';
			regwrite <= 'X';
			jumpRegister <= 'X';
		
		end if;
	end process;
	
end arch;

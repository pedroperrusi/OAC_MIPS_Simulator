library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

--Entidade para test bench --
entity ULA_test_bench is
end entity ULA_test_bench;
 
 
--Definição da arquitetura da ULA_test_bench --
architecture ULA_arch of ULA_test_bench is

constant DATA_WIDTH : natural := 32;

-- Declaração do componente a ser utilizado no test bench --
component ULA is
	generic (DATA_WIDTH : natural := 32);

port (
	input1, input2 : in std_logic_vector(DATA_WIDTH -1 downto 0);
	operation : in std_logic_vector(3 downto 0);
	output : out std_logic_vector(DATA_WIDTH -1 downto 0);
	zero, negative : out std_logic;
	carry, overflow : out std_logic
	);

end component;
-- Fim componente --

-- Definição dos sinais que serão utilizados --
signal input1,input2 : std_logic_vector(DATA_WIDTH -1 downto 0);
signal operation : std_logic_vector(3 downto 0):= "0000";
signal output : std_logic_vector(DATA_WIDTH -1 downto 0);
signal zero, negative, carry, overflow : std_logic;

begin 
	
	u1: ULA port map(input1, input2, operation, output, zero, negative, carry, overflow);
	
		-- Teste de cada operação da ULA --
		process	 
		begin
			
			-- AND --
			operation <= "0000";
			input1 <= "00000000000000000000000000000001";
			input2 <= "00000000000000000000000000000011";
			wait for 30 ps;
			
			-- OR --
			operation <= "0001";
			input1 <= "00000000000000010000000000000000";
			input2 <= "00000000000011110000000000000000";
			wait for 30 ps;
	
			-- ADD --
			operation <= "0010";
			input1 <= "00000000000000000000000000000100";
			input2 <= "00000000000000000000000000000100";
			wait for 30 ps;
			
			-- SUB --
			operation <= "0011";
			input1 <= "00000000000000000000000000000100";
			input2 <= "00000000000000000000000000000010";
			wait for 30 ps;
		
			-- SLT --
			operation <= "0100";
			input1 <= "00000000000000000000000000000010";
			input2 <= "00000000000000000000000000000000";
			wait for 30 ps;		
		
			-- NOR --
			operation <= "0101";
			input1 <= "00000000000000000000000000000110";
			input2 <= "00000000000000000000000000000001";
			wait for 30 ps;
		
			-- XOR --
			operation <= "0110";
			input1 <= "00000000000000000000000000000110";
			input2 <= "00000000000000000000000000000001";
			wait for 30 ps;		
		
			-- SLL --
			operation <= "0111";
			input1 <= "00000000000000000000000000001000";
			input2 <= "00000000000000000000000000000001";
			wait for 30 ps;		
		
			-- SRL --
			operation <= "1000";
			input1 <= "00000000000000000000000000001000";
			input2 <= "00000000000000000000000000000001";
			wait for 30 ps;
			
			-- SRA --
			operation <= "1001";
			input1 <= "00000000000000000000000000001000";
			input2 <= "00000000000000000000000000000010";
			wait;
			
		end process;
		
		
end architecture;
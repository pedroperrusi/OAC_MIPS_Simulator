library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

-- Entidade Multiplexador na ULA --
entity Mux is
	generic (DATA_WIDTH : natural := 32);

port( 
	a,b,c,d,e,f,g,h,i,j,k: in std_logic_vector(DATA_WIDTH -1 downto 0);
	operation : in std_logic_vector(3 downto 0);
	output: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end entity Mux;

--Definição da arquitetura --
architecture arch of Mux is
begin

	process(a,b,c,d,e,f,g,h,i,j,k,operation)
	begin
	
		if operation = "0000" then
		
			output <= a;
		
		elsif operation = "0001" then
		
			output <= b;
	
		elsif operation = "0010" then
		
			output <= c;
		
		elsif operation = "0011" then
		
			output <= d;
	
		elsif operation = "0100" then
	
			output <= e;
		
		elsif operation = "0101" then
	
			output <= f;
		
		elsif operation = "0110" then
	
			output <= g;
	
		elsif operation = "0111" then
	
			output <= h;
		
		elsif operation = "1000" then
		
			output <= i;
		
		elsif operation = "1001" then
		
			output <= j;
		
		elsif operation = "1010" then
		
			output <= k;
	
		end if;
	end process;
	
end architecture;
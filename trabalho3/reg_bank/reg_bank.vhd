library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_bank is

	generic
	(
		DATA_WIDTH 		: natural := 32;
		ADDRESS_WIDTH 	: natural := 5
	);
	port (
		clk, wren 				: in std_logic;
		radd1, radd2, wadd 	: in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
		wdata 					: in std_logic_vector(DATA_WIDTH -1 downto 0);
		rdata1, rdata2 		: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);
	
end entity reg_bank;

architecture rtl of signed_adder is
	
	type word is array (DATA_WIDTH -1 downto 0) of std_logic;
	type array_words is array ((2**ADDRESS_WIDTH)-1 downto 0) of word;
	
	signal regs : array_words;
	

begin

	p-w: process (clk)
	begin
		if(wren = '1') then										--Verifica se a escrita esta abilitada
			if (clk = '1') then									--Verifica se o evento foi uma borda de subida no clock
				if(to_integer(unsigned(wadd)) /= 0) then	--Verifica em qual registrador sera escrito, caso 0 nao faz escreve
					regs(wadd) <= wdata;
				end if;
			end if;
		end if;
	end process;
	
	p-r1: process (clk, radd1)
	begin
		if(clk = '0')
			rdata1 <= regs(radd1);
	end process;
	
	p-r2: process (clk, radd2)
	begin
		if(clk = '0')
			rdata1 <= regs(radd2);
	end process;

end rtl;

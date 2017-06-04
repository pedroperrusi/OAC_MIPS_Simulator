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

architecture rtl of reg_bank is
	
	type word is array (DATA_WIDTH -1 downto 0) of std_logic;
	type array_words is array ((2**ADDRESS_WIDTH)-1 downto 0) of word;
	
	signal regs : array_words;
	

begin
	
	process (clk)
	begin
		if(wren = '1') then										--Verifica se a escrita esta abilitada
			if (clk = '1') then									--Verifica se o evento foi uma borda de subida no clock
				if(to_integer(unsigned(wadd)) /= 0) then	--Verifica em qual registrador sera escrito, caso 0 nao faz escreve
					for  i in DATA_WIDTH -1  to 0 loop
                 regs(to_integer(unsigned(wadd)))(i) <= wdata(i);
					end loop;
				end if;
			end if;
		end if;
	end process;
	
	process (clk, radd1)
	begin
		if(clk = '0') then
			for  i in DATA_WIDTH -1  to 0 loop
			  rdata1(i) <= regs(to_integer(unsigned(radd1)))(i);
			end loop;
		end if;
	end process;
	
	process (clk, radd2)
	begin
		if(clk = '0') then
			for  i in DATA_WIDTH -1  to 0 loop
			  rdata2(i) <= regs(to_integer(unsigned(radd2)))(i);
			end loop;
		end if;
	end process;

end rtl;

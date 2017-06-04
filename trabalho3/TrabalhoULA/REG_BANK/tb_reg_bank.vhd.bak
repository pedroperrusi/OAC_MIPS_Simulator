library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_reg_bank is
	generic
	(
		DATA_WIDTH 		: natural := 32;
		ADDRESS_WIDTH 	: natural := 5
	);
end tb_reg_bank;

architecture tb of tb_reg_bank is
	
    component reg_bank
			port (
				clk, wren 				: in std_logic;
				radd1, radd2, wadd 	: in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
				wdata 					: in std_logic_vector(DATA_WIDTH -1 downto 0);
				rdata1, rdata2 		: out std_logic_vector(DATA_WIDTH -1 downto 0)
			);
    end component;

    signal clk    : std_logic;
    signal wren   : std_logic;
    signal radd1  : std_logic_vector (address_width-1 downto 0);
    signal radd2  : std_logic_vector (address_width-1 downto 0);
    signal wadd   : std_logic_vector (address_width-1 downto 0);
    signal wdata  : std_logic_vector (data_width -1 downto 0);
    signal rdata1 : std_logic_vector (data_width -1 downto 0);
    signal rdata2 : std_logic_vector (data_width -1 downto 0);

    constant TbPeriod : time := 10 ps;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : reg_bank
    port map (clk    => clk,
              wren   => wren,
              radd1  => radd1,
              radd2  => radd2,
              wadd   => wadd,
              wdata  => wdata,
              rdata1 => rdata1,
              rdata2 => rdata2);

   
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';
	 
    clk <= TbClock;

    process
    begin
        
        wren <= '0';                                                --Teste desabilitar escrita
        radd1 <= std_logic_vector(to_unsigned(0, radd1'length));
		    radd2 <= std_logic_vector(to_unsigned(1, radd2'length));
        wadd <= std_logic_vector(to_unsigned(1, wadd'length));
        wdata <= std_logic_vector(to_unsigned(20, wdata'length));
        wait for 5 * TbPeriod;
        
        wren <= '1';                                                --Teste escrever em 0
        radd1 <= std_logic_vector(to_unsigned(0, radd1'length));
		    radd2 <= std_logic_vector(to_unsigned(1, radd2'length));
        wadd <= std_logic_vector(to_unsigned(0, wadd'length));
        wdata <= std_logic_vector(to_unsigned(20, wdata'length));
        wait for 5 * TbPeriod;
        
        wren <= '0';                                                --Teste ler 0
        radd1 <= std_logic_vector(to_unsigned(0, radd1'length));
		    radd2 <= std_logic_vector(to_unsigned(1, radd2'length));
        wadd <= std_logic_vector(to_unsigned(0, wadd'length));
        wdata <= std_logic_vector(to_unsigned(20, wdata'length));
        wait for 5 * TbPeriod;
        
        wren <= '1';                                                --Teste escrever em uma posição aleatoria
        radd1 <= std_logic_vector(to_unsigned(5, radd1'length));
		    radd2 <= std_logic_vector(to_unsigned(6, radd2'length));
        wadd <= std_logic_vector(to_unsigned(5, wadd'length));
        wdata <= std_logic_vector(to_unsigned(20, wdata'length));
        wait for 5 * TbPeriod;
		  
		    wren <= '0';                                                --Teste Ler o q foi escrito
        radd1 <= std_logic_vector(to_unsigned(5, radd1'length));
		    radd2 <= std_logic_vector(to_unsigned(6, radd2'length));
        wadd <= std_logic_vector(to_unsigned(5, wadd'length));
        wdata <= std_logic_vector(to_unsigned(20, wdata'length));
        wait for 5 * TbPeriod;

    end process;

end tb;
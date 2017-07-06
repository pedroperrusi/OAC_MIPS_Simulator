library ieee;
use ieee.std_logic_1164.all;

entity tb_MIPS is
end tb_MIPS;

architecture tb of tb_MIPS is

    component MIPS
        port ( clk : in std_logic;
					inRegBankFpga : in std_logic_vector(4 downto 0);
					outRegBankFpga : out std_logic_vector(31 downto 0);
					inMemDadoFpga : in std_logic_vector(6 downto 0);
					outMemDadoFpga : out std_logic_vector(31 downto 0);
					-- Para testar --
					saida_MUXXSomador2 : out std_logic_vector(31 downto 0);
					saidaSoma : out std_logic_vector(31 downto 0);
					saidaSoma2 : out std_logic_vector(31 downto 0);
					saidaDaULA : out std_logic_vector(31 downto 0);
					saidaDoShiftLeft1 : out std_logic_vector(31 downto 0);
					saidaMemoriaInst : out std_logic_vector(31 downto 0);
					saida_muxJump : out std_logic_vector(31 downto 0); 
					saidaExtSinal : out std_logic_vector(31 downto 0);
					saida_MemOuULA : out std_logic_vector(31 downto 0);
					saida_MemDados :  out std_logic_vector(31 downto 0);
					inst3126,inst50 : out std_logic_vector(5 downto 0);
					inst1511,inst2016,inst2521 : out std_logic_vector(4 downto 0);
					inst150 : out std_logic_vector(15 downto 0);	
					saida_contador_programa : out std_logic_vector(31 downto 0);
					reg1_output : out std_logic_vector(31 downto 0);
					jumpRegister1 : out std_logic;
					reg2_output : out std_logic_vector(31 downto 0)
				  );
    end component;

    signal clk : std_logic;

    constant TbPeriod : time := 1 ns; 
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';
	 
	 signal inRegBankFpga :  std_logic_vector(4 downto 0);
	 signal outRegBankFpga :  std_logic_vector(31 downto 0);
	 signal inMemDadoFpga :  std_logic_vector(6 downto 0);
	 signal outMemDadoFpga :   std_logic_vector(31 downto 0);
	 signal saida_MUXXSomador2 :   std_logic_vector(31 downto 0);
	 signal saidaSoma :   std_logic_vector(31 downto 0);
	 signal saidaSoma2 :   std_logic_vector(31 downto 0);
	 signal saidaDaULA :   std_logic_vector(31 downto 0);
	 signal saidaDoShiftLeft1 :   std_logic_vector(31 downto 0);
	 signal saidaMemoriaInst :   std_logic_vector(31 downto 0);
	 signal saida_muxJump :   std_logic_vector(31 downto 0); 
	 signal saidaExtSinal :   std_logic_vector(31 downto 0);
	 signal saida_MemOuULA :   std_logic_vector(31 downto 0);
	 signal saida_MemDados :    std_logic_vector(31 downto 0);
	 signal inst3126,inst50 :   std_logic_vector(5 downto 0);
	 signal inst1511,inst2016,inst2521 :   std_logic_vector(4 downto 0);
	 signal inst150 :  std_logic_vector(15 downto 0);	
	 signal saida_contador_programa : std_logic_vector(31 downto 0);
	 signal reg1_output : std_logic_vector(31 downto 0);
	 signal jumpRegister1 : std_logic;
	 signal reg2_output : std_logic_vector(31 downto 0);
	 
begin

    dut : MIPS
    port map (clk,
				  inRegBankFpga,
				  outRegBankFpga,
				  inMemDadoFpga,
				  outMemDadoFpga,
				  saida_MUXXSomador2,
				  saidaSoma,
				  saidaSoma2,
				  saidaDaULA,
				  saidaDoShiftLeft1,
				  saidaMemoriaInst,
				  saida_muxJump, 
				  saidaExtSinal,
				  saida_MemOuULA,
				  saida_MemDados,
				  inst3126,inst50,
				  inst1511,inst2016,inst2521,
				  inst150,	
				  saida_contador_programa,
				  reg1_output,
				  jumpRegister1,
				  reg2_output);

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';


    clk <= TbClock;

    stimuli : process
    begin

        wait for 100 * TbPeriod;

        TbSimEnded <= '1';
        wait;
    end process;

end tb;

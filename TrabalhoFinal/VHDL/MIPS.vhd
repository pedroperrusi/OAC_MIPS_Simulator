library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade que representa o processador MIPS como uma caixa preta --
entity MIPS is
end entity MIPS;

architecture arch of MIPS is

------------------------ COMPONENTS -----------------------------------------------------------
component ULA is
	generic (DATA_WIDTH : natural := 32);

port( 
	input1, input2 : in std_logic_vector(DATA_WIDTH -1 downto 0);
	operation : in std_logic_vector(3 downto 0);
	output : out std_logic_vector(DATA_WIDTH -1 downto 0);
	zero, negative : out std_logic;
	carry, overflow : out std_logic
	);

end component;

component Contador_Programa is

port( 
	input: in std_logic_vector(31 downto 0) := x"00000000";
	w: in std_logic;
	output: out std_logic_vector(31 downto 0)
	);
	
end component;

component reg_bank is
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
	
end component;

component MemoriaInst is

 generic(N: integer := 7; M: integer := 32);
 port(
			--clk:  in  STD_LOGIC := '0'; 
			adr: in std_logic_vector(N-1 downto 0) := (others => '0');
			inst: out std_logic_vector(M-1 downto 0) := (others => '0')
		);
		
end component;

component ParteControle is

port( 
	input : in std_logic_vector(5 downto 0);
	regdst, jump, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite: out std_logic
	);

end component;

component Somador is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0);
	c_out: out std_logic
	);

end component;
-----------------------------------------------------------------------------------------------

signal saida_somador : std_logic_vector(31 downto 0) := x"00000000";
signal saida_pc : std_logic_vector(31 downto 0) := x"00000000";
signal instrucao : std_logic_vector(31 downto 0);
signal w_signal : std_logic := '0';
signal regdst, jump, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite : std_logic;

begin

	-- Port Maps --
	
	------------------------------ Busca de Instrucao -----------------------------------------
	U1: Contador_Programa port map(saida_somador,w_signal,saida_pc);
	U2: MemoriaInst port map(saida_pc(8 downto 2), instrucao);
	U3: Somador port map(saida_pc,std_logic_vector(to_signed(4,32)),saida_somador);
	-------------------------------------------------------------------------------------------
	
	U4: ParteControle port map(instrucao(31 downto 26),regdst, jump, branch, memread, memtoreg,
										aluop, memwrite, alusrc, regwrite);
	
		
	
	
	
	
	-- Fim Port Map --
end arch;

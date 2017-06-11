library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade que representa o processador MIPS como uma caixa preta --
entity MIPS is
	
	port (
		clk : in std_logic
	);
	
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

component Mux2 is
	generic (DATA_WIDTH : natural := 32);

port( 
	a,b: in std_logic_vector(DATA_WIDTH -1 downto 0);
	operation : in std_logic;
	output: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;

component ExtensorDeSinal is
	generic (DATA_WIDTH : natural := 16);

port( 
	input: in std_logic_vector(DATA_WIDTH -1 downto 0);
	output: out std_logic_vector(31 downto 0)
	);

end component;

component ControleULA is

port( 
	instrucao: in std_logic_vector(5 downto 0);
	ALUop : in std_logic;
	operation: out std_logic_vector(3 downto 0)
	);

end component;

component MemoriaDado is

 generic(N: integer := 7; M: integer := 32);
 port(
			clk, escreveMem:  in  STD_LOGIC; 
			adr: in std_logic_vector(N-1 downto 0) := (others => '0');
			dado: out std_logic_vector(M-1 downto 0) := (others => '0')
		); 
		
end component;

component Mux3 is
	generic (DATA_WIDTH : natural := 5);

port( 
	a,b: in std_logic_vector(DATA_WIDTH -1 downto 0);
	operation : in std_logic;
	output: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;
-----------------------------------------------------------------------------------------------

signal saida_somador : std_logic_vector(31 downto 0) := x"00000000";
signal saida_pc : std_logic_vector(31 downto 0) := x"00000000";
signal instrucao : std_logic_vector(31 downto 0);
signal regdst, jump, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite : std_logic;
signal saida_mux2, saida_extensor_sinal, dado1_regbank, dado2_regbank : std_logic_vector(31 downto 0);
signal saida_mux3 : std_logic_vector(4 downto 0);
signal op_ULA : std_logic_vector(3 downto 0);
signal output_ULA : std_logic_vector(31 downto 0);
signal zero_ULA, negative_ULA, carry_ULA, overflow_ULA : std_logic; 
signal saida_memDado : std_logic_vector(31 downto 0); 

begin

	-- Port Maps --
	
	
	-- TODO : Verificar se o endereco de 7 bits esta sendo passado de forma correta (?)
	-- TODO : Implementar parte de controle !!!!
	
	
	
	------------------------------ Busca de Instrucao -----------------------------------------
	U1: Contador_Programa port map(saida_somador,saida_pc);
	U2: MemoriaInst port map(saida_pc(8 downto 2), instrucao);
	U3: Somador port map(saida_pc,std_logic_vector(to_signed(4,32)),saida_somador);
	-------------------------------------------------------------------------------------------
	
	U4: ParteControle port map(instrucao(31 downto 26),regdst, jump, branch, memread, memtoreg,
										aluop, memwrite, alusrc, regwrite);
	U5: Mux3 port map(instrucao(20 downto 16), instrucao(15 downto 11), regdst, saida_mux3);									
	U6: reg_bank port map(clk, regwrite, instrucao(25 downto 21), instrucao(20 downto 16),
								 saida_mux3, saida_memDado, dado1_regbank, dado2_regbank);
	U7: ExtensorDeSinal port map(instrucao(15 downto 0), saida_extensor_sinal);
	U8: Mux2 port map(dado2_regbank, saida_extensor_sinal, alusrc, saida_mux2);
	
	------------------------------ ULA -----------------------------------------------------
	U9: ControleULA port map(instrucao(5 downto 0), aluop, op_ULA);
	U10: ULA port map(dado1_regbank, saida_mux2, op_ULA, output_ULA, zero_ULA, negative_ULA,
							carry_ULA, overflow_ULA);
	----------------------------------------------------------------------------------------

	U11: MemoriaDado port map(clk, memread, output_ULA(6 downto 0), saida_memDado);
	
	-- ......
	-- Fim Port Map --
end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidade que representa o processador MIPS como uma caixa preta --
entity MIPS is
	
	port (
		clk : in std_logic;
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
	
end entity MIPS;

architecture arch of MIPS is

------------------------ COMPONENTS -----------------------------------------------------------
component ULA is
	generic (DATA_WIDTH : natural := 32);

port( 
	input1, input2 : in std_logic_vector(DATA_WIDTH -1 downto 0);
	operation : in std_logic_vector(3 downto 0);
	instrucao : in std_logic_vector(DATA_WIDTH -1 downto 0);
	output : out std_logic_vector(DATA_WIDTH -1 downto 0);
	zero, negative : out std_logic;
	carry, overflow : out std_logic
	);

end component;

component Contador_Programa is

port( 
	input: in std_logic_vector(31 downto 0) := x"00000000";
	clk: in std_logic;
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
		raddFpga					: in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
		wdata 					: in std_logic_vector(DATA_WIDTH -1 downto 0);
		rdata1, rdata2 		: out std_logic_vector(DATA_WIDTH -1 downto 0);
		rdataFpga				: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);
	
end component;

component MemoriaInst is

 generic(N: integer := 7; M: integer := 32);
 port(
			clk:  in  STD_LOGIC; 
			adr: in std_logic_vector(N-1 downto 0) := (others => '0');
			inst: out std_logic_vector(M-1 downto 0) := (others => '0')
		);
		
end component;

component ParteControle is

port( 
	input : in std_logic_vector(5 downto 0);
	inst5 : in std_logic_vector(5 downto 0);
	jump, branch, branchNotEqual, seletor_branch, memread, memwrite, alusrc, regwrite, jumpRegister: out std_logic;
	regdst, memtoreg : out std_logic_vector(1 downto 0);
	aluop: out std_logic_vector(3 downto 0)
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
	ALUop : in std_logic_vector(3 downto 0) := "0000";
	operation: out std_logic_vector(3 downto 0)
	);

end component;

component MemoriaDado is

 generic(N: integer := 7; M: integer := 32);
 port(
			clk, escreveMem:  in  STD_LOGIC; 
			adr: in std_logic_vector(N-1 downto 0) := (others => '0');
			input_fpga : in std_logic_vector(N-1 downto 0);
			wdata: in std_logic_vector(M-1 downto 0);
			dado: out std_logic_vector(M-1 downto 0) := (others => '0');
			output_fpga : out std_logic_vector(M-1 downto 0)
		); 
		
end component;

component Mux3 is
	generic (DATA_WIDTH : natural := 5);

port( 
	a,b,c: in std_logic_vector(DATA_WIDTH -1 downto 0);
	operation : in std_logic_vector(1 downto 0);
	output: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;

component Bloco_Sll is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0) := std_logic_vector(to_signed(0,32));
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;

component ShiftLeft2 is

port( 
	a: in std_logic_vector(25 downto 0);
	z: out std_logic_vector(27 downto 0)
	);

end component;

component Bloco_ShiftLeft is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;

component MuxBranch is

port( 
	a,b: in std_logic;
	operation : in std_logic;
	output: out std_logic
	);

end component;

component Mux4 is
	generic (DATA_WIDTH : natural := 32);

port( 
	a,b,c: in std_logic_vector(DATA_WIDTH -1 downto 0);
	operation : in std_logic_vector(1 downto 0);
	output: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;
-----------------------------------------------------------------------------------------------

signal saida_somador : std_logic_vector(31 downto 0) := x"00000000";
signal saida_pc : std_logic_vector(31 downto 0) := x"00000000";
signal instrucao : std_logic_vector(31 downto 0);
signal jump, branch, branchNotEqual, memread, memwrite, alusrc, regwrite : std_logic;
signal regdst, memtoreg : std_logic_vector(1 downto 0);
signal aluop : std_logic_vector(3 downto 0);
signal saida_mux2, saida_extensor_sinal, dado1_regbank, dado2_regbank : std_logic_vector(31 downto 0);
signal saida_muxMemToReg, saida_muxSomador2 : std_logic_vector(31 downto 0);
signal saida_mux3 : std_logic_vector(4 downto 0);
signal op_ULA : std_logic_vector(3 downto 0);
signal output_ULA : std_logic_vector(31 downto 0);
signal zero_ULA, negative_ULA, carry_ULA, overflow_ULA : std_logic; 
signal saida_memDado : std_logic_vector(31 downto 0); 
signal saida_shif_left1, saida_somador2 : std_logic_vector(31 downto 0);
signal carry_out_somador2 : std_logic;
signal saida_ShiftLeft2 : std_logic_vector(27 downto 0);
signal jump_address : std_logic_vector(31 downto 0);
signal saida_muxJumpAddress : std_logic_vector(31 downto 0) := x"00000000";
signal efetiva_branch, efetiva_bne, seletor_branch, saida_muxBranch : std_logic;
signal jumpRegister : std_logic;
signal saidaMuxJR : std_logic_vector(31 downto 0) := x"00000000";

begin

	-- Port Maps --
	U1: Contador_Programa port map(saidaMuxJR,clk,saida_pc);
	U2: MemoriaInst port map(clk,saida_pc(8 downto 2), instrucao);	
	U3: Somador port map(saida_pc,std_logic_vector(to_signed(4,32)),saida_somador);
	U4: ParteControle port map(instrucao(31 downto 26), instrucao(5 downto 0), jump, branch, branchNotEqual, seletor_branch, memread,memwrite, alusrc, regwrite, jumpRegister, regdst, memtoreg, aluop);
	U5: Mux3 port map(instrucao(20 downto 16), instrucao(15 downto 11), std_logic_vector(to_signed(31,5)), regdst, saida_mux3);									
	U6: reg_bank port map(clk, regwrite, instrucao(25 downto 21), instrucao(20 downto 16),saida_mux3, inRegBankFpga, saida_muxMemToReg, dado1_regbank, dado2_regbank, outRegBankFpga);
	U7: ExtensorDeSinal port map(instrucao(15 downto 0), saida_extensor_sinal);
	U8: Mux2 port map(dado2_regbank, saida_extensor_sinal, alusrc, saida_mux2);
	U9: ControleULA port map(instrucao(5 downto 0), aluop, op_ULA);
	U10: ULA port map(dado1_regbank, saida_mux2, op_ULA, instrucao, output_ULA, zero_ULA, negative_ULA,carry_ULA, overflow_ULA);
	U11: MemoriaDado port map(clk, memwrite, output_ULA(6 downto 0), inMemDadoFpga, dado2_regbank, saida_memDado, outMemDadoFpga);
	U12: Mux4 port map(output_ULA, saida_memDado, saida_somador,memtoreg ,saida_muxMemToReg);
	U13: Bloco_ShiftLeft port map(saida_extensor_sinal, std_logic_vector(to_signed(2,32)), saida_shif_left1);
	U14: Somador port map(saida_shif_left1, saida_somador, saida_somador2, carry_out_somador2);
	U15: Mux2 port map(saida_somador, saida_somador2, saida_muxBranch, saida_muxSomador2);
	U16: ShiftLeft2 port map(instrucao(25 downto 0), saida_ShiftLeft2);
	U17: Mux2 port map(saida_muxSomador2, jump_address, jump,saida_muxJumpAddress);
	U18: MuxBranch port map(efetiva_branch, efetiva_bne, seletor_branch, saida_muxBranch);
	U19: Mux2 port map(saida_muxJumpAddress, dado1_regbank, jumpRegister, saidaMuxJR);
	-- Fim Port Map --
	
	efetiva_branch <= branch and zero_ULA;
	efetiva_bne <= branchNotEqual and not(zero_ULA);
	jump_address(31 downto 28) <= saida_somador(31 downto 28);
	jump_address(27 downto 0) <= saida_ShiftLeft2;
	
	-- Para testar !
	reg1_output <= dado1_regbank;
	reg2_output <= dado2_regbank;
	saida_MemOuULA <= saida_muxMemToReg;
	saida_MemDados <= saida_memDado;
	saidaSoma <= saida_somador;
	saidaSoma2 <= saida_somador2;
	saida_MUXXSomador2 <= saida_muxSomador2;
	saidaDoShiftLeft1 <= saida_shif_left1;
	saidaExtSinal <= saida_extensor_sinal;
	saidaDaULA <= output_ULA;
	saida_MuxJump <= saida_muxJumpAddress;
	saida_contador_programa <= saida_pc;
	saidaMemoriaInst <= instrucao;
	inst3126 <= instrucao(31 downto 26);
	inst2521 <= instrucao(25 downto 21);
	inst2016 <= instrucao(20 downto 16);
	inst1511 <= instrucao(15 downto 11);
	inst150 <= instrucao(15 downto 0);
	inst50 <= instrucao(5 downto 0);
	jumpRegister1 <= jumpRegister;

end arch;

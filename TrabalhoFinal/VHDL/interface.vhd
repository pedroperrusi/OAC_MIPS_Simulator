library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

--Entidade padrão para ULA fornecida no roteiro --
entity interface is

port( 
	KEY3 	: in std_logic;
	SW 	: in std_logic_vector(13 downto 0);
	HEX0 	: out STD_LOGIC_VECTOR(6 downto 0);
	HEX1 	: out STD_LOGIC_VECTOR(6 downto 0);
	HEX2 	: out STD_LOGIC_VECTOR(6 downto 0);
	HEX3 	: out STD_LOGIC_VECTOR(6 downto 0);
	HEX4 	: out STD_LOGIC_VECTOR(6 downto 0);
	HEX5 	: out STD_LOGIC_VECTOR(6 downto 0);
	HEX6 	: out STD_LOGIC_VECTOR(6 downto 0);
	HEX7 	: out STD_LOGIC_VECTOR(6 downto 0)
);

end entity;


architecture interface_arch of interface is

component MIPS is
	
	port (
		clk : in std_logic;
		saida_MUXXSomador2 : out std_logic_vector(31 downto 0);
		saidaSoma : out std_logic_vector(31 downto 0);
		saidaSoma2 : out std_logic_vector(31 downto 0);
		saidaDaULA : out std_logic_vector(31 downto 0);
		saidaDoShiftLeft1 : out std_logic_vector(31 downto 0);
		saidaMemoriaInst : out std_logic_vector(31 downto 0);
		saida_muxJump : out std_logic_vector(31 downto 0); 
		saidaExtSinal : out std_logic_vector(31 downto 0);
		saida_MemOuULA : out std_logic_vector(31 downto 0);
		saida_contador_programa : out std_logic_vector(31 downto 0);
		reg1_output : out std_logic_vector(31 downto 0);
		reg2_output : out std_logic_vector(31 downto 0)
	);
	
end component;

component seven_seg_decoder is
	port(
			data: in STD_LOGIC_VECTOR(3 downto 0);
			segments: out STD_LOGIC_VECTOR(6 downto 0)
		 );
end component;

-- signals

	signal clk : std_logic;
	signal saida_MUXXSomador2 : std_logic_vector(31 downto 0);
	signal saidaSoma : std_logic_vector(31 downto 0);
	signal saidaSoma2 :  std_logic_vector(31 downto 0);
	signal saidaDaULA : std_logic_vector(31 downto 0);
	signal saidaDoShiftLeft1 : std_logic_vector(31 downto 0);
	signal saidaMemoriaInst : std_logic_vector(31 downto 0);
	signal saida_muxJump : std_logic_vector(31 downto 0); 
	signal saidaExtSinal : std_logic_vector(31 downto 0);
	signal saida_MemOuULA : std_logic_vector(31 downto 0);
	signal saida_contador_programa : std_logic_vector(31 downto 0);
	signal reg1_output : std_logic_vector(31 downto 0);
	signal reg2_output : std_logic_vector(31 downto 0);
	
	signal data : STD_LOGIC_VECTOR(31 DOWNTO 0);


begin
	
	U1: MIPS port map(
					clk => KEY3,
					saida_MUXXSomador2 => saida_MUXXSomador2,
					saidaSoma  => saidaSoma,
					saidaSoma2 => saidaSoma2,
					saidaDaULA => saidaDaULA,
					saidaDoShiftLeft1 => saidaDoShiftLeft1,
					saidaMemoriaInst => saidaMemoriaInst,
					saida_muxJump => saida_muxJump,
					saidaExtSinal => saidaExtSinal,
					saida_MemOuULA => saida_MemOuULA,
					saida_contador_programa => saida_contador_programa,
					reg1_output => reg1_output,
					reg2_output => reg2_output
				);
	
	P1:process(KEY3, SW)
	begin
	
		if SW(1 downto 0) = "00" then
		
			data <= saida_contador_programa ;
				
		elsif  SW(1 downto 0) = "01" then
				
			data <= saidaMemoriaInst;
		
		elsif  SW(1 downto 0) = "10" then
				
			data <= (others => '0');
			
		elsif  SW(1 downto 0) = "11" then
				
			data <= (others => '0');
			
		end if;
	end process;
		
		
	i0 : seven_seg_decoder
	port map (
					data => data(3 downto 0),
					segments => HEX0
				);
	
	i1 : seven_seg_decoder
	port map (
					data => data(7 downto 4),
					segments => HEX1
				);

	i2 : seven_seg_decoder
	port map (
					data => data(11 downto 8),
					segments => HEX2
				);
	i3 : seven_seg_decoder
	port map (
					data => data(15 downto 12),
					segments => HEX3
				);
	
	i4 : seven_seg_decoder
	port map (
					data => data(19 downto 16),
					segments => HEX4
				);

	i5 : seven_seg_decoder
	port map (
					data => data(23 downto 20),
					segments => HEX5
				);
				
	i6 : seven_seg_decoder
	port map (
					data => data(27 downto 24),
					segments => HEX6
				);
	
	i7 : seven_seg_decoder
	port map (
					data => data(31 downto 28),
					segments => HEX7
				);
	
end;
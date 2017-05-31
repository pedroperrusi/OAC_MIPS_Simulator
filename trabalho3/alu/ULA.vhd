library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

--Entidade padrão para ULA fornecida no roteiro --
entity ULA is
	generic (DATA_WIDTH : natural := 32);

port( 
	input1, input2 : in std_logic_vector(DATA_WIDTH -1 downto 0);
	operation : in std_logic_vector(3 downto 0);
	output : out std_logic_vector(DATA_WIDTH -1 downto 0);
	zero, negative : out std_logic;
	carry, overflow : out std_logic
	);

end entity ULA;

--Definição da arquitetura da ULA --
architecture ULA_arch of ULA is


-- Import de todos os componentes da ULA --
component Somador is		
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0);
	c_out: out std_logic
	);

end component;

component Bloco_Slt is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;

component Mux is
	generic (DATA_WIDTH : natural := 32);

port( 
	a,b,c,d,e,f,g,h,i,j: in std_logic_vector(DATA_WIDTH -1 downto 0);
	operation : in std_logic_vector(3 downto 0);
	output: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;

component Bloco_And is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;

component Bloco_Xor is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;

component Bloco_Or is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;

component Bloco_Nor is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;

component Subtrator is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;

component Bloco_Sll is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;

component Bloco_Srl is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;

component Bloco_Sra is
	generic (DATA_WIDTH : natural := 32);

port( 
	a, b : in std_logic_vector(DATA_WIDTH -1 downto 0);
	z: out std_logic_vector(DATA_WIDTH -1 downto 0)
	);

end component;
-- Fim do Import --

-- Declaração de sinais --
signal out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11: std_logic_vector(DATA_WIDTH -1 downto 0);
-- Fim sinais --

begin
-- Port Maps --
	I1: Bloco_And port map (input1,input2,out1);
	I2: Bloco_Or port map (input1,input2,out2);
	I3: Somador port map (input1,input2,out3,carry);
	I5: Subtrator port map (input1,input2,out4);
	I6: Bloco_Slt port map (input1,input2,out5);
	I7: Bloco_Nor port map (input1,input2,out6);
	I8: Bloco_Xor port map (input1,input2,out7);
	I9: Bloco_Sll port map (input1,input2,out8);
	I10: Bloco_Srl port map (input1,input2,out9);
	I11: Bloco_Sra port map (input1,input2,out10);
	I12: Mux port map (out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,operation,output);
-- Fim Port Maps --  

end architecture;
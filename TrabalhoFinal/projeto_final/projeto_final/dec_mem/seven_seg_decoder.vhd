library IEEE; 
use IEEE.STD_LOGIC_1164.all;

entity seven_seg_decoder is
	port(
			data: in STD_LOGIC_VECTOR(3 downto 0);
			segments: out STD_LOGIC_VECTOR(6 downto 0)
		 );
end;

architecture seven_seg_decoder_arch of seven_seg_decoder is
begin

	process(data) 
	begin
	
		case data is
			when X"0" => segments <= not "0111111"; 
			when X"1" => segments <= not "0000110";
			when X"2" => segments <= not "1011011"; 
			when X"3" => segments <= not "1001111"; 
			when X"4" => segments <= not "1100110"; 
			when X"5" => segments <= not "1101101"; 
			when X"6" => segments <= not "1111101"; 
			when X"7" => segments <= not "0000111"; 
			when X"8" => segments <= not "1111111"; 
			when X"9" => segments <= not "1101111";
			when X"A" => segments <= not "1110111"; 
			when X"B" => segments <= not "1111100"; 
			when X"C" => segments <= not "0111001"; 
			when X"D" => segments <= not "1011110"; 
			when X"E" => segments <= not "1111001"; 
			when X"F" => segments <= not "1110001"; 
			when others => segments <= not "0000000";
		end case;
		
	end process;
	
end;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity aluctr is
	port(
			ALUop: in std_logic_vector(1 downto 0);
			Func: in std_logic_vector(5 downto 0);
			aluctrl: out std_logic_vector(3 downto 0)
	);
	end aluctr;
	
architecture aluctr_arch of aluctr is
begin
	process(ALUop, Func)
		begin
		aluctrl <= "0010" when (ALUop = "00") or (ALUop = "10")and (Func(3 downto 0) = "0000") else
					  "0000" when (ALUop = "10")and (Func(3 downto 0) = "0100") else
					  "0001" when (ALUop = "10")and (Func(3 downto 0) = "0101") else
					  "0110" when (ALUop = "01") or (ALUop(1) = "1")and (Func(3 downto 0) = "0010") else
					  "0111" when (ALUop(1) = "1")and (Func(3 downto 0) = "1010") else
					  others;
	end process;
end aluctr_arch;
		

library ieee;
use ieee. std_logic_1164. all;
entity runsewe_nzplogic  is
 port( 
	RST : in std_logic;
	clk : in std_logic;
	EN: in std_logic;
	OP_A : in std_logic_vector(15 downto 0);
	OP_Q : out std_logic_vector(2 downto 0)
);
end runsewe_nzplogic;

architecture nzp_logic of runsewe_nzplogic   is 
signal S_D : std_logic_vector(2 downto 0);
begin
PETFF_clk: process (clk) 
begin
	 if (clk = '1' and clk' event) then
		if (RST = '1') then
		S_D <= (others => '0');
		
		elsif (EN = '1')then
		  	if (OP_A(15)='1') then
			S_D <= "100";
			elsif (OP_A="0000000000000000") then
			S_D <= "010";
			else
			S_D <= "001";
		        end if;
		 else
		  S_D <= S_D;
		
		end if;
		else
		S_D <= S_D;
 	end if;
end process PETFF_clk;
 OP_Q <= S_D;
end nzp_logic;

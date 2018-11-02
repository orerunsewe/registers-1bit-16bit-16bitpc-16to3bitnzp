library ieee;
use ieee. std_logic_1164.all;

entity runsewe_16bitregister is
 port( 
	RST : in std_logic;
	CLK : in std_logic;
	EN : in std_logic;
	OP_A : in std_logic_vector(15 downto 0);
	OP_Q : out std_logic_vector(15 downto 0)
     );

end runsewe_16bitregister;

architecture register_16bits of runsewe_16bitregister is 
   signal S_D : std_logic_vector(15 downto 0);
begin
   PETFF_CLK: process (CLK) 
      begin
	 if (CLK = '1' and CLK'event) then
		if (RST = '1') then
		  S_D <= (others => '0');
		elsif (EN = '1') then
		  S_D <= OP_A;
		else
		  S_D <= S_D; 
		end if;
         else
            S_D <= S_D;
 	end if;
end process PETFF_CLK;
 OP_Q <= S_D;
end register_16bits;

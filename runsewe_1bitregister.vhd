library ieee;
use ieee. std_logic_1164.all;

entity runsewe_1bitregister is
 port( 
	RST : in std_logic;
	CLK : in std_logic;
	EN : in std_logic;
	OP_A : in std_logic;
	OP_Q : out std_logic
     );

end runsewe_1bitregister;

architecture one_bit_register of runsewe_1bitregister is 
   signal S_D : std_logic;
begin
   PETFF_CLK: process (CLK) 
      begin
	 if (CLK = '1' and CLK'event) then
		if (RST = '1') then
		  S_D <= '0';
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
end one_bit_register;

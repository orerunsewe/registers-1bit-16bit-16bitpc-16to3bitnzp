library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity runsewe_16bitpc is
  port( CLK: in std_logic;
        RST : in std_logic;
        EN: in std_logic;
        OP_A: in std_logic_vector(15 downto 0);
        OP_Q: out std_logic_vector(15 downto 0):= (others=>'0');
	OP_R: out std_logic_vector(15 downto 0):= (others=>'0')
      );
end runsewe_16bitpc;

architecture pc_16bits  of runsewe_16bitpc is 
    signal pc_data: std_logic_vector(15 downto 0);
    signal pc_data_plus: std_logic_vector(15 downto 0);
begin
    process(CLK)
    begin
       if (CLK'event and CLK ='1') then
          if (RST ='1') then
              pc_data <= (others => '0');
	      pc_data_plus <= "0000000000000000" + '1';
	  
          elsif (en='1') then
              pc_data <= OP_A;
              pc_data_plus <= OP_A + '1';
	  else
              pc_data <= pc_data;
              pc_data_plus <= pc_data_plus;
	  end if;
       else
              pc_data <= pc_data;
              pc_data_plus <= pc_data_plus;
       end if;
end process;

OP_Q <= pc_data;
OP_R <= pc_data_plus;

end pc_16bits ;

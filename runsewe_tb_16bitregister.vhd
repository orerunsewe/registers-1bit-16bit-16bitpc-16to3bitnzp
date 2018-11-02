-- Copyright 2018 by Howard University All rights reserved.
--
-- Manual Testbench for: 
-- Name:   Ore Runsewe 
--	
-- Date:   09/27/2018
--
-- For Homework #2
-- Adv. Digital Design 
--------------------------------------------------------------


LIBRARY IEEE;
USE work.CLOCKS.all;   -- Entity that uses CLOCKS
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_textio.all;
USE std.textio.all;
USE work.txt_util.all;

ENTITY runsewe_tb_16bitregister IS
END;

ARCHITECTURE TESTBENCH OF runsewe_tb_16bitregister IS

---------------------------------------------------------------
-- COMPONENTS
---------------------------------------------------------------

COMPONENT runsewe_16bitregister 		-- In/out Ports
	PORT(	
	RST : in std_logic;
	CLK : in std_logic;
	en : in std_logic;
	OP_A : in std_logic_vector(15 downto 0);
	OP_Q : out std_logic_vector(15 downto 0)
);
END COMPONENT;

COMPONENT CLOCK
	port(CLK: out std_logic);
END COMPONENT;

---------------------------------------------------------------
-- Read/Write FILES
---------------------------------------------------------------


FILE in_file : TEXT open read_mode is 	"runsewe_16bitregisterin.txt";   -- Inputs, RST, enr,enl
FILE exo_file : TEXT open read_mode is 	"runsewe_16bitregisterout.txt";   -- Expected output (binary)
FILE out_file : TEXT open  write_mode is  "AMOO_EVENPD_Book_dataout_dacus.txt";
FILE xout_file : TEXT open  write_mode is "AMOO_EVENPD_Book_TestOut_dacus.txt";
FILE hex_out_file : TEXT open  write_mode is "AMOO_EVENPD_Book_hex_out_dacus.txt";

---------------------------------------------------------------
-- SIGNALS 
---------------------------------------------------------------
  SIGNAL RST: STD_LOGIC;
  SIGNAL OP_A: STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL EN: STD_LOGIC;
  SIGNAL CLK: STD_LOGIC;
  SIGNAL OP_Q: STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL Exp_Op_Q : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL Test_Out_Q : STD_LOGIC:= 'X';
  SIGNAL LineNumber: integer:=0;

---------------------------------------------------------------
-- BEGIN 
---------------------------------------------------------------

BEGIN

---------------------------------------------------------------
-- Instantiate Components 
---------------------------------------------------------------


U0: CLOCK port map (CLK );
Instrunsewe_16bitregister : runsewe_16bitregister  port map (RST, CLK, EN, OP_A, OP_Q);

---------------------------------------------------------------
-- PROCESS 
---------------------------------------------------------------
PROCESS

variable in_line, exo_line, out_line, xout_line : LINE;
variable comment, xcomment : string(1 to 128);
variable i : integer range 1 to 128;
variable simcomplete : boolean;
variable vOP_A   : std_logic_vector(15 downto 0):= (OTHERS => 'X');
variable vRST   : std_logic := '0';
variable vEN : std_logic := '0';
variable vOP_Q : std_logic_vector(15 downto 0):= (OTHERS => 'X');
variable vExp_Op_Q : std_logic_vector(15 downto 0):= (OTHERS => 'X');
variable vTest_Out_Q : std_logic := '0';
variable vlinenumber: integer;

BEGIN

simcomplete := false;

while (not simcomplete) LOOP
  
	if (not endfile(in_file) ) then
		readline(in_file, in_line);
	else
		simcomplete := true;
	end if;

	if (not endfile(exo_file) ) then
		readline(exo_file, exo_line);
	else
		simcomplete := true;
	end if;
	
	if (in_line(1) = '-') then  --Skip comments
		next;
	elsif (in_line(1) = '.')  then  --exit Loop
	  Test_Out_Q <= 'Z';
		simcomplete := true;
	elsif (in_line(1) = '#') then        --Echo comments to out.txt
	  i := 1;
	  while in_line(i) /= '.' LOOP
		comment(i) := in_line(i);
		i := i + 1;
	  end LOOP;

	elsif (exo_line(1) = '-') then  --Skip comments
		next;
	elsif (exo_line(1) = '.')  then  --exit Loop
	  	  Test_Out_Q  <= 'Z';
		   simcomplete := true;
	elsif (exo_line(1) = '#') then        --Echo comments to out.txt
	     i := 1;
	   while exo_line(i) /= '.' LOOP
		 xcomment(i) := exo_line(i);
		 i := i + 1;
	   end LOOP;

	
	  write(out_line, comment);
	  writeline(out_file, out_line);
	  
	  write(xout_line, xcomment);
	  writeline(xout_file, xout_line);

	  
	ELSE      --Begin processing


		--  read(in_line, vOp_A );
		--  Op_A  <= vOp_A;

		--  read(exo_line, vexp_Op_Q );
	          --read(exo_line, vTest_Out_Q );


		  read(in_line, vRST );
		  RST <= vRST;

		  read(in_line, vEN );
		  EN <= vEN;
 		  read(in_line, vOP_A );
		  OP_A <= vOP_A;

		  read(exo_line, vExp_Op_Q );
	          read(exo_line, vTest_Out_Q );
		
		
    vlinenumber :=LineNumber;
    
    write(out_line, vlinenumber);
    write(out_line, STRING'("."));
    write(out_line, STRING'("    "));

	

   CYCLE(1,CLK);
    
    Exp_Op_Q     <= vExp_Op_Q;
    
      
    if (Exp_Op_Q = OP_Q) then
      Test_Out_Q <= '0';
    else
      Test_Out_Q <= 'X';
    end if;

		vOP_Q 	:= OP_Q;
		vTest_Out_Q:= Test_Out_Q;
          		
		write(out_line, vOP_Q, left, 32);
		write(out_line, STRING'("       "));                           --ht is ascii for horizontal tab
		write(out_line,vTest_Out_Q, left, 5);                           --ht is ascii for horizontal tab
		write(out_line, STRING'("       "));                           --ht is ascii for horizontal tab
		write(out_line, vExp_Op_Q, left, 32);
		write(out_line, STRING'("       "));                           --ht is ascii for horizontal tab
		writeline(out_file, out_line);
		print(xout_file,    str(LineNumber)& "." & "    " &    str(OP_Q) & "          " &   str(Exp_Op_Q)  & "          " & str(Test_Out_Q) );
	
	END IF;
	LineNumber<= LineNumber+1;

	END LOOP;
	WAIT;
	
	END PROCESS;

END TESTBENCH;


CONFIGURATION cfg_runsewe_tb_16bitregister OF runsewe_tb_16bitregister IS
	FOR TESTBENCH
		FOR Instrunsewe_16bitregister : runsewe_16bitregister 
		END FOR;
	END FOR;
END;

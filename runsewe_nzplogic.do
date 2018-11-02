onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate /runsewe_tb_nzplogic/CLK
add wave -noupdate -format Literal /runsewe_tb_nzplogic/RST
add wave -noupdate -format Literal /runsewe_tb_nzplogic/EN
add wave -noupdate /runsewe_tb_nzplogic/OP_A
add wave -noupdate /runsewe_tb_nzplogic/OP_Q
add wave -noupdate -divider {Test Signals}
add wave -noupdate /runsewe_tb_nzplogic/U0/CLK
add wave -noupdate /runsewe_tb_nzplogic/Exp_Op_Q
add wave -noupdate /runsewe_tb_nzplogic/OP_Q
add wave -noupdate /runsewe_tb_nzplogic/Test_Out_Q
add wave -noupdate -radix decimal /runsewe_tb_nzplogic/LineNumber
add wave -noupdate -divider Instantiation
add wave -noupdate /runsewe_tb_nzplogic/Instrunsewe_nzplogic/clk
add wave -noupdate -format Literal /runsewe_tb_nzplogic/Instrunsewe_nzplogic/RST
add wave -noupdate -format Literal /runsewe_tb_nzplogic/Instrunsewe_nzplogic/EN
add wave -noupdate /runsewe_tb_nzplogic/Instrunsewe_nzplogic/OP_A
add wave -noupdate /runsewe_tb_nzplogic/Instrunsewe_nzplogic/OP_Q
add wave -noupdate /runsewe_tb_nzplogic/Instrunsewe_nzplogic/S_D
add wave -noupdate -divider Output
add wave -noupdate /runsewe_tb_nzplogic/OP_Q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {60 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 304
configure wave -valuecolwidth 142
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {100 ns}

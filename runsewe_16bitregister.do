onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate /runsewe_tb_16bitregister/CLK
add wave -noupdate -format Literal -radix binary /runsewe_tb_16bitregister/RST
add wave -noupdate -format Literal /runsewe_tb_16bitregister/EN
add wave -noupdate /runsewe_tb_16bitregister/OP_A
add wave -noupdate /runsewe_tb_16bitregister/OP_Q
add wave -noupdate -divider {Test Signals}
add wave -noupdate /runsewe_tb_16bitregister/U0/CLK
add wave -noupdate /runsewe_tb_16bitregister/OP_Q
add wave -noupdate /runsewe_tb_16bitregister/Exp_Op_Q
add wave -noupdate /runsewe_tb_16bitregister/Test_Out_Q
add wave -noupdate -radix decimal /runsewe_tb_16bitregister/LineNumber
add wave -noupdate -divider Instantiation
add wave -noupdate /runsewe_tb_16bitregister/Instrunsewe_16bitregister/CLK
add wave -noupdate -format Literal /runsewe_tb_16bitregister/Instrunsewe_16bitregister/RST
add wave -noupdate -format Literal /runsewe_tb_16bitregister/Instrunsewe_16bitregister/EN
add wave -noupdate /runsewe_tb_16bitregister/Instrunsewe_16bitregister/OP_A
add wave -noupdate /runsewe_tb_16bitregister/Instrunsewe_16bitregister/OP_Q
add wave -noupdate /runsewe_tb_16bitregister/Instrunsewe_16bitregister/S_D
add wave -noupdate -divider Output
add wave -noupdate /runsewe_tb_16bitregister/OP_Q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {40 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 247
configure wave -valuecolwidth 129
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
WaveRestoreZoom {0 ns} {224 ns}

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate /runsewe_tb_16bitpc/CLK
add wave -noupdate -format Literal -radix binary /runsewe_tb_16bitpc/RST
add wave -noupdate /runsewe_tb_16bitpc/OP_R
add wave -noupdate /runsewe_tb_16bitpc/OP_A
add wave -noupdate /runsewe_tb_16bitpc/OP_Q
add wave -noupdate -format Literal /runsewe_tb_16bitpc/EN
add wave -noupdate -divider {Test Signals}
add wave -noupdate /runsewe_tb_16bitpc/U0/CLK
add wave -noupdate /runsewe_tb_16bitpc/Exp_Op_Q
add wave -noupdate /runsewe_tb_16bitpc/Exp_Op_R
add wave -noupdate /runsewe_tb_16bitpc/OP_Q
add wave -noupdate /runsewe_tb_16bitpc/OP_R
add wave -noupdate /runsewe_tb_16bitpc/Test_Out_Q
add wave -noupdate /runsewe_tb_16bitpc/Test_Out_R
add wave -noupdate -radix decimal /runsewe_tb_16bitpc/LineNumber
add wave -noupdate -divider Instantiation
add wave -noupdate /runsewe_tb_16bitpc/Instrunsewe_16bitpc/CLK
add wave -noupdate /runsewe_tb_16bitpc/Instrunsewe_16bitpc/RST
add wave -noupdate /runsewe_tb_16bitpc/Instrunsewe_16bitpc/EN
add wave -noupdate /runsewe_tb_16bitpc/Instrunsewe_16bitpc/OP_A
add wave -noupdate /runsewe_tb_16bitpc/Instrunsewe_16bitpc/OP_Q
add wave -noupdate /runsewe_tb_16bitpc/Instrunsewe_16bitpc/OP_R
add wave -noupdate /runsewe_tb_16bitpc/Instrunsewe_16bitpc/pc_data
add wave -noupdate /runsewe_tb_16bitpc/Instrunsewe_16bitpc/pc_data_plus
add wave -noupdate -divider Output
add wave -noupdate /runsewe_tb_16bitpc/OP_Q
add wave -noupdate /runsewe_tb_16bitpc/OP_R
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 320
configure wave -valuecolwidth 124
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
WaveRestoreZoom {0 ns} {103 ns}

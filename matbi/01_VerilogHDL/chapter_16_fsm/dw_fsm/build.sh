rm -rf *.vcd output_fsm_test_dw
iverilog -o output_fsm_test_dw tb_fsm_dw.v fsm_dw.v
vvp output_fsm_test_dw
gtkwave ./output.vcd

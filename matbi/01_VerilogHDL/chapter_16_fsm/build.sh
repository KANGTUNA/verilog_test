rm -rf *.vcd
iverilog -o output_fsm_test_dw tb_fsm_test.v fsm_test.v
vvp output_fsm_test_dw
gtkwave ./output.vcd

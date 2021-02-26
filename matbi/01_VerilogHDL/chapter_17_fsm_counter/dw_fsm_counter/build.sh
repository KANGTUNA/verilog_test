rm -rf *.vcd
rm -rf output_fsm_counter_test.v
iverilog -o output_fsm_counter_test.v dw_tb_fsm_counter.v dw_fsm_counter.v 
vvp output_fsm_counter_test.v 
gtkwave ./output.vcd

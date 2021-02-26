rm -rf *.vcd
iverilog -o output_counter_100 tb_counter_100_dw.v counter_100_dw.v
vvp output_counter_100
gtkwave ./output.vcd

rm -rf *.vcd
iverilog -o output_power_of_8 power_of_8_dw.v tb_power_of_8_dw.v
vvp output_power_of_8
gtkwave ./output.vcd


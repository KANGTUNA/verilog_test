rm -rf *.vcd
iverilog -o output_power_of_8 power_of_8.v tb_power_of_8.v
vvp output_power_of_8
gtkwave ./output.vcd


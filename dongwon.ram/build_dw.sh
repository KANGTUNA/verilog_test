rm -rf *.vcd dongwonram_out
iverilog -o -Wall -g2012 -o dongwonram_out tb_dongwon_ram.v dongwon_ram.v dongwon_cpu.v dongwon_cache.v
vvp dongwonram_out 
gtkwave *.vcd
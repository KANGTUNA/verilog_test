`timescale 1ns/1ns

module tb_counter_100_dw;
reg clk, reset_n;
wire [6:0] o_cnt;
wire [6:0] o_always_cnt;
always 
    #5 clk = ~clk;

initial begin
    $dumpfile("output.vcd");
    $dumpvars(0, tb_counter_100_dw);

    $display("initialize value [%d]", $time);
    reset_n = 1;
    clk     = 0;

#100
    $display("Reset! [%d]", $time);
    reset_n = 0;
#10
    reset_n = 1;
#10
    $display("Start! [%d]", $time);
#2000
    $display("Finish! [%d]", $time);
    $finish;
end


counter_100_dw u_counter_100_dw(
    .clk            (clk),
    .reset_n        (reset_n),
    .o_cnt          (o_cnt),
    .o_always_cnt   (o_always_cnt)
);

endmodule
`timescale 1ns/1ns

module tb_fsm_test_dw;
reg clk , reset_n;
reg 	i_run;
reg     i_done;
wire 	o_done;
 
// clk gen
always
    #5 clk = ~clk;

initial begin
//initialize value
$dumpfile("output.vcd");
$dumpvars(0, tb_fsm_test_dw);

$display("initialize value [%d]", $time);
    reset_n = 1;
    clk     = 0;
	i_run = 0;
    i_done = 0;
	
// reset_n gen
$display("Reset! [%d]", $time);
# 100
    reset_n = 0;
# 10
    reset_n = 1;
# 10
@(posedge clk);
$display("Start! [%d]", $time);
	i_run = 1;
@(posedge clk);
	i_run = 0;
@(posedge clk);
    i_done = 1;
@(posedge clk);
    i_done = 0;

# 100
$display("Finish! [%d]", $time);
$finish;
end

// Call DUT
fsm_dw u_fsm_dw(
    .clk (clk),
    .reset_n (reset_n),
	.i_run (i_run),
    .i_done (i_done),
	.o_done (o_done)
    );
endmodule

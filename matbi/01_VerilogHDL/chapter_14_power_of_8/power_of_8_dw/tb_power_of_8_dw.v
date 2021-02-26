`timescale 1ns/1ns

module tb_power_of_8_dw;
reg clk, reset_n;
reg [31:0] i_value;
wire [31:0] o_value;
integer i;

always
    #5 clk = ~clk;

initial begin

$dumpfile("output.vcd");
$dumpvars(0, tb_power_of_8_dw);

clk         = 0;
reset_n     = 1;
i           = 0;

#10
    i_value <= 0;
    reset_n = 0;
#10
    $display("start time[%d]", $time);
    reset_n = 1;

    @(posedge clk);
    for(i=0; i<10; i=i+1) begin
        @(posedge clk);
        i_value <= i;
        //@(posedge clk);
    end
#100
    $display("end time [%d]", $time);
$finish;
end

power_of_8_dw u_power_of_8_dw (
    .clk            (clk),
    .reset_n        (reset_n),
    .i_value        (i_value),
    .o_value        (o_value)
);



endmodule
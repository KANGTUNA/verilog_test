`timescale 1ns/1ns

module dongwon_cpu
#(
    parameter ADDR_WIDTH = 8
)
(
    input reset_n,
    input clk,
    input restart_n,
    output reg [ADDR_WIDTH-1:0] pc
);


//program counter
always @(posedge clk or negedge reset_n or negedge restart_n) begin
    if (!reset_n)
        pc <= 8'b0;    

    else if(!restart_n)
        pc <=0;
    else
        pc <= pc + 4;
end

endmodule
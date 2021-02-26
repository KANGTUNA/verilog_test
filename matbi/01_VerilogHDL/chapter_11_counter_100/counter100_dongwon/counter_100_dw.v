`timescale 1ns/1ns

module counter_100_dw (
    input clk,
    input reset_n,
    output wire[6:0] o_cnt,
    output wire[6:0] o_always_cnt
);

reg [6:0] cnt;
reg [6:0] always_cnt;

always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
        cnt <= 0;
    else if(cnt<100)
        cnt <= cnt + 1;
end
assign o_cnt = cnt;

always @(posedge clk or negedge reset_n) begin
    if(!reset_n)
        always_cnt <= 0;
    else if(always_cnt > 100)
        always_cnt <= 0;
    else
        always_cnt <= always_cnt + 1;    
end
assign o_always_cnt = always_cnt;
    
endmodule
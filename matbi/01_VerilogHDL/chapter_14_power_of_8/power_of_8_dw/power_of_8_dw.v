`timescale 1ns/1ns

module power_of_8_dw (
    input clk, reset_n,
    input   [31:0]  i_value,
    output  [31:0]  o_value
);
integer i;


reg [31:0] r_power_of_2;
reg [31:0] r_power_of_4;
wire [31:0] power_of_2;
wire [31:0] power_of_4;

always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        r_power_of_2 <= 0;
        r_power_of_4 <= 0;
    end
    else begin
        r_power_of_2 <= i_value;
        r_power_of_4 <= power_of_2;
    end
end


assign power_of_2 = r_power_of_2 * r_power_of_2;
assign power_of_4 = r_power_of_4 * r_power_of_4;    
assign o_value = power_of_4;


    
endmodule
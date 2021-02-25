//////////////////////////////////////////////////////////////////////////////////
// Company: Personal
// Engineer: Matbi / Austin
//
// Create Date:
// Design Name: clock_gating_model
// Module Name: clock_gating_model
// Project Name:
// Target Devices:
// Tool Versions:
// Description: modeling clock_gating 
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module clock_gating_model(
    input 	i_clk				,
    input 	i_clock_en			,
    output  o_clk
    );

	assign o_clk = i_clk & i_clock_en;

endmodule

`timescale 1ns/1ns

module fsm_dw (
    input clk, 
    input reset_n,
    input i_run,
    input i_done,
    output reg o_done
);
    
localparam S_IDLE = 2'b00;
localparam S_RUN = 2'b01;
localparam S_DONE = 2'b10;

reg [1:0] c_state;
reg [1:0] n_state;

// Updata c_state
always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        c_state = S_IDLE;
        n_state = S_IDLE;
    end
    else begin
        case(c_state)
            S_IDLE  : if(i_run) c_state <= S_RUN;
            S_RUN   : if(i_done) c_state <= S_DONE;
            S_DONE  : c_state <= S_IDLE;
        endcase    
    end
end

always @(*) begin
    if(c_state == S_DONE)
        o_done = 1;
end


//update n_state
//always @(*) begin 
//end


endmodule
`timescale 1ns/1ns

module dw_fsm_counter (
    input clk, 
    input reset_n,
    input i_run,
    input [6:0] i_num_cnt,
    output o_idle,
    output o_running,
    output o_done
);

reg [6:0] c_state;
wire is_done;
reg [6:0] num_cnt;
reg [6:0] cnt;

localparam S_IDLE = 2'b00;
localparam S_RUN = 2'b01;
localparam S_DONE = 2'b10;

//update c_state
always @(posedge clk or negedge reset_n) begin
    if (!reset_n)begin
        c_state <= 0;
    end
    else begin
        case(c_state)
            S_IDLE  : if(i_run) c_state <= S_RUN;
            S_RUN   : if(is_done) c_state <= S_DONE;
            S_DONE  : c_state <= S_IDLE;
        endcase    
    end
end


//compute max num
always @(posedge clk or negedge reset_n) begin
    if(!reset_n)begin
        num_cnt <= 0;
    end else if (o_running) begin
        num_cnt <= i_num_cnt;
    end else if (is_done) begin
        num_cnt <= 0;
    end
end

//compute count
always @(posedge clk or negedge reset_n) begin
    if(!reset_n)begin
        cnt <= 0;
    end else if (o_running) begin
        cnt <= cnt + 1;
    end else if (is_done) begin
        cnt <=0 ;
    end
    
end

assign o_idle       = (c_state == S_IDLE);
assign o_running    = (c_state == S_RUN);
assign o_done       = (c_state == S_DONE);


assign is_done = o_running && (cnt == num_cnt - 1);

endmodule
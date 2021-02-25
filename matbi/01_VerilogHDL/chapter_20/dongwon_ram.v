`timescale 1 ns/ 1 ps
module dongwon_ram
#(
    parameter ADDR_WIDTH = 8,
    parameter DATA_WIDTH = 8,
    parameter MEM_SIZE = 4096
)
(
    input clk,
    input reset_n,
    input [ADDR_WIDTH-1:0] addr,
    input [DATA_WIDTH-1:0] in_data,
    input run,
    input we,
    input [2:0] state_of_cache,
    output reg [DATA_WIDTH-1:0] out_data = 8'b0000_0000
);

localparam CACHE_WRITE        = 3'b010;
localparam CACHE_READ_MISS    = 3'b100;
localparam CACHE_READ_HIT     = 3'b101;
localparam CACHE_IDLE         = 3'b000;



//(* ram_style = "block" *)reg [DATA_WIDTH-1:0] ram[0:MEM_SIZE-1];
//reg [DATA_WIDTH-1:0] ram[0:MEM_SIZE-1];

reg [8-1:0] ram[0:MEM_SIZE-1];
integer iter=0;
always @(posedge clk or negedge reset_n) begin
    if(!reset_n)begin
        for(iter=0; iter<MEM_SIZE-1; iter=iter+1)begin
            ram[iter] <= {DATA_WIDTH{1'b0}};
        end
    end
end

// read & write
always @(posedge clk) begin
    if(run) begin
        if (we) begin
            ram[addr] <= (in_data)&(8'hff);
            ram[addr+1] <= (in_data>>8)&(8'hff);
            ram[addr+2] <= (in_data>>16)&(8'hff);
            ram[addr+3] <= (in_data>>24)&(8'hff);    
        end
            
        else if(~we)begin
            out_data <= (ram[addr+0]&(8'hff)<<0)
                        |(ram[addr+1]&(8'hff)<<8)
                        |(ram[addr+2]&(8'hff)<<16)
                        |(ram[addr+3]&(8'hff)<<24);        
        end
    end    
end

endmodule

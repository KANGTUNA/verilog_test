//Description: Direct mapped cache

module dongwon_cache
//param
#(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32,          //2^5
    parameter CACHE_SIZE = 4096,        //2^12
    parameter CACHE_MODE = "DIRECT MAPPED"
)
(
    input clk,
    input reset_n,
    input [ADDR_WIDTH-1:0] addr,
    input we,
    input run,
    input [DATA_WIDTH-1:0] in_data,
    output reg [DATA_WIDTH-1:0] out_data,
    output reg [2:0] state_of_cache
);

localparam SIZE_OF_BYTE_OFFSET = $clog2(DATA_WIDTH/8);
localparam SIZE_OF_INDEX = $clog2(CACHE_SIZE) - SIZE_OF_BYTE_OFFSET;
localparam SIZE_OF_VALID = 1;
localparam SIZE_OF_TAG = (ADDR_WIDTH)-(SIZE_OF_INDEX)-(SIZE_OF_BYTE_OFFSET);
localparam SIZE_OF_CACHE_LINE = (SIZE_OF_VALID)+(SIZE_OF_TAG)+(DATA_WIDTH);
localparam IDX_VALID = SIZE_OF_CACHE_LINE - 1; 

//Cache
reg [SIZE_OF_CACHE_LINE-1:0] cache_line[0:SIZE_OF_INDEX-1];

wire [SIZE_OF_BYTE_OFFSET-1:0] byte_offset;
wire [SIZE_OF_INDEX-1:0] index; 
wire [SIZE_OF_TAG-1:0] tag;

//Parsing address -> tag/index/byte offset
assign byte_offset = addr[SIZE_OF_BYTE_OFFSET-1 : 0];
assign index = addr[SIZE_OF_INDEX-1 : SIZE_OF_BYTE_OFFSET];
assign tag = addr[SIZE_OF_TAG-1 : SIZE_OF_INDEX+SIZE_OF_BYTE_OFFSET];


//Cache initialization
integer iter=0;
always @(posedge clk or negedge reset_n) begin
    if(!reset_n)begin
        for(iter=0; iter < CACHE_SIZE-1; iter=iter+1) begin
            cache_line[iter] <= {DATA_WIDTH{1'b0}};
        end       
    end
end

//update state of cache {Read|Write, Hit|Miss}
localparam CACHE_WRITE        = 3'b010;
localparam CACHE_READ_MISS    = 3'b100;
localparam CACHE_READ_HIT     = 3'b101;
localparam CACHE_IDLE         = 3'b000;

//localparam CACHE_WRITE_MISS   = 2'b10;
//localparam CACHE_WRITE_HIT    = 2'b11;

wire [3:0] abc;
assign abc = in_data & 32'hffff_ffff;

//Update Read & Write
always @(posedge clk) begin
    state_of_cache = CACHE_IDLE;
    if((CACHE_MODE == "DIRECT MAPPED") && run) begin
        if(we) begin                                            
                if(cache_line[index][IDX_VALID] == 0) begin  
                    state_of_cache <= CACHE_WRITE;
                    cache_line[index][DATA_WIDTH-1:0] <= in_data;
                    cache_line[index][IDX_VALID] <= 1'b1;
                end else                          
                    state_of_cache <= CACHE_WRITE;              
                    cache_line[index][DATA_WIDTH-1] <=  in_data;
                end
        else begin                                              
                if(cache_line[index][IDX_VALID] == 0) begin 
                    state_of_cache <= CACHE_READ_MISS;    
                    cache_line[index][DATA_WIDTH-1:0] <= in_data; //from RAM
                    cache_line[index][IDX_VALID] <= 1'b1;
                end else begin                                  
                    state_of_cache <= CACHE_READ_HIT;
                    out_data <= cache_line[index] & 32'hffff_ffff;
                    cache_line[index][IDX_VALID] <= 1'b1;
                end                                     
            end                 
        end
end  

endmodule

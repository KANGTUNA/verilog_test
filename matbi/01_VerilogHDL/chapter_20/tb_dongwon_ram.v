`timescale 1 ns/ 1 ps

`define ADDR_WIDTH 32
`define DATA_WIDTH 32
`define MEM_SIZE 1024
`define CACHE_SIZE 64
`define CACHE_MODE "DIRECT MAPPED"

module tb_dongwon_ram ();

//Program cnter
//wire [`ADDR_WIDTH-1:0] pc;
reg pc_restart;
reg [`ADDR_WIDTH-1:0] pc;
//Memory
reg r_we;
reg c_we;
reg clk;
reg reset_n;
reg r_run;
reg c_run;

reg [`DATA_WIDTH-1:0] r_in_data;
reg [`DATA_WIDTH-1:0] c_in_data;
wire [`DATA_WIDTH-1:0] r_out_data;
wire [`DATA_WIDTH-1:0] c_out_data;
reg [`DATA_WIDTH-1:0] t_out_data;
wire [2:0] state_of_cache;

//local praram
localparam CACHE_WRITE        = 3'b010;
localparam CACHE_READ_MISS    = 3'b100;
localparam CACHE_READ_HIT     = 3'b101;
localparam CACHE_IDLE         = 3'b000;

integer iter = 0;
integer count = 1;
//clock generation
always
    #5 clk = ~clk;

initial begin
    $dumpfile("output.vcd");
    $dumpvars(0, tb_dongwon_ram);

    //initialization
    reset_n = 1;
    pc_restart = 1;
    clk = 1; 
    
    r_run = 1;
    r_we = 0;
    c_run = 0;
    c_we = 0;
    
    c_in_data = 0;
    r_in_data = 0;

    //1. RAM initialization (OK) 
    begin
        #10
        reset_n <= 0 ;     
        r_we <= 1; 
        r_run <=1;
        pc = 0;

        #10
        reset_n = 1;
        for (iter=0; iter<32; iter=iter+1) begin
            r_in_data <= iter;
            pc <= pc+4;
            #10;
        end
    end
    
    // 2. Cache read(Cache miss) 
    begin
        pc_restart <= 0;
        r_run <=1;
        c_run <=1;
        r_we <= 0; 
        c_we <= 0;
        pc = 0;

        #10
        pc_restart <= 1;
        for (iter=0; iter<32; iter=iter+1) begin
                c_in_data <= r_out_data;
                pc = pc+4;
                #10;
        end
    end
    

    // 3. Cache read(Cache hit)
    begin
        #10
        c_we <= 0;
        r_run <=0;
        c_run <=1;
        pc_restart <= 0;
        pc = 0;

        #10
        pc_restart <= 1;
        for (iter=0; iter<32; iter=iter+1) begin     
            if(state_of_cache == CACHE_READ_HIT)
                t_out_data <= c_out_data;
                pc <= pc+4;
                #10;
        end
    end
    

    $finish;
end


// Memory
dongwon_ram 
#(  
    .ADDR_WIDTH             (`ADDR_WIDTH),
    .DATA_WIDTH             (`DATA_WIDTH),
    .MEM_SIZE               (`MEM_SIZE)
)
u_dongwon_ram (
    .clk                    (clk),
    .reset_n                (reset_n),
    .addr                   (pc),
    .run                    (r_run),
    .in_data                (r_in_data),
    .we                     (r_we),
    .out_data               (r_out_data),
    .state_of_cache         (state_of_cache)
);


//cpu
// dongwon_cpu
// #(
//     .ADDR_WIDTH             (`ADDR_WIDTH)
// )
// u_dongwon_cpu
// (
//     .reset_n                (reset_n),
//     .clk                    (clk),
//     .pc                     (pc),
//     .restart_n              (pc_restart)
// );

//cache
dongwon_cache
#(
    .ADDR_WIDTH             (`ADDR_WIDTH),
    .DATA_WIDTH             (`DATA_WIDTH),
    .CACHE_SIZE             (`CACHE_SIZE),
    .CACHE_MODE             (`CACHE_MODE)
)       
u_dongwon_cache(        
    .clk                    (clk),
    .reset_n                (reset_n),
    .we                     (c_we),
    .addr                   (pc),
    .run                    (c_run),
    .out_data               (c_out_data),
    .in_data                (c_in_data),
    .state_of_cache         (state_of_cache)
);
    
endmodule
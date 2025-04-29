`timescale 1ns / 1ps
module tb_DataMem();

   
    reg clk;
    reg MemRead;
    reg MemWrite;
    reg [9:0] addr;
    reg [31:0] data_in;
    wire [127:0] data_out;
    wire ready;

 
    DataMem uut (
        .clk(clk),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out),
        .ready(ready)
    );
    
    always begin
        #5 clk = ~clk;
    end

    initial begin

        clk = 0;
        MemRead = 0;
        MemWrite = 0;
        addr = 10'd0;
        data_in = 32'd0;
        #40 
        
        
        // Question 1: Write 8 to Address 5
        MemWrite = 1;
        addr = 10'd5;
        data_in = 32'd8;
        #40;  
        
        
        // Question 2: Read from Address 3
        MemWrite = 0;
        MemRead = 1;
        addr = 10'd3;
        #40; 
        

        // Question 3: Read from Address 5
        MemWrite = 0;
        MemRead = 1;
        addr = 10'd5;
        #40;  
      

    end

endmodule


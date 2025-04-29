`timescale 1ns / 1ps

module CacheController_TB();
reg clk;
reg reset;
reg MemRead;
reg MemWrite;
reg [4:0] index;
reg [2:0] tag;
wire stall;
wire fill;
wire update;
wire MsRead;
reg MsReady;


DataCacheController uut (clk,reset, MemRead, MemWrite,index,tag, stall, fill, update,MsRead,MsReady);

always begin
        #5 clk = ~clk;
    end  
    
initial begin
        clk = 0;
        MemRead = 0;
        MemWrite = 0;
        index = 0;
        tag = 2'b00;
       // stall = 0;
       // fill = 0;
       // update = 0;
       // MsRead = 0;
       MsReady = 0;
        
        #40
         MemRead = 1;
          MsReady = 0;
        index = 5; //read miss   
        tag = 2'b10;
        #40
         MsReady = 1;
       
        #40 
         MemRead = 0;
         MemWrite = 0;
         MsReady = 0;
         
         #40   
         
         MemRead = 0;
          MsReady = 0;
         MemWrite = 1;
         tag = 2'd5; //write miss
            #40
         MsReady = 1;
        #40 
       MemRead = 0;
         MemWrite = 0;
         MsReady = 0;
         
         #40 
         MsReady = 0;
         MemRead = 1;
        index = 5; //read hit   
           
        tag = 2'b10; 
           #40
         MsReady = 1;
          #40 
       MemRead = 0;
         MemWrite = 0;
         MsReady = 0;
        
        #40   
            MsReady = 0;
         MemWrite = 1;
        
        index = 5; //write hit    
        tag = 2'b10;
        
      

    end

endmodule


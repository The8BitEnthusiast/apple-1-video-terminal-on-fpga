`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2022 12:20:01 PM
// Design Name: 
// Module Name: ic_74160_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ic_74160_tb(

    );
    
     reg [3:0] p;
     reg pe_n;
     reg mr_n;
     reg clk;
     wire tc;
     reg cet;
     reg cep;
     wire [3:0] q;
     
     ic_74160 c0 ( .pe_n (pe_n),
                        .p (p),
                        .q (q),
                        .cet (cet),
                        .cep (cep),
                        .cp (clk),
                        .tc (tc),
                        .mr_n (mr_n) );
                        
     
     always #5 clk = ~clk;
     
     initial begin
        clk <= 0;
        mr_n <= 0;
        cet <= 1;
        cep <= 1;
        pe_n <= 1;
        p <= 4'b0101;
        
        #20 mr_n <= 1;
        
        #160 pe_n <= 0;
        #10  pe_n <= 1;
        
        #200 $finish;
     end
    
endmodule

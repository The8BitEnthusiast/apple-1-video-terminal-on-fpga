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


module hcounter_tb(

    );
    
    reg clk;
    reg mr_n;
    
    wire h10, last_h, last_h_n;
    wire hbl_n, h_sync_n;
   
    wire [3:0] units;
    wire [3:0] tens;
     
    ic_74160 d6 ( .pe_n (last_h_n),
                  .p ({1'b0, tens[3], 1'b0, tens[3]}),
                  .q (units),
                  .cet (1'b1),
                  .cep (1'b1),
                  .cp (clk),
                  .tc (h10),
                  .mr_n (mr_n) );

    ic_74161 d7 ( .pe_n (last_h_n),
                  .p ({tens[3], 1'b0, 1'b0, tens[3]}),
                  .q (tens),
                  .cet (h10),
                  .cep (h10),
                  .cp (clk),
                  .tc (last_h),
                  .mr_n (mr_n) );
    
    not D12F (last_h_n, last_h);
    or C9B (h_sync_n, d7.q[0], hbl_n);

    assign hbl_n = d7.q[2];
     
    always #5 clk = ~clk;
     
    initial begin
        clk <= 0;
        mr_n <= 0;
        
        #20 mr_n <= 1;
        
        #4000 $finish;
    end
    
endmodule

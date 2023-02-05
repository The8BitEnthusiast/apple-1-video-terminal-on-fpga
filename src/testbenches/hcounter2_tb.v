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


module hcounter2_tb(

    );
    
    reg clk;
    reg mr_n;
    
    wire char_rate, dot_rate;
    wire h10, last_h, last_h_n;
    wire hbl_n, h_sync_n;
   
    wire [3:0] units;
    wire [3:0] tens;

    ic_74175 c13 (.cp(clk),
                 .d({1'b0, 1'b0, 1'b0, dot_rate}),
                 .q(),
                 .q_n(),
                 .mr_n(mr_n) );

    assign dot_rate = c13.q_n[0];

    ic_74161 d11 ( .pe_n (char_rate),
                  .p (4'b1010),
                  .q (),
                  .cet (char_rate),
                  .cep (char_rate),
                  .cp (dot_rate),
                  .tc (),
                  .mr_n (mr_n) );

    assign char_rate = d11.q[3];
    
    ic_74160 d6 ( .pe_n (last_h_n),
                  .p ({1'b0, tens[3], 1'b0, tens[3]}),
                  .q (units),
                  .cet (1'b1),
                  .cep (1'b1),
                  .cp (char_rate),
                  .tc (h10),
                  .mr_n (mr_n) );

    ic_74161 d7 ( .pe_n (last_h_n),
                  .p ({tens[3], 1'b0, 1'b0, tens[3]}),
                  .q (tens),
                  .cet (h10),
                  .cep (h10),
                  .cp (char_rate),
                  .tc (last_h),
                  .mr_n (mr_n) );
    
    not D12F (last_h_n, last_h);
    or C9B (h_sync_n, d7.q[0], hbl_n);

    assign hbl_n = d7.q[2];
     
    always #35 clk = ~clk;
     
    initial begin
        clk <= 0;
        mr_n <= 0;
        
        #70 mr_n <= 1;
        
        #250000 $finish;
    end
    
endmodule

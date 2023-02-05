`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2022 12:20:01 PM
// Design Name: 
// Module Name: video_terminal_tb
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


module video_terminal_tb(

    );
    
    reg clk;
    reg mr_n;
    
    wire char_rate, dot_rate;
    wire h10, last_h, last_h_n;
    wire hbl_n, h_sync_n, h3_vbl;
   
    wire [3:0] units;
    wire [3:0] tens;

    wire d8_tc, vinh_n, vbl_n, vbl, v_rst_n, last;
    wire [7:0] v;
    wire wc1_n;
    wire line_phi;
    wire pix_ld_n;

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

    ic_74161 d8 ( .pe_n (v_rst_n),
                  .p ({h3_vbl, h3_vbl, h3_vbl, h3_vbl}),
                  .q ({v[3], v[2], v[1], v[0]}),
                  .cet (last_h),
                  .cep (vinh_n),
                  .cp (char_rate),
                  .tc (d8_tc),
                  .mr_n (mr_n) );
    
    ic_74161 d9 ( .pe_n (v_rst_n),
                  .p ({h3_vbl, 1'b0, h3_vbl, h3_vbl}),
                  .q ({v[7], v[6], v[5], v[4]}),
                  .cet (d8_tc),
                  .cep (vinh_n),
                  .cp (char_rate),
                  .tc (last),
                  .mr_n (mr_n) );
    
    nand d10c (vbl_n, v[7], v[6]);
    not d12d (vbl, vbl_n);
    or c9c (v_rst_n, wc1_n, vbl_n);
    nor c10c (h3_vbl, vbl_n, d6.q[3]);

    nand d10b (line_phi, d11.q[2], hbl_n);
    nand d10a (pix_ld_n, d11.tc, hbl_n);
     
    always #35 clk = ~clk;
     
    initial begin
        clk <= 0;
        mr_n <= 0;
        
        #70 mr_n <= 1;
        
        #250000 $finish;
    end
    
endmodule

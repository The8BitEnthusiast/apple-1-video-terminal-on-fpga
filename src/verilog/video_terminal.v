`timescale 1us/ 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2022 03:08:53 PM
// Design Name: 
// Module Name: video_terminal
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


module video_terminal(
    input clk,
    input reset,
    input clr_btn,
    input da,
    output rda_n,
    input rd1, rd2, rd3, rd4, rd5, rd6, rd7
    );
    
    wire char_clk;
    wire mem_clk;
    wire line_clk;
    wire pixel_clk;
    wire cl;
    
    wire d11_tc;
    wire d11_q0;
    wire d11_q1;
    wire d11_q2;
    
    wire [5:0] d12_q;
    wire [3:0] d10_q;
    wire [3:0] d15_q;
    
    wire h3_vbl;
    
    
    wire [7:0] h;
    wire [7:0] v;
    
    wire d6_tc;
    wire d8_tc;
    wire last_h;
    wire last_h_n;
    wire line_7;
    wire pix_ld;
    wire v_rst_n;
    wire vbl;
    wire vbl_n;
    wire wc1_n;
    wire wc2_n;
    wire last;
    
    wire vinh;
    wire h_sync_n;
    wire v_sync_n;
    wire v_cr;
    
    wire curs;
    wire curs2;
    wire cursi;
    wire curso;
    wire c13_q2;
    
    wire clr;
    wire write_n;
    wire co1, co2, co3, co4, co5, co6, co7;
    wire cb1, cb2, cb3, cb4, cb5, cb6, cb7;
    wire ci1, ci2, ci3, ci4, ci5, ci6, ci7;
    
    wire clr_fsm1, clr_fsm2, ack, last2, last_h2, cr_decode, ctrl_char;
    
    ic_74174 c7( .clk(mem_clk),
                 .mr_n(reset));
    
    ic_2504 c11b( .clk(mem_clk),
                  .si(cursi),
                  .so(curso));
    
    ic_74175 c13( .cp (clk),
                  .mr_n (reset));
                  
    ic_74157 c14();
    
    ic_74161 d11( .cp (pixel_clk),
                  .cet (char_clk),
                  .cep (char_clk),
                  .pe_n (char_clk),
                  .mr_n (reset),
                  .q ({char_clk,d11_q2,d11_q1,d11_q0}),
                  .tc (d11_tc),
                  .p (4'b1010));
                  
    ic_74160 d6( .cp (char_clk),
                 .cet (1'b1),
                 .cep (1'b1),
                 .pe_n (last_h_n),
                 .mr_n (reset),
                 .q ({h[3], h[2], h[1], h[0]}),
                 .tc (d6_tc),
                 .p ({1'b0, h[7], 1'b0, h[7]}));
                 
    ic_74161 d7( .cp (char_clk),
                 .cet (d6_tc),
                 .cep (d6_tc),
                 .pe_n (last_h_n),
                 .mr_n (reset),
                 .q ({h[7], h[6], h[5], h[4]}),
                 .tc (last_h),
                 .p ({h[7], 1'b0, 1'b0, h[7]}));
                 
    ic_74161 d8( .cp (char_clk),
                 .cet (last_h),
                 .cep (vinh),
                 .pe_n (v_rst_n),
                 .mr_n (reset),
                 .q ({v[3], v[2], v[1], v[0]}),
                 .tc (d8_tc),
                 .p ({h3_vbl, h3_vbl, h3_vbl, h3_vbl}));
                 
     ic_74161 d9( .cp (char_clk),
                 .cet (d8_tc),
                 .cep (vinh),
                 .pe_n (v_rst_n),
                 .mr_n (reset),
                 .q ({v[7], v[6], v[5], v[4]}),
                 .tc (last),
                 .p ({h3_vbl, 1'b0, h3_vbl, h3_vbl}));   
                 
     ic_74161 d15( .cp (char_clk),
                 .cet (last_h),
                 .cep (last_h),
                 .pe_n (v_cr),
                 .mr_n (reset),
                 .q (d15_q),
                 .tc (),
                 .p (4'b1010));
                
    ic_7404 d12( .a ({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, last_h}),
                 .y ({d12_q[5], d12_q[4], d12_q[3], d12_q[2], d12_q[1], last_h_n}));
                 
    ic_7400 d10( .a ({1'b0, 1'b0, d11_q2, d11_tc}),
                 .b ({1'b0, 1'b0, h[6], h[6]}),
                 .y ({d10_q[3], d10_q[2], d10_q[1], d10_q[0]}));
              
    
    assign pixel_clk = c13.q_n[0];
    assign c13.d[0] = pixel_clk;
    
    assign c13_q2 = c13.q_n[2];
    assign cursi = c13_q2 & wc2_n;
    assign c13.d[3] = curso; 
    assign curs = c13.q_n[3];
    assign c13.d[1] = ~ (h_sync_n & d15.q[3]);
    
    
    assign line_clk = d10_q[1];
    assign pixel_ld = d10_q[0];
    
    assign h_sync_n = h[4] | h[6];
    assign h3_vbl = ~ (h[3] | vbl_n);
    assign vbl_n = ~ (v[7] & v[6]);
    assign vbl = ~ (vbl_n);
    
    assign v_rst_n = wc1_n | vbl_n;
    assign line_7 = ~ (v[0] & v[1] & v[2]);
    
    assign mem_clk = ~ (h3_vbl | line_7 | line_clk);
    
    assign v_cr = v[5] & vbl & (~ (v[3] | v[4]));
    assign vinh = d15_q[1];
    
    assign c7.d[0] = last;
    assign c7.d[1] = da;
    assign c7.d[2] = ack;
    assign c7.d[3] = clr_fsm1;
    assign c7.d[4] = last_h;
    assign c7.d[5] = wc1_n;
    
    assign rda_n = c7.q[2];
    
    assign ack = ~ (c7.q[1] & curs);
    assign ctrl_char = ~ (ack | rd6 | rd7);
    assign write_n = ack | ctrl_char;
    
    assign last2 = c7.q[0];
    assign last_h2 = c7.q[4];
    assign wc1_n = (write_n) & ~ ((last2 & (clr_fsm1 | clr_btn)) | (last_h2 & clr_fsm1));
    assign wc2_n = c7.q[5];
    assign clr_fsm2 = c7.q[3];
    assign cr_decode = ~ ( rd2 | rd5 | ( ~ ( rd1 & rd3 & rd4 )));
    
    assign clr_fsm1 = (clr_fsm2 & wc2_n) | (cr_decode & ctrl_char);
    assign clr = vbl | clr_btn | clr_fsm1;
    
    assign c14.i1d = curs;
    assign c14.i0d = 1'b0;
    assign c14.e_n = clr;
    assign c14.s = write_n;
    assign curs2 = c14.zd;
    assign c13.d[2] = curs2;
    
    
endmodule

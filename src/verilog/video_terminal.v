`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2022 12:20:01 PM
// Design Name: 
// Module Name: video_terminal
// Project Name: Apple 1 Video Terminal Display 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Instantiation:
//  video_terminal u0 (.clk_in(), .rd(), .da(), .rda_n(), .clr_btn(), .vid1,
//  vid2);
// 
//////////////////////////////////////////////////////////////////////////////////


module video_terminal(
    input clk,
    input [7:1] rd_in,
    input da_in,
    input clr_btn,
    output vid1,
    output vid2,
    output curs_tgl_in
    );
    
    // wire clk_out, locked, clk;
    reg mr_n = 1'b1;

    wire [7:1] rd;
    wire da;
    wire rda_n;

    wire [6:1] ci;
    wire [6:1] cb;
    wire [6:1] co;
    wire [5:1] cg;
    wire da_out, ack, cr_decode0, ctrl_char, clr_fsm1, clr_fsm1_n;
    wire clr_fsm2, cr_decode, last2, last_h2, clr_fsm_or_btn, c8b_out;
    
    wire char_rate, dot_rate;
    wire h10, last_h, last_h_n;
    wire hbl_n, h_sync_n, h3_vbl;
    wire v_sync_n;
   
    wire [3:0] units;
    wire [3:0] tens;

    wire d8_tc, vinh_n, vbl_n, vbl, v_rst_n, last;
    wire [7:0] v;
    wire wc1_n, wc2_n, write_n, clr;
    wire line_phi, mem_phi;
    wire pix_ld_n;

    wire v3_nor_v4, v_cr, vid1_in;

    wire line_7;

    wire cursi, curso, curs2, curs_tgl;
    
    // clk_gen clk0 (.clk_in(clk_in), .clk_out(clk_out), .locked(locked));
    // assign clk = clk_out & locked;
    ic_74273 reg0 (.d({1'b1, rd_in[7:1]}), 
        .q({da, rd[7:1]}), .mr_n(rda_n), .cp(da_in));


    ic_74175 c13 (.cp(clk),
                 .d({curso, curs2, vid1_in, dot_rate}),
                 .q(),
                 .q_n(),
                 .mr_n(mr_n) );

    assign dot_rate = c13.q_n[0];
    assign vid1 = c13.q_n[1];
    assign curs = c13.q_n[3];

    ic_555 timer0 ( .clk(clk), .out(curs_tgl_in) );

    and c12a (curs_tgl, curs_tgl_in, curs2);
    nor c10a (cb6_tgl, curs_tgl, cb[6]);

    ic_74157 c14 ( .i0a(rd[5]), 
                   .i1a(ci[5]), 
                   .za(cb[5]), 
                   .i0b(), 
                   .i1b(), 
                   .zb(), 
                   .i0c(rd[7]), 
                   .i1c(ci[6]),
                   .zc(cb[6]), 
                   .i0d(1'b0), 
                   .i1d(curs), 
                   .zd(curs2), 
                   .e_n(clr), 
                   .s(write_n) );

    ic_2519 c3 ( .clk(line_phi), .rc(line_7), 
                 .in({cb6_tgl, cb[5:1]}), 
                 .out({co[6], co[5:1]}));
    ic_2513 d2 ( .x({cg[5:1]}), 
                 .a({co[6:1], v[2:0]}) );
    ic_74166 d1 ( .clk(dot_rate), .ser_in(1'b0), .p({cg[5:1], 1'b0, 1'b0, 1'b0}), .load_n(pix_ld_n), .clr_n(1'b1), .qh(vid2) );

    ic_74157 c4  ( .i0a(rd[1]), 
                   .i1a(ci[1]), 
                   .za(cb[1]), 
                   .i0b(rd[2]), 
                   .i1b(ci[2]), 
                   .zb(cb[2]), 
                   .i0c(rd[3]), 
                   .i1c(ci[3]),
                   .zc(cb[3]), 
                   .i0d(rd[4]), 
                   .i1d(ci[4]), 
                   .zd(cb[4]), 
                   .e_n(clr), 
                   .s(write_n) );

    ic_2504 d5a ( .clk(mem_phi), .si(cb[1]), .so(ci[1]) );
    ic_2504 d5b ( .clk(mem_phi), .si(cb[2]), .so(ci[2]) );
    ic_2504 d4a ( .clk(mem_phi), .si(cb[3]), .so(ci[3]) );
    ic_2504 d4b ( .clk(mem_phi), .si(cb[4]), .so(ci[4]) );
    ic_2504 d14a ( .clk(mem_phi), .si(cb[5]), .so(ci[5]) );
    ic_2504 d14b ( .clk(mem_phi), .si(cb[6]), .so(ci[6]) );

    ic_74174 c7 ( .clk(mem_phi), 
                  .d({wc1_n, last_h, clr_fsm1, ack, da, last}), 
                  .q({wc2_n, last_h2, clr_fsm2, rda_n, da_out, last2}), 
                  .mr_n(mr_n) );

    nand_3 c6b ( ack, curs, da_out, da_out );
    nor_3 c5b ( ctrl_char, ack, rd[6], rd[7] );
    or c9d ( write_n, ack, ctrl_char );
    nand_3 c6c ( cr_decode0, rd[1], rd[3], rd[4] );
    nor_3 c5c ( cr_decode, cr_decode0, rd[2], rd[5] );
    and_or_invert c8a (clr_fsm1_n, ctrl_char, cr_decode, wc2_n, clr_fsm2 );
    not d12a (clr_fsm1, clr_fsm1_n);
    or_3 or3clr (clr, vbl, clr_btn, clr_fsm1 );
    or (clr_fsm_or_btn, clr_fsm1, clr_btn );
    and_or_invert c8b (c8b_out, clr_fsm1, last_h2, clr_fsm_or_btn, last2 );
    and c12b (wc1_n, c8b_out, write_n);

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
   //  or C9B (h_sync_n, d7.q[0], hbl_n );
   // fix h_sync pulse width
    or C9B (h_sync_n, d7.q[0], hbl_n | ~(units < 5));

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

    nand_3 b2a (line_7, v[0], v[1], v[2]);
    nor_3 c5a (mem_phi, h3_vbl, line_7, line_phi);

    ic_74161 d15 ( .pe_n (v_cr),
                  .p (4'b1010),
                  .q (),
                  .cet (last_h),
                  .cep (last_h),
                  .cp (char_rate),
                  .tc (),
                  .mr_n (mr_n) );
    
    assign vinh_n = d15.q[1]; 
    
    and_3 and3v_cr (v_cr, v[5], vbl, v3_nor_v4);
    nor c10d (v3_nor_v4, v[3], v[4]);
    // nand c15c (vid1_in, h_sync_n, d15.q[3]);
    // fix v_sync pulse width
    assign v_sync_n = ~ (v == 8'he4);
    nand c15c (vid1_in, h_sync_n, v_sync_n);

    ic_2504 c11b ( .clk(mem_phi), .si(cursi), .so(curso) );

    and c12c(cursi, wc2_n, c13.q_n[2]);
     
endmodule

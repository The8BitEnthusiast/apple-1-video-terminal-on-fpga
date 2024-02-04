`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2022 12:20:01 PM
// Design Name: 
// Module Name: top
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
// 
//////////////////////////////////////////////////////////////////////////////////

module top(
    input clk,
    input [8:0] io,
    output [1:0] dio,
    output [2:0] led
    );

    wire clk_out;
    wire clk_locked;
    wire locked;

    clk_gen clk0 (.clk_in(clk), .clk_out(clk_out), .locked(locked));

    assign clk_locked = clk_out & locked;

    video_terminal vt0 (.clk(clk_locked), 
        .rd_in(io[6:0]), 
        .da_in(io[7]), 
        .clr_btn(io[8]), 
        .vid1(dio[0]), 
        .vid2(dio[1]),
        .curs_tgl_in(led[0]));

endmodule

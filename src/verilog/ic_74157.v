`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 05:47:38 PM
// Design Name: 
// Module Name: ic_74157
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
// Instantiation:
//    ic_74157( .i0a(), .i1a(), .za(), .i0b(), .i1b(), .zb(), .i0c(), .i1c(),
//              .zc(), .i0d(), .i1d(), .zd(), .e_n(), .s() );
// 
//////////////////////////////////////////////////////////////////////////////////


module ic_74157(
    input i0a,
    input i1a,
    output za,
    input i0b,
    input i1b,
    output zb,
    input i0c,
    input i1c,
    output zc,
    input i0d,
    input i1d,
    output zd,
    input e_n,
    input s
    );
    
    assign za = (~e_n) & ((i1a & s) | (i0a & ~s));
    assign zb = (~e_n) & ((i1b & s) | (i0b & ~s));
    assign zc = (~e_n) & ((i1c & s) | (i0c & ~s));
    assign zd = (~e_n) & ((i1d & s) | (i0d & ~s));
    
    
endmodule

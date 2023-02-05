`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 03:06:04 PM
// Design Name: 
// Module Name: ic_7427
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


module ic_7427(
    input [2:0] a,
    input [2:0] b,
    input [2:0] c,
    output [2:0] y
    );
    
    assign y = ~ (a | b | c);
    
endmodule

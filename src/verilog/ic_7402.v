`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 02:50:52 PM
// Design Name: 
// Module Name: ic_7402
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


module ic_7402(
    input [3:0] a,
    input [3:0] b,
    output [3:0] y
    );
    
    assign y = ~ (a | b);
    
endmodule

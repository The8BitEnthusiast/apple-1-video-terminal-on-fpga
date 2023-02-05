`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 09:35:45 AM
// Design Name: 
// Module Name: ic_7450
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: AND-OR-INVERT logic gate 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module and_or_invert(
    output y,
    input a,b,c,d);
    
    assign y = ~ ((a & b) | (c & d));
    
endmodule

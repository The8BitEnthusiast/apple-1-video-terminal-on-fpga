`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 09:35:45 AM
// Design Name: 
// Module Name: and_3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 3 input OR gate 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module or_3(
    output y,
    input a,b,c
    );
    
    assign y = a | b | c;
    
endmodule

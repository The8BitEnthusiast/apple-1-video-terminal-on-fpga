`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 03:47:29 PM
// Design Name: 
// Module Name: ic_7404
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


module ic_7404(
    input [5:0] a,
    output [5:0] y
    );
    
    assign y = ~a;
    
endmodule

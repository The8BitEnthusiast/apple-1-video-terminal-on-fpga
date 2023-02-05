`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 09:35:45 AM
// Design Name: 
// Module Name: ic_7400
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


module ic_7400(
    input [3:0] a,
    input [3:0] b,
    output [3:0] y
    );
    
    assign y = ~ (a & b);
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 05:14:17 PM
// Design Name: 
// Module Name: ic_2504
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


module ic_2504(
    input clk,
    input si,
    output so
    );
    
    reg [1023:0] tmp;
    
    always @(posedge clk)
    begin
        tmp = tmp << 1;
        
        tmp[0] = si;
    end
    
    assign so = tmp[1023];
    
endmodule
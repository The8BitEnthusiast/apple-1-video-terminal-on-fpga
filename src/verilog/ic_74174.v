`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2022 07:48:31 AM
// Design Name: 
// Module Name: ic_74174
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
//    ic_74174 u0 ( .clk(), .d(), .q(), .mr_n() );
// 
//////////////////////////////////////////////////////////////////////////////////


module ic_74174(
    input clk,
    input [5:0] d,
    output [5:0] q,
    input mr_n
    );
    
    reg [5:0] d_int;
   
    assign q = d_int;
    
    always @ (posedge clk, negedge mr_n) begin
        if (! mr_n)
            d_int <= 6'b000000;
        else
            d_int <= d;
            
    end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2022 10:32:53 AM
// Design Name: 
// Module Name: ic_74175
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
//    ic_74175 u0 (.cp(),.d(),.q(),.q_n(),mr_n());
// 
//////////////////////////////////////////////////////////////////////////////////


module ic_74175(
    input cp,
    input [3:0] d,
    output [3:0] q,
    output [3:0] q_n,
    input mr_n
    );
    
    reg [3:0] d_int;
    
    assign q_n = ~d_int;
    assign q = d_int;
    
    always @ (posedge cp, negedge mr_n) begin
        if (! mr_n)
            d_int <= 4'b0000;
        else
            d_int <= d;
            
    end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2022 10:56:50 AM
// Design Name: 
// Module Name: ic_74173
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


module ic_74173(
    input m,
    input n,
    input [3:0] d,
    output [3:0] q,
    input g1_n,
    input g2_n,
    input clr,
    input clk
    );
    
    reg [3:0] d_int;
    
    assign q = (~m & ~n) ? d_int : 4'bZZZZ;
    
    always @ (posedge clk, posedge clr) begin
        if (clr)
            d_int <= 4'b0000;
        else
            if ( ~g1_n & ~g2_n)
                d_int <= d;
            
    end

    initial begin
        d_int <= 4'b0000;
    end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 05:19:55 PM
// Design Name: 
// Module Name: ic_2519
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


module ic_2519(
    input clk,
    input rc,
    input [5:0] in,
    output [5:0] out
    );
    
    reg [39:0] tmp0, tmp1, tmp2, tmp3, tmp4, tmp5;
    
    always @(posedge clk)
    begin
        tmp0 = tmp0 << 1;
        tmp1 = tmp1 << 1;
        tmp2 = tmp2 << 1;
        tmp3 = tmp3 << 1;
        tmp4 = tmp4 << 1;
        tmp5 = tmp5 << 1;
        if (rc == 1) begin
            tmp0[0] = in[0];
            tmp1[0] = in[1];
            tmp2[0] = in[2];
            tmp3[0] = in[3];
            tmp4[0] = in[4];
            tmp5[0] = in[5];
        end
        else begin
            tmp0[0] = out[0];
            tmp1[0] = out[1];
            tmp2[0] = out[2];
            tmp3[0] = out[3];
            tmp4[0] = out[4];
            tmp5[0] = out[5];
        end
    end
    
    assign out[0] = tmp0[39];
    assign out[1] = tmp1[39];
    assign out[2] = tmp2[39];
    assign out[3] = tmp3[39];
    assign out[4] = tmp4[39];
    assign out[5] = tmp5[39];
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2022 05:14:17 PM
// Design Name: 
// Module Name: ic_74166
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Parallel-Load 8-Bit Shift Registers
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Instantation: 
//   ic_74166 u0 ( .clk(), .ser_in(), .p(), .load_n(), .clr_n(), .qh() );
// 
//////////////////////////////////////////////////////////////////////////////////


module ic_74166(
    input clk,
    input ser_in,
    input [7:0] p,
    input load_n,
    input clr_n,
    output qh 
    );
    
    reg [7:0] tmp;

    initial
    begin
        tmp <= 0;
    end
    
    always @(posedge clk, negedge clr_n)
    begin
        if ( ! clr_n )
            tmp <= 0;
        else
            if ( ! load_n )
                tmp <= p;
            else
                tmp <= {tmp[6:0], ser_in};
    end
    
    assign qh = tmp[7];
    
endmodule

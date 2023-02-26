`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2022 10:56:50 AM
// Design Name: 
// Module Name: ic_74273
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Octal D Flip-Flop with Clear
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Instantiation:
//   ic_74273 u0 (.d(), .q(), .mr_n(), .cp());
// 
//////////////////////////////////////////////////////////////////////////////////


module ic_74273(
    input [7:0] d,
    output [7:0] q,
    input mr_n,
    input cp
    );
    
    reg [7:0] d_int;
    
    assign q = d_int;
    
    always @ (posedge cp, negedge mr_n) begin
        if (~ mr_n)
            d_int <= 8'b00000000;
        else
            d_int <= d;
            
    end

    initial begin
        d_int <= 8'b00000000;
    end
    
endmodule

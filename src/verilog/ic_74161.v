`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2022 02:42:18 PM
// Design Name: 74161 4 Bit Synchronous Binary Counter w/ Asynchronous Reset
// Module Name: ic_74161
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
//   ic_74161 u1 ( .pe_n(), p(), q(), cet(), cep(), cp(), tc(), mr_n());
// 
//////////////////////////////////////////////////////////////////////////////////


module ic_74161(
    input pe_n,
    input [3:0] p,
    output reg[3:0] q,
    input cet,
    input cep,
    input cp,
    output tc,
    input mr_n
    );
    
    assign tc = cet & (&q);
    
    initial begin
        q <= 0;
    end
       
    always @ (posedge cp, negedge mr_n) begin
        if (! mr_n)
            q <= 0;
        else
            if (! pe_n)
                q <= p;
            else
                if (cep && cet)
                    q <= q + 1;
    end
            
    
endmodule

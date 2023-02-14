`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2022 10:53:44 AM
// Design Name: 
// Module Name: ic_74160
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
//    ic_74160 u1 ( .pe_n(), .p(), .q(), .cet(), .cep(), cp(), tc(), mr_n() );
// 
//////////////////////////////////////////////////////////////////////////////////


module ic_74160(
    input pe_n,
    input [3:0] p,
    output reg[3:0] q,
    input cet,
    input cep,
    input cp,
    output tc,
    input mr_n
    );
    
    assign tc = cet & (q == 9);
       
    always @ (posedge cp, negedge mr_n) begin
        if (! mr_n)
            q <= 0;
        else
            if (! pe_n)
                q <= p;
            else
                if (cep && cet)
                    if (q == 9)
                        q <= 0;
                    else
                        q <= q + 1;
    end

    initial
    begin
        q <= 0;
    end
    
endmodule

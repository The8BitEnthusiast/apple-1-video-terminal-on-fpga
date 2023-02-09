`timescale 1ns/1ps

module ic_2513_tb ();

    reg [9:1] a;
    wire [5:1] x;

    ic_2513 u0 ( .x(x), .a(a) );

    initial
        begin
            $display("Address   | Output");

            a=9'b000000000; #1 $display("%b | %b", a, x);
            #9 a=9'b000000001; #1 $display("%b | %b", a, x);
            #9 a=9'b000000010; #1 $display("%b | %b", a, x);
            #9 a=9'b000000011; #1 $display("%b | %b", a, x);
            #9 a=9'b000000100; #1 $display("%b | %b", a, x);
            #9 a=9'b000000101; #1 $display("%b | %b", a, x);
            #9 a=9'b000000110; #1 $display("%b | %b", a, x);
            #9 a=9'b000000111; #1 $display("%b | %b", a, x);
        end
endmodule


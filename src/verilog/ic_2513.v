`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2022 09:35:45 AM
// Design Name: 
// Module Name: ic_2513 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 64 X 8 X 5 Character Generator 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// Instantation:
//     ic_2513 u0 ( .x(), .a() );
// 
//////////////////////////////////////////////////////////////////////////////////


module ic_2513(
    output reg [5:1] x,
    input [9:1] a
    );
    
    always @ (a)
    begin
        case ( a )
            // character '@'
            9'b000000000 : x = 5'b00000 ;
            9'b000000001 : x = 5'b01110 ;
            9'b000000010 : x = 5'b10001 ;
            9'b000000011 : x = 5'b10101 ;
            9'b000000100 : x = 5'b10111 ;
            9'b000000101 : x = 5'b10110 ;
            9'b000000110 : x = 5'b10000 ;
            9'b000000111 : x = 5'b01111 ;

            // character 'A'
            9'b000001000 : x = 5'b00000 ;
            9'b000001001 : x = 5'b00100 ;
            9'b000001010 : x = 5'b01010 ;
            9'b000001011 : x = 5'b10001 ;
            9'b000001100 : x = 5'b10001 ;
            9'b000001101 : x = 5'b11111 ;
            9'b000001110 : x = 5'b10001 ;
            9'b000001111 : x = 5'b10001 ;

             // character 'B'
            9'b000010000 : x = 5'b00000 ;
            9'b000010001 : x = 5'b11110 ;
            9'b000010010 : x = 5'b10001 ;
            9'b000010011 : x = 5'b10001 ;
            9'b000010100 : x = 5'b11110 ;
            9'b000010101 : x = 5'b10001 ;
            9'b000010110 : x = 5'b10001 ;
            9'b000010111 : x = 5'b11110 ;

              // character 'C'
            9'b000011000 : x = 5'b00000 ;
            9'b000011001 : x = 5'b01110 ;
            9'b000011010 : x = 5'b10001 ;
            9'b000011011 : x = 5'b10000 ;
            9'b000011100 : x = 5'b10000 ;
            9'b000011101 : x = 5'b10000 ;
            9'b000011110 : x = 5'b10001 ;
            9'b000011111 : x = 5'b01110 ;

               // character 'D'
            9'b000100000 : x = 5'b00000 ;
            9'b000100001 : x = 5'b11110 ;
            9'b000100010 : x = 5'b10001 ;
            9'b000100011 : x = 5'b10001 ;
            9'b000100100 : x = 5'b10001 ;
            9'b000100101 : x = 5'b10001 ;
            9'b000100110 : x = 5'b10001 ;
            9'b000100111 : x = 5'b11110 ;

                // character 'E'
            9'b000101000 : x = 5'b00000 ;
            9'b000101001 : x = 5'b11111 ;
            9'b000101010 : x = 5'b10000 ;
            9'b000101011 : x = 5'b10000 ;
            9'b000101100 : x = 5'b11110 ;
            9'b000101101 : x = 5'b10000 ;
            9'b000101110 : x = 5'b10000 ;
            9'b000101111 : x = 5'b11111 ;

                // character 'F'
            9'b000110000 : x = 5'b00000 ;
            9'b000110001 : x = 5'b11111 ;
            9'b000110010 : x = 5'b10000 ;
            9'b000110011 : x = 5'b10000 ;
            9'b000110100 : x = 5'b11110 ;
            9'b000110101 : x = 5'b10000 ;
            9'b000110110 : x = 5'b10000 ;
            9'b000110111 : x = 5'b10000 ;

                // character 'G'
            9'b000111000 : x = 5'b00000 ;
            9'b000111001 : x = 5'b11111 ;
            9'b000111010 : x = 5'b10000 ;
            9'b000111011 : x = 5'b10000 ;
            9'b000111100 : x = 5'b11110 ;
            9'b000111101 : x = 5'b10000 ;
            9'b000111110 : x = 5'b10000 ;
            9'b000111111 : x = 5'b10000 ;

                // character 'H'
            9'b001000000 : x = 5'b00000 ;
            9'b001000001 : x = 5'b10001 ;
            9'b001000010 : x = 5'b10001 ;
            9'b001000011 : x = 5'b10001 ;
            9'b001000100 : x = 5'b11111 ;
            9'b001000101 : x = 5'b10001 ;
            9'b001000110 : x = 5'b10001 ;
            9'b001000111 : x = 5'b10001 ;

                // character 'I'
            9'b001001000 : x = 5'b00000 ;
            9'b001001001 : x = 5'b01110 ;
            9'b001001010 : x = 5'b00100 ;
            9'b001001011 : x = 5'b00100 ;
            9'b001001100 : x = 5'b00100 ;
            9'b001001101 : x = 5'b00100 ;
            9'b001001110 : x = 5'b00100 ;
            9'b001001111 : x = 5'b01110 ;

                // character '{space}'
            9'b100000000 : x = 5'b00000 ;
            9'b100000001 : x = 5'b00000 ;
            9'b100000010 : x = 5'b00000 ;
            9'b100000011 : x = 5'b00000 ;
            9'b100000100 : x = 5'b00000 ;
            9'b100000101 : x = 5'b00000 ;
            9'b100000110 : x = 5'b00000 ;
            9'b100000111 : x = 5'b00000 ;



      endcase
    end

endmodule

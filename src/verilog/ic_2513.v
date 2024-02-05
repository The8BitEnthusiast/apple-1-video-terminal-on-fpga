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
            9'b000111001 : x = 5'b01111 ;
            9'b000111010 : x = 5'b10000 ;
            9'b000111011 : x = 5'b10000 ;
            9'b000111100 : x = 5'b10000 ;
            9'b000111101 : x = 5'b10011 ;
            9'b000111110 : x = 5'b10001 ;
            9'b000111111 : x = 5'b01111 ;

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

               // character 'J'
            9'b001010000 : x = 5'b00000 ;
            9'b001010001 : x = 5'b00001 ;
            9'b001010010 : x = 5'b00001 ;
            9'b001010011 : x = 5'b00001 ;
            9'b001010100 : x = 5'b00001 ;
            9'b001010101 : x = 5'b00001 ;
            9'b001010110 : x = 5'b10001 ;
            9'b001010111 : x = 5'b01110 ;

              // character 'K'
            9'b001011000 : x = 5'b00000 ;
            9'b001011001 : x = 5'b10001 ;
            9'b001011010 : x = 5'b10010 ;
            9'b001011011 : x = 5'b10100 ;
            9'b001011100 : x = 5'b11000 ;
            9'b001011101 : x = 5'b10100 ;
            9'b001011110 : x = 5'b10010 ;
            9'b001011111 : x = 5'b10001 ;

             // character 'L'
            9'b001100000 : x = 5'b00000 ;
            9'b001100001 : x = 5'b10000 ;
            9'b001100010 : x = 5'b10000 ;
            9'b001100011 : x = 5'b10000 ;
            9'b001100100 : x = 5'b10000 ;
            9'b001100101 : x = 5'b10000 ;
            9'b001100110 : x = 5'b10000 ;
            9'b001100111 : x = 5'b11111 ;

             // character 'M'
            9'b001101000 : x = 5'b00000 ;
            9'b001101001 : x = 5'b10001 ;
            9'b001101010 : x = 5'b11011 ;
            9'b001101011 : x = 5'b10101 ;
            9'b001101100 : x = 5'b10101 ;
            9'b001101101 : x = 5'b10001 ;
            9'b001101110 : x = 5'b10001 ;
            9'b001101111 : x = 5'b10001 ;
 
             // character 'N'
            9'b001110000 : x = 5'b00000 ;
            9'b001110001 : x = 5'b10001 ;
            9'b001110010 : x = 5'b10001 ;
            9'b001110011 : x = 5'b11001 ;
            9'b001110100 : x = 5'b10101 ;
            9'b001110101 : x = 5'b10011 ;
            9'b001110110 : x = 5'b10001 ;
            9'b001110111 : x = 5'b10001 ;
 
             // character 'O'
            9'b001111000 : x = 5'b00000 ;
            9'b001111001 : x = 5'b01110 ;
            9'b001111010 : x = 5'b10001 ;
            9'b001111011 : x = 5'b10001 ;
            9'b001111100 : x = 5'b10001 ;
            9'b001111101 : x = 5'b10001 ;
            9'b001111110 : x = 5'b10001 ;
            9'b001111111 : x = 5'b01110 ;

             // character 'P'
            9'b010000000 : x = 5'b00000 ;
            9'b010000001 : x = 5'b11110 ;
            9'b010000010 : x = 5'b10001 ;
            9'b010000011 : x = 5'b10001 ;
            9'b010000100 : x = 5'b11110 ;
            9'b010000101 : x = 5'b10000 ;
            9'b010000110 : x = 5'b10000 ;
            9'b010000111 : x = 5'b10000 ;

             // character 'Q'
            9'b010001000 : x = 5'b00000 ;
            9'b010001001 : x = 5'b01110 ;
            9'b010001010 : x = 5'b10001 ;
            9'b010001011 : x = 5'b10001 ;
            9'b010001100 : x = 5'b10001 ;
            9'b010001101 : x = 5'b10101 ;
            9'b010001110 : x = 5'b10010 ;
            9'b010001111 : x = 5'b01101 ;

             // character 'R'
            9'b010010000 : x = 5'b00000 ;
            9'b010010001 : x = 5'b11110 ;
            9'b010010010 : x = 5'b10001 ;
            9'b010010011 : x = 5'b10001 ;
            9'b010010100 : x = 5'b11110 ;
            9'b010010101 : x = 5'b10100 ;
            9'b010010110 : x = 5'b10010 ;
            9'b010010111 : x = 5'b10001 ;

             // character 'S'
            9'b010011000 : x = 5'b00000 ;
            9'b010011001 : x = 5'b01110 ;
            9'b010011010 : x = 5'b10001 ;
            9'b010011011 : x = 5'b10000 ;
            9'b010011100 : x = 5'b01110 ;
            9'b010011101 : x = 5'b00001 ;
            9'b010011110 : x = 5'b10001 ;
            9'b010011111 : x = 5'b01110 ;

             // character 'T'
            9'b010100000 : x = 5'b00000 ;
            9'b010100001 : x = 5'b11111 ;
            9'b010100010 : x = 5'b00100 ;
            9'b010100011 : x = 5'b00100 ;
            9'b010100100 : x = 5'b00100 ;
            9'b010100101 : x = 5'b00100 ;
            9'b010100110 : x = 5'b00100 ;
            9'b010100111 : x = 5'b00100 ;

             // character 'U'
            9'b010101000 : x = 5'b00000 ;
            9'b010101001 : x = 5'b10001 ;
            9'b010101010 : x = 5'b10001 ;
            9'b010101011 : x = 5'b10001 ;
            9'b010101100 : x = 5'b10001 ;
            9'b010101101 : x = 5'b10001 ;
            9'b010101110 : x = 5'b10001 ;
            9'b010101111 : x = 5'b01110 ;

             // character 'V'
            9'b010110000 : x = 5'b00000 ;
            9'b010110001 : x = 5'b10001 ;
            9'b010110010 : x = 5'b10001 ;
            9'b010110011 : x = 5'b10001 ;
            9'b010110100 : x = 5'b10001 ;
            9'b010110101 : x = 5'b10001 ;
            9'b010110110 : x = 5'b01010 ;
            9'b010110111 : x = 5'b00100 ;

             // character 'W'
            9'b010111000 : x = 5'b00000 ;
            9'b010111001 : x = 5'b10001 ;
            9'b010111010 : x = 5'b10001 ;
            9'b010111011 : x = 5'b10001 ;
            9'b010111100 : x = 5'b10101 ;
            9'b010111101 : x = 5'b10101 ;
            9'b010111110 : x = 5'b11011 ;
            9'b010111111 : x = 5'b10001 ;
            
             // character 'X'
            9'b011000000 : x = 5'b00000 ;
            9'b011000001 : x = 5'b10001 ;
            9'b011000010 : x = 5'b10001 ;
            9'b011000011 : x = 5'b01010 ;
            9'b011000100 : x = 5'b00100 ;
            9'b011000101 : x = 5'b01010 ;
            9'b011000110 : x = 5'b10001 ;
            9'b011000111 : x = 5'b10001 ;
            
             // character 'Y'
            9'b011001000 : x = 5'b00000 ;
            9'b011001001 : x = 5'b10001 ;
            9'b011001010 : x = 5'b10001 ;
            9'b011001011 : x = 5'b01010 ;
            9'b011001100 : x = 5'b00100 ;
            9'b011001101 : x = 5'b00100 ;
            9'b011001110 : x = 5'b00100 ;
            9'b011001111 : x = 5'b00100 ;
            
             // character 'Z'
            9'b011010000 : x = 5'b00000 ;
            9'b011010001 : x = 5'b11111 ;
            9'b011010010 : x = 5'b00001 ;
            9'b011010011 : x = 5'b00010 ;
            9'b011010100 : x = 5'b00100 ;
            9'b011010101 : x = 5'b01000 ;
            9'b011010110 : x = 5'b10000 ;
            9'b011010111 : x = 5'b11111 ;
            
             // character '['
            9'b011011000 : x = 5'b00000 ;
            9'b011011001 : x = 5'b11111 ;
            9'b011011010 : x = 5'b11000 ;
            9'b011011011 : x = 5'b11000 ;
            9'b011011100 : x = 5'b11000 ;
            9'b011011101 : x = 5'b11000 ;
            9'b011011110 : x = 5'b11000 ;
            9'b011011111 : x = 5'b11111 ;

             // character '\'
            9'b011100000 : x = 5'b00000 ;
            9'b011100001 : x = 5'b00000 ;
            9'b011100010 : x = 5'b10000 ;
            9'b011100011 : x = 5'b01000 ;
            9'b011100100 : x = 5'b00100 ;
            9'b011100101 : x = 5'b00010 ;
            9'b011100110 : x = 5'b00001 ;
            9'b011100111 : x = 5'b00000 ;

             // character ']'
            9'b011101000 : x = 5'b00000 ;
            9'b011101001 : x = 5'b11111 ;
            9'b011101010 : x = 5'b00011 ;
            9'b011101011 : x = 5'b00011 ;
            9'b011101100 : x = 5'b00011 ;
            9'b011101101 : x = 5'b00011 ;
            9'b011101110 : x = 5'b00011 ;
            9'b011101111 : x = 5'b11111 ;

             // character '^'
            9'b011110000 : x = 5'b00000 ;
            9'b011110001 : x = 5'b00000 ;
            9'b011110010 : x = 5'b00000 ;
            9'b011110011 : x = 5'b00100 ;
            9'b011110100 : x = 5'b01010 ;
            9'b011110101 : x = 5'b10001 ;
            9'b011110110 : x = 5'b00000 ;
            9'b011110111 : x = 5'b00000 ;

             // character '_'
            9'b011111000 : x = 5'b00000 ;
            9'b011111001 : x = 5'b00000 ;
            9'b011111010 : x = 5'b00000 ;
            9'b011111011 : x = 5'b00000 ;
            9'b011111100 : x = 5'b00000 ;
            9'b011111101 : x = 5'b00000 ;
            9'b011111110 : x = 5'b00000 ;
            9'b011111111 : x = 5'b11111 ;

             // character '{space}'
            9'b100000000 : x = 5'b00000 ;
            9'b100000001 : x = 5'b00000 ;
            9'b100000010 : x = 5'b00000 ;
            9'b100000011 : x = 5'b00000 ;
            9'b100000100 : x = 5'b00000 ;
            9'b100000101 : x = 5'b00000 ;
            9'b100000110 : x = 5'b00000 ;
            9'b100000111 : x = 5'b00000 ;

             // character '!'
            9'b100001000 : x = 5'b00000 ;
            9'b100001001 : x = 5'b00100 ;
            9'b100001010 : x = 5'b00100 ;
            9'b100001011 : x = 5'b00100 ;
            9'b100001100 : x = 5'b00100 ;
            9'b100001101 : x = 5'b00100 ;
            9'b100001110 : x = 5'b00000 ;
            9'b100001111 : x = 5'b00100 ;

             // character '"'
            9'b100010000 : x = 5'b00000 ;
            9'b100010001 : x = 5'b01010 ;
            9'b100010010 : x = 5'b01010 ;
            9'b100010011 : x = 5'b01010 ;
            9'b100010100 : x = 5'b00000 ;
            9'b100010101 : x = 5'b00000 ;
            9'b100010110 : x = 5'b00000 ;
            9'b100010111 : x = 5'b00000 ;

             // character '#'
            9'b100011000 : x = 5'b00000 ;
            9'b100011001 : x = 5'b01010 ;
            9'b100011010 : x = 5'b01010 ;
            9'b100011011 : x = 5'b11111 ;
            9'b100011100 : x = 5'b01010 ;
            9'b100011101 : x = 5'b11111 ;
            9'b100011110 : x = 5'b01010 ;
            9'b100011111 : x = 5'b01010 ;

             // character '$'
            9'b100100000 : x = 5'b00000 ;
            9'b100100001 : x = 5'b00100 ;
            9'b100100010 : x = 5'b01111 ;
            9'b100100011 : x = 5'b10100 ;
            9'b100100100 : x = 5'b01110 ;
            9'b100100101 : x = 5'b00101 ;
            9'b100100110 : x = 5'b11110 ;
            9'b100100111 : x = 5'b00100 ;

             // character '%'
            9'b100101000 : x = 5'b00000 ;
            9'b100101001 : x = 5'b11000 ;
            9'b100101010 : x = 5'b11001 ;
            9'b100101011 : x = 5'b00010 ;
            9'b100101100 : x = 5'b00100 ;
            9'b100101101 : x = 5'b01000 ;
            9'b100101110 : x = 5'b10011 ;
            9'b100101111 : x = 5'b00011 ;

             // character '&'
            9'b100110000 : x = 5'b00000 ;
            9'b100110001 : x = 5'b01000 ;
            9'b100110010 : x = 5'b10100 ;
            9'b100110011 : x = 5'b10100 ;
            9'b100110100 : x = 5'b01000 ;
            9'b100110101 : x = 5'b10101 ;
            9'b100110110 : x = 5'b10010 ;
            9'b100110111 : x = 5'b01101 ;

             // character '''
            9'b100111000 : x = 5'b00000 ;
            9'b100111001 : x = 5'b00100 ;
            9'b100111010 : x = 5'b00100 ;
            9'b100111011 : x = 5'b00100 ;
            9'b100111100 : x = 5'b00000 ;
            9'b100111101 : x = 5'b00000 ;
            9'b100111110 : x = 5'b00000 ;
            9'b100111111 : x = 5'b00000 ;

             // character '('
            9'b101000000 : x = 5'b00000 ;
            9'b101000001 : x = 5'b00100 ;
            9'b101000010 : x = 5'b01000 ;
            9'b101000011 : x = 5'b10000 ;
            9'b101000100 : x = 5'b10000 ;
            9'b101000101 : x = 5'b10000 ;
            9'b101000110 : x = 5'b01000 ;
            9'b101000111 : x = 5'b00100 ;

             // character ')'
            9'b101001000 : x = 5'b00000 ;
            9'b101001001 : x = 5'b00100 ;
            9'b101001010 : x = 5'b00010 ;
            9'b101001011 : x = 5'b00001 ;
            9'b101001100 : x = 5'b00001 ;
            9'b101001101 : x = 5'b00001 ;
            9'b101001110 : x = 5'b00010 ;
            9'b101001111 : x = 5'b00100 ;

             // character '*'
            9'b101010000 : x = 5'b00000 ;
            9'b101010001 : x = 5'b00100 ;
            9'b101010010 : x = 5'b10101 ;
            9'b101010011 : x = 5'b01110 ;
            9'b101010100 : x = 5'b00100 ;
            9'b101010101 : x = 5'b01110 ;
            9'b101010110 : x = 5'b10101 ;
            9'b101010111 : x = 5'b00100 ;

             // character '+'
            9'b101011000 : x = 5'b00000 ;
            9'b101011001 : x = 5'b00000 ;
            9'b101011010 : x = 5'b00100 ;
            9'b101011011 : x = 5'b00100 ;
            9'b101011100 : x = 5'b11111 ;
            9'b101011101 : x = 5'b00100 ;
            9'b101011110 : x = 5'b00100 ;
            9'b101011111 : x = 5'b00000 ;

             // character ','
            9'b101100000 : x = 5'b00000 ;
            9'b101100001 : x = 5'b00000 ;
            9'b101100010 : x = 5'b00000 ;
            9'b101100011 : x = 5'b00000 ;
            9'b101100100 : x = 5'b00000 ;
            9'b101100101 : x = 5'b00100 ;
            9'b101100110 : x = 5'b00100 ;
            9'b101100111 : x = 5'b01000 ;

             // character '-'
            9'b101101000 : x = 5'b00000 ;
            9'b101101001 : x = 5'b00000 ;
            9'b101101010 : x = 5'b00000 ;
            9'b101101011 : x = 5'b00000 ;
            9'b101101100 : x = 5'b11111 ;
            9'b101101101 : x = 5'b00000 ;
            9'b101101110 : x = 5'b00000 ;
            9'b101101111 : x = 5'b00000 ;

             // character '.'
            9'b101110000 : x = 5'b00000 ;
            9'b101110001 : x = 5'b00000 ;
            9'b101110010 : x = 5'b00000 ;
            9'b101110011 : x = 5'b00000 ;
            9'b101110100 : x = 5'b00000 ;
            9'b101110101 : x = 5'b00000 ;
            9'b101110110 : x = 5'b00000 ;
            9'b101110111 : x = 5'b00100 ;

             // character '/'
            9'b101111000 : x = 5'b00000 ;
            9'b101111001 : x = 5'b00000 ;
            9'b101111010 : x = 5'b00001 ;
            9'b101111011 : x = 5'b00010 ;
            9'b101111100 : x = 5'b00100 ;
            9'b101111101 : x = 5'b01000 ;
            9'b101111110 : x = 5'b10000 ;
            9'b101111111 : x = 5'b00000 ;

             // character '0'
            9'b110000000 : x = 5'b00000 ;
            9'b110000001 : x = 5'b01110 ;
            9'b110000010 : x = 5'b10001 ;
            9'b110000011 : x = 5'b10011 ;
            9'b110000100 : x = 5'b10101 ;
            9'b110000101 : x = 5'b11001 ;
            9'b110000110 : x = 5'b10001 ;
            9'b110000111 : x = 5'b01110 ;

             // character '1'
            9'b110001000 : x = 5'b00000 ;
            9'b110001001 : x = 5'b00100 ;
            9'b110001010 : x = 5'b01100 ;
            9'b110001011 : x = 5'b00100 ;
            9'b110001100 : x = 5'b00100 ;
            9'b110001101 : x = 5'b00100 ;
            9'b110001110 : x = 5'b00100 ;
            9'b110001111 : x = 5'b01110 ;

             // character '2'
            9'b110010000 : x = 5'b00000 ;
            9'b110010001 : x = 5'b01110 ;
            9'b110010010 : x = 5'b10001 ;
            9'b110010011 : x = 5'b00001 ;
            9'b110010100 : x = 5'b00110 ;
            9'b110010101 : x = 5'b01000 ;
            9'b110010110 : x = 5'b10000 ;
            9'b110010111 : x = 5'b11111 ;

             // character '3'
            9'b110011000 : x = 5'b00000 ;
            9'b110011001 : x = 5'b11111 ;
            9'b110011010 : x = 5'b00001 ;
            9'b110011011 : x = 5'b00010 ;
            9'b110011100 : x = 5'b00110 ;
            9'b110011101 : x = 5'b00001 ;
            9'b110011110 : x = 5'b10001 ;
            9'b110011111 : x = 5'b01110 ;

             // character '4'
            9'b110100000 : x = 5'b00000 ;
            9'b110100001 : x = 5'b00010 ;
            9'b110100010 : x = 5'b00110 ;
            9'b110100011 : x = 5'b01010 ;
            9'b110100100 : x = 5'b10010 ;
            9'b110100101 : x = 5'b11111 ;
            9'b110100110 : x = 5'b00010 ;
            9'b110100111 : x = 5'b00010 ;

             // character '5'
            9'b110101000 : x = 5'b00000 ;
            9'b110101001 : x = 5'b11111 ;
            9'b110101010 : x = 5'b10000 ;
            9'b110101011 : x = 5'b11110 ;
            9'b110101100 : x = 5'b00001 ;
            9'b110101101 : x = 5'b00001 ;
            9'b110101110 : x = 5'b10001 ;
            9'b110101111 : x = 5'b01110 ;

             // character '6'
            9'b110110000 : x = 5'b00000 ;
            9'b110110001 : x = 5'b00111 ;
            9'b110110010 : x = 5'b01000 ;
            9'b110110011 : x = 5'b10000 ;
            9'b110110100 : x = 5'b11110 ;
            9'b110110101 : x = 5'b10001 ;
            9'b110110110 : x = 5'b10001 ;
            9'b110110111 : x = 5'b01110 ;

             // character '7'
            9'b110111000 : x = 5'b00000 ;
            9'b110111001 : x = 5'b11111 ;
            9'b110111010 : x = 5'b00001 ;
            9'b110111011 : x = 5'b00010 ;
            9'b110111100 : x = 5'b00100 ;
            9'b110111101 : x = 5'b01000 ;
            9'b110111110 : x = 5'b01000 ;
            9'b110111111 : x = 5'b01000 ;

             // character '8'
            9'b111000000 : x = 5'b00000 ;
            9'b111000001 : x = 5'b01110 ;
            9'b111000010 : x = 5'b10001 ;
            9'b111000011 : x = 5'b10001 ;
            9'b111000100 : x = 5'b01110 ;
            9'b111000101 : x = 5'b10001 ;
            9'b111000110 : x = 5'b10001 ;
            9'b111000111 : x = 5'b01110 ;

             // character '9'
            9'b111001000 : x = 5'b00000 ;
            9'b111001001 : x = 5'b01110 ;
            9'b111001010 : x = 5'b10001 ;
            9'b111001011 : x = 5'b10001 ;
            9'b111001100 : x = 5'b01111 ;
            9'b111001101 : x = 5'b00001 ;
            9'b111001110 : x = 5'b00010 ;
            9'b111001111 : x = 5'b11100 ;

      endcase
    end

endmodule

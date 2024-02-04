`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2022 12:20:01 PM
// Design Name: 
// Module Name: video_terminal_tb
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


module video_terminal_tb(
    );
    
    reg clk_in;
    reg [7:1] rd;
    reg da;
    reg clr_btn;
    wire rda_n;
    wire vid1;
    wire vid2;
    
    video_terminal DUT (.clk_in(clk_in), .rd(rd), .da(da), .rda_n(rda_n), .clr_btn(clr_btn), .vid1(vid1), .vid2(vid2));

    always #10 clk_in = ~clk_in;
    always @ (negedge rda_n)
    begin
        #10000 da <= 0;
    end
     
    initial begin
        clk_in <= 0;
        rd <= 7'b0000000;
    // rd[7] <= 0; rd[6] <= 0; rd[5] <= 0; rd[4] <= 0; rd[3] <= 0; rd[2] <= 0; rd[1] <= 0;
        da <= 0;
        clr_btn <= 0;
        
        #5 clr_btn <= 1;
        #25000000 clr_btn <= 0;
        #2000000  rd[7] <= 1; rd[6] <= 0; rd[5] <= 0; rd[4] <= 0; rd[3] <= 0; rd[2] <= 0; rd[1] <= 1;
        #100 da<=1;

        
        #50000000 $finish;
    end
    
endmodule

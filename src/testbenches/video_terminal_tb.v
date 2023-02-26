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
    
    reg clk;
    reg [7:1] rd;
    reg da;
    reg clr_btn;
    wire vid1;
    wire vid2;
    
    video_terminal DUT (.clk(clk), .rd_in(rd), .da_in(da), .clr_btn(clr_btn), .vid1(vid1), .vid2(vid2));

    always #35 clk = ~clk;
     
    initial begin
        clk <= 0;
        rd <= 7'b0000000;
        da <= 0;
        clr_btn <= 0;
        
        #5 clr_btn <= 1;
        #25000000 clr_btn <= 0;
        #2000000 rd <= 7'b1000001;
        #100 da<=1;

        
        // #50000000 $finish;
        #6000000000 $finish;
    end
    
endmodule

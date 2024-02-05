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
    wire rda;
    wire rda_n;
    reg clr_btn;
    wire vid1;
    wire vid2;
    wire heartbeat;
    
    video_terminal DUT (.clk(clk), .rd(rd), .da(da), .rda_n(rda_n), .clr_btn(clr_btn),
                 .vid1(vid1), .vid2(vid2), .heartbeat(heartbeat));
                 
    assign rda = ~rda_n;

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
        
        @ (negedge rda_n);
        #70 da<=0;

        
        // #50000000 $finish;
        // #6000000000 $finish;
    end
    
endmodule

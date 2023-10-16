`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2023 02:39:17 PM
// Design Name: 
// Module Name: top
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


module top(
    input CLK100MHZ,
    output [7:0] JA,
    input [15:0] sw,
    output [15:0] LED
    );
    
    wire MCLK, ACLK, DisplayCLK;
    
    CLK_SYS UUT(.CLK100MHz(CLK100MHZ),
                .MCLK(MCLK), .ACLK(ACLK), 
                .DisplayCLK(DisplayCLK));           
    drive drive0(.MCLK(MCLK), .ACLK(ACLK),
                 .L(sw[2]), .C(sw[1]), .R(sw[0]),
                 .OverA(sw[13]), .OverB(sw[14]), .OverBat(sw[15]),
                 .EnA(JA[0]), .EnB(JA[4]),
                 .MotorA(JA[2:1]), .MotorB(JA[6:5])
                );
                
    assign JA[7] = 0;
    assign JA[3] = 0;
    assign LED[15:0] = sw[15:0];
endmodule

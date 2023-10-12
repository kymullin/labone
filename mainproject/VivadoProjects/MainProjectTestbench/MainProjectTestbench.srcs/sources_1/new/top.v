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
    output [7:0] JA
    );
    
    CLK_SYS UUT(.CLK100MHz(CLK100MHZ),
                .MCLK(JA[0]), .ACLK(JA[1]), 
                .DisplayCLK(JA[2]));
    assign JA[7:3] = 5'b00000;
endmodule

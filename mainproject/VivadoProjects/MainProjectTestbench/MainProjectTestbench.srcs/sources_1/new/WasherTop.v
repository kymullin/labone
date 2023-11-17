`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2023 05:26:01 PM
// Design Name: 
// Module Name: WasherTop
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
///////////////////////////////////////////////////////////////////////////////////


module WasherTop(
    input CLK100MHZ,
    input [15:0] sw,
    output JA0, JA1, JA2,
    output [15:0] LED
    );
    
    wire MCLK, ACLK, DisplayCLK;
    assign LED = sw;
    assign JA2 = MCLK;
    
    CLK_SYS CLK0(CLK100MHZ, ACLK, MCLK, DisplayCLK);
    WasherPWM PWM0(MCLK, sw[7:0], sw[15:8], JA0, JA1);
    
    
endmodule

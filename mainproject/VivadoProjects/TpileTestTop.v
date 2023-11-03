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
   // output [7:0] JA,
    input [15:0] sw,
    input vauxp6, vauxn6, vp_in, vn_in,
    output [15:0] LED,
    output [3:0] A,
    output [7:0] sseg    
    );
    
    wire MCLK, ACLK, DisplayCLK;
    wire [11:0] digitalTemp;
    wire ready;
    wire [7:0] decimalTemp;
    wire display;
    
    CLK_SYS UUT(
        .CLK100MHz(CLK100MHZ),
        .MCLK(MCLK), 
        .ACLK(ACLK), 
        .DisplayCLK(DisplayCLK)
        );  
        

    XADC_Module U0(
        .CLK(CLK100MHZ), 
        .Vp(vauxp6), 
        .Vn(vauxn6),
        .vp_in(vp_in), 
        .vn_in(vn_in),
        .digitalTemp(digitalTemp), 
        .ready(ready)
        ); 
        
   SSegDriver SSEGDriver0(
        .CLK(CLK100MHZ),
        .CorrectStation(ACLK),
        .digitalTemp(digitalTemp),
        .ready(ready),
        .decimalTemp(decimalTemp),
        .display(display)
        ); 
                
    SSEG_Display SSEG_Display0(
        .displayCLK(DisplayCLK),
        .display(display),
        .decimalTemp(decimalTemp),
        .A(A), .sseg(sseg)
        );
        
    assign LED[15:0] = sw[15:0];
             
    
endmodule

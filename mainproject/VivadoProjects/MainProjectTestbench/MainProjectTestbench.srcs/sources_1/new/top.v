`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2023 04:22:47 PM
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
    input CLK100MHZ, vauxp6, vauxn6, JC5, vp_in, vn_in,
    output JC3, JC4, 
    output [7:0] sseg,
    output [3:0] A,
    output [15:0] LED
    );
    wire MCLK, ACLK, DisplayCLK;
    CLK_SYS CLK(CLK100MHZ, ACLK, MCLK, DisplayCLK);
    stationSystem station(vauxp6, vauxn6, JC5, CLK100MHZ, DisplayCLK,
                          MCLK, ACLK, vp_in, vn_in, JC4, JC3, sseg, A);
    assign LED[15] = ~JC5;
    assign LED[14] = JC3;
    assign LED[5:0] = 0;
    
    assign LED[13:10] = station.matSys.state;
    assign LED[9:8]   = station.matSys.station;
    assign LED[7]     = station.correctStation;
    assign LED[6]     = station.ready;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2023 06:12:02 PM
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
    input CLK100MHZ, sw,
    input JA2, JA3, JA6, JA7,
    input JC0, JC1, JC2, JC5,
    input vauxp6, vauxn6,
    input vp_in, vn_in,
    output JA0, JA1, JA4, JA5,
    output JC3, JC4,
    output [7:0] seg,
    output [3:0] an,
    output [15:0] LED
    );
    
    wire MCLK, ACLK, DisplayCLK;
    wand [12:0] led;
    
    CLK_SYS CLK(CLK100MHZ, ACLK, MCLK, DisplayCLK);
    
    drive Drive(
        .MCLK(MCLK), .ACLK(ACLK),
        .L(JC0), .C(JC1), .R(JC2),
        .OverA(JA2), .UnderA(JA3),
        .OverB(JA6), .UnderB(JA7),
        .MotorA({JA0, JA1}), .MotorB({JA4, JA5})
        );
    
    stationSystem Station(
        .vauxp6(vauxp6), .vauxn6(vauxn6), .vp_in(vp_in), .vn_in(vn_in),
        .MCLK(MCLK), .ACLK(ACLK), .DisplayCLK(DisplayCLK), .CLK100MHZ(CLK100MHZ),
        .stationTrigger(JC5),
        .powerServo(JC4), .controlEM(JC3),
        .sseg(seg), .A(an)
        );       
        
        assign LED[15:13] = {JC0, JC1, JC2}; 
        assign led[12:9]  = Station.matSys.state;
        assign led[12:9]  = {sw,sw,sw,sw};
        
        assign led[8:7] = Station.matSys.station;
        assign led[8:7] = {sw,sw};
        
        assign led[6] = Station.correctStation;
        assign led[6] = sw;
        assign led[5:1] = 0;
        assign led[0] = sw;
        
        assign LED[12:0] = led[12:0];
        
endmodule

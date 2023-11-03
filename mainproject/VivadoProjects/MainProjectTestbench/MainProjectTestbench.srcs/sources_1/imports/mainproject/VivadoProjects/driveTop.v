`timescale 1ns / 1ps
/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 11/3/2023
     Program Name: driveTop
    SubProgram of: movement test
  
    Program Description:
        instantiates modules required for the movement test

    Inputs:
        CLK 100 MHz
        JA7: UnderB
        JA6: OverB
        JA3: UnderA
        JA2: OverA
        sw0: IPSR 
        sw1: IPSC    
        sw2: IPSL    
    
    Outputs:
       JA5: MotorB[0]
       JA4: EnB
       JA1: MotorA[0]
       JA0: EnA
       
       MotorA/B[1]: GND
       
       LED[2:0]

*///-----------------------------------------------------------


module top(
    input CLK100MHZ,
    input JA7, JA6, JA3, JA2, 
    input [15:0] sw,
    output JA5, JA4, JA1, JA0, 
    output [15:0] LED
    );
    
    wire MCLK, ACLK, DisplayCLK;
    
    CLK_SYS UUT(.CLK100MHz(CLK100MHZ),
                .MCLK(MCLK), .ACLK(ACLK), 
                .DisplayCLK(DisplayCLK));           
    drive drive0(.MCLK(MCLK), .ACLK(ACLK),
                 .L(sw[2]), .C(~sw[1]), .R(sw[0]), // invert sw1 to reflect hardware change to IPSC
                 .OverA(JA2), .UnderA(JA3), .OverB(JA6), .UnderB(JA7),
                 .EnA(JA0), .EnB(JA4),
                 .MotorA(JA1), .MotorB(JA5)
                );
                
    assign LED[15:0] = sw[15:0];
endmodule

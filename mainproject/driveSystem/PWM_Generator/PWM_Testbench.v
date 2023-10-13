/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/12/2023
     Program Name: PWM_Testbench.v
    SubProgram of: PWM Generator
  
    Program Description:
        This program runs a simulated testbench of the PWM generator.

*///-----------------------------------------------------------

`include "mainproject\driveSystem\PWM_Generator\PWM_Generator.v"
`timescale 10us/1us // 2 units = 20 uS, rise-to-rise f = 48.8 kHz

module testbench;
    reg MCLK = 0;
    reg [1:0] DriveA = 1, DriveB = 2;
    wire MotorA, MotorB;

    always begin
        #1; MCLK = ~MCLK;
    end

    PWM_Generator UUT(MCLK, DriveA, DriveB, MotorA, MotorB);

    initial begin
        $dumpfile("PWM_Gen.vcd");
        $dumpvars(0, testbench);
        #200; DriveA = 2; DriveB = 0; // change DriveA/B before next PWM cycle
        #300;   // view duty cycle change at new peak
        $finish;
    end
endmodule
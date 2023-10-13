/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/13/2023
     Program Name: drive.v
    SubProgram of: drive system
  
    Program Description:
        This program instantiates submodules from:
            movement system, overcurrent system, PWM generator
        to construct the final drive system.
        Signals from the IPS sensors drive the movement system, which configure
        PWM duty cycles. These PWM signals are controlled by the overcurrent protection
        system to prevent motor and battery overcurrent

    Inputs:
        MCLK -> PWM generator
        ACLK -> Movement system
        IPS L,C,R -> Movement system
        Over A,B, bat -> overcurrent systems
    
    Outputs:
        EnA, EnB -> H-Bridge
        [1:0] MotorA, MotorB -> H-Bridge      

*///-----------------------------------------------------------
`include "mainproject\driveSystem\movementSystem\movement.v"
`include "mainproject\driveSystem\overcurrent\overcurrent.v"
`include "mainproject\driveSystem\PWM_Generator\PWM_Generator.v"

module drive(
    input MCLK, ACLK, L, C, R, OverA, OverB, OverBat,
    output EnA, EnB,
    output [1:0] MotorA, MotorB;
);
    

endmodule
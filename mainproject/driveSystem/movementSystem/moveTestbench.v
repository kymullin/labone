/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/12/2023
     Program Name: moveTestbench.v
    SubProgram of: Movement system
  
    Program Description:
        This program runs a simulated testbench of the 
        massive movement system state machine.     

        Note: Reference move.vcd for visual depiction. The State machine updates on the
            positive edge of ACLK, as well as the driveA/B registers. These registers update
            to the OLD STATE. That is, DriveA and DriveB always update 1 CLK cycle (1 mS) after the state 

*///-----------------------------------------------------------
`include "mainproject\driveSystem\movementSystem\movement.v"
`timescale 100us/100us

module testbench;
    reg ACLK = 0;
    reg [2:0] IPS; // 3 bits: L, C, R
    wire [1:0] DriveA, DriveB; // sent to motor PWM generator

    movement UUT(ACLK, IPS[2], IPS[1], IPS[0], DriveA, DriveB);

    always begin
        #5; ACLK = ~ACLK; // clk period = 2 x (5 x 100 uS) = 1 mS
    end

    initial begin
        $dumpfile("move.vcd");
        $dumpvars(0,testbench);
        IPS = 0; #100;      // OFF   -> Straight     (ST)
        IPS = 3'b100; #50;  // ST    -> Curve Left   (CL)
        IPS = 3'b000; #50;  // CL    -> ST
        IPS = 3'b001; #50;  // ST    -> Curve Right  (CR)
        IPS = 3'b011; #50;  // CR    -> Right 90 deg (R90)
        IPS = 3'b000; #50;  // R90   -> CR   -> ST
        IPS = 3'b101; #50;  // ST    -> Crossover    (Cross)
        IPS = 3'b111; #50;  // Cross -> Cross 90     (C90 - Cross Register <= 1)
        IPS = 3'b000; #50;  // C90   -> R90  -> CR   -> ST
        IPS = 3'b110; #50;  // ST    -> CL   -> Left 90 (L90)
        IPS = 3'b101; #50;  // L90   -> Cl   -> Cross   -> Cross Straight (CST - Cross Register <= 0)
        IPS = 3'b000; #50;  // CST   -> ST
        $finish;
    end
endmodule
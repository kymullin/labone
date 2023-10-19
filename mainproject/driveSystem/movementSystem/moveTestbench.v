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
        IPS = 0; #100;      // 0  ms     OFF   -> Straight     (ST)                                               
        IPS = 3'b100; #50;  // 10 ms     ST    -> Curve Left   (CL)                                               
        IPS = 3'b000; #50;  // 15 ms     CL    -> ST                                                               
        IPS = 3'b001; #50;  // 20 ms     ST    -> Curve Right  (CR)
        IPS = 3'b011; #50;  // 25 ms     CR    -> Right 90 deg (R90)
        IPS = 3'b000; #50;  // 30 ms     R90   -> CR   -> ST
        IPS = 3'b101; #50;  // 35 ms     ST    -> Crossover    (Cross)
        IPS = 3'b111; #50;  // 40 ms     Cross -> Cross 90     (C90 - Cross Register <= 1)
        IPS = 3'b000; #50;  // 45 ms     C90   -> R90  -> CR   -> ST
        IPS = 3'b110; #50;  // 50 ms     ST    -> CL   -> Left 90 (L90)
        IPS = 3'b101; #50;  // 55 ms     L90   -> Cl   -> Cross   -> Cross Straight (CST - Cross Register <= 0)
        IPS = 3'b000; #50;  // 60 ms     CST   -> ST
        $finish;
    end
endmodule
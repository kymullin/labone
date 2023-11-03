/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/13/2023
     Program Name: overcurrent_Testbench.v
    SubProgram of: overcurrent protection module
  
    Program Description:
        This program runs a simulated testbench of the 
        overcurrent protection system.

    Notes:
        Revision 2.0 - updated initial block to reflect state machine for Enx

*///-----------------------------------------------------------

`include "mainproject\driveSystem\overcurrent\overcurrent.v"

module testbench;
    reg PWM = 0;
    reg Overx = 0, Underx = 0;
    wire EnA;
    wire [1:0] Motorx;

    overcurrent UUT(PWM, Overx, Underx, EnA, Motorx);

    always begin
        #5; PWM = 1; # 5; PWM = 0;
    end

    initial begin
       $dumpfile("Overcurrent Protection.vcd");
       $dumpvars(0, testbench);
       #10; Overx = 1;
       #10; Underx = 1;
       #10; Overx = 0;
       #10; Underx = 0;
       #10; $finish;
    end
endmodule
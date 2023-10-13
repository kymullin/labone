/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/13/2023
     Program Name: overcurrent_Testbench.v
    SubProgram of: overcurrent protection module
  
    Program Description:
        This program runs a simulated testbench of the 
        overcurrent protection system.

*///-----------------------------------------------------------

`include "mainproject\driveSystem\overcurrent\overcurrent.v"

module tesetbench;
    reg PWM = 0;
    reg Overx = 0, OverBat = 0;
    wire EnA;
    wire [1:0] Motorx;

    overcurrent UUT(PWM,Overx,OverBat, EnA, Motorx);

    initial begin
        $display("PWM Overx OverBat | EnA Motorx");
        $display("P x B | E M");
        $display("------|----");
        $monitor("%b %b %b | %b %d", PWM, Overx, OverBat, EnA, Motorx);
        
        for (integer i = 0; i < 8; i = i + 1) begin
            {PWM, Overx, OverBat} = i[2:0]; #2;
        end
    end
endmodule
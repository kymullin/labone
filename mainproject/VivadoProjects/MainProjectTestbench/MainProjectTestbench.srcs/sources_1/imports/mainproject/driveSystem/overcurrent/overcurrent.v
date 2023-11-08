/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/13/2023
     Program Name: overcurrent.v
    SubProgram of: overcurrent protection module
  
    Program Description:
        overcurrent transfers PWMx signal from PWM Generator to the H-Bridge
        If motor or battery overcurrent detected, disable motor signal

    Inputs:
        PWMx - from PWM generator
        Overx - from hardware overcurrent protection
        OverBat - from hardware overcurrent protection
    
    Outputs:
        Enx - enables motorX signals on H-Bridge
        Motorx - motor signals sent to H-Bridge     

    Notes:
        Revision 2.0 - Removed OverBat, as no active system used
        Added UnderX, as motor OC uses comparators, not Schmitt Triggers
        Enx is a state machine - reflect comparator use
        Motorx is now 1 bit, in 2,4 are GND

*///-----------------------------------------------------------

module overcurrent(
    input clk, 
    input [1:0] PWMx, 
    input Overx, Underx,
    //output reg Enx = 1,
    output [1:0] Motorx
);
    reg Enable = 1;
    assign Motorx = (Enable == 1) ? PWMx : 0;
    always @(posedge clk) begin
        Enable <= ~Overx & Enable | ~Overx & Underx;
    end
endmodule
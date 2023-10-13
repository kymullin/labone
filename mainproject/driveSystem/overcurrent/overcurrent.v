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
        Motorx [1:0] - motor signals sent to H-Bridge      

*///-----------------------------------------------------------

module overcurrent(
    input PWMx, Overx,OverBat,
    output Enx,
    output [1:0] Motorx
);
    assign Motorx[1] = 0;
    assign Motorx[0] = PWMx;
    assign Enx = ~Overx & ~OverBat;
endmodule
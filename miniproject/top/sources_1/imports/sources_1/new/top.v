/*-------------------------------------------------------------
    Project Lab 1 - Mini Motor Project
       Program by: Zachary Bonneau
    Creation Date: 09/13/2023
     Program Name: top.v
    SubProgram of: N/A

    includes:
        PWM_Block.v
        SSEG_Board.v
  
    Program Description:
    This program combines the subsystems of th mini-motor project

    Inputs:
        SW[7:0] - 8 onboard switches to control direction
        OVERCURRENT_SET     - Current exceeds 1Amp in motor A
        OVERCURRENT_RESET   - Current in motor A below 750 mA
        CLK_100MHz          - system clock
    
    Outputs:
        SSEG [6:0]
        dp
        Anode [3:0]
        Motor_Out [1:0] - 0: Forward, 1: Backward
        LED [7:0] - LED[i] = sw[i]  

    Internal Signals
        E - from PWM.TCR
        PWM_OUT - from PWM.OUT_Block
        snsA    - from MotorControl
*/

module top(
    input [7:0] sw,
    input CLK_100MHz,
    input Over1, Under750,
    
    output [1:0] Motor_Out,
    output EnableA,
    output [6:0] seg,
    output dp,
    output [3:0] Anode,
    output [7:0] LED
    );
    
    wire E;
    wire CLK;
    wire PWM_OUT;
    wire SnsA;
    
    CLK_DIV      CLK0(CLK, CLK_100MHz);
    PWM_Block    PWM0(PWM_OUT, E, sw[6:0], CLK);
    SSEG_Block   SSEG0(seg, Anode, dp, sw[7], E, SnsA);
    motorcontrol MC0(Motor_Out[0], Motor_Out[1], SnsA, PWM_OUT, sw[7], Over1, Under750, CLK);
    
    assign LED[0] = SW[0];
    assign LED[1] = SW[1];
    assign LED[2] = SW[2];
    assign LED[3] = SW[3];
    assign LED[4] = SW[4];
    assign LED[5] = SW[5];
    assign LED[6] = SW[6];
    assign LED[7] = sw[7];  
    assign EnableA = 1; // motor always enabled
    
        
endmodule






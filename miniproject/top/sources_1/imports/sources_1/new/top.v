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
        Motor_Out [1:0] - 0 = Forward, 1 = Backward
        LED [7:0] - LED[i] = 1 when sw[i] = 1    

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
    
    PWM_Block PWM0(PWM_OUT, E, LED[6:0], CLK, sw[6:0], CLK_100MHz);
    SSEG_Block SSEG0(seg, Anode, dp, sw[7], E, SnsA);
    motorcontrol(Motor_Out[0], Motor_Out[1], SnsA, PWM_OUT, sw[7], Over1, Under750, CLK);
    
    assign LED[7] = sw[7];  
    assign CLK_OUT = CLK; 
    assign EnableA = 1; // motor always enabled
    
        
endmodule






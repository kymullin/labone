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
        Motor_Out [1:0]
        LED [7:0] - LED[i] = 1 when sw[i] = 1    

    Internal Signals
        E - from PWM.TCR
        PWM_OUT - from PWM.OUT_Block
        snsA    - from MotorControl
*/
//`include "C:\Users\Zack\Mini-motor_Project\Mini-motor_Project.srcs\sources_1\imports\miniproject\PWM_SYS\Board_Test\PWM_Block.v"
//`include "C:\Users\Zack\Mini-motor_Project\Mini-motor_Project.srcs\sources_1\imports\miniproject\SSEG_SYS\Board_Test\SSEG_Board.v"

module top(Motor_Out, seg, dp, Anode, LED, sw, CLK_100MHz, SnsA);

    input [7:0] sw;
    input CLK_100MHz;
    input SnsA; // simulated input as sw 15
    
    output Motor_Out;
    output [6:0] seg;
    output dp;
    output [3:0] Anode;
    output [7:0] LED;
    
    wire E;
    
    PWM_Block PWM0(Motor_Out, E, LED[6:0], sw[6:0], CLK_100MHz);
    SSEG_Block SSEG0(seg, Anode, dp, sw[7], E, SnsA);
    
    assign LED[7] = sw[7];   
    
        
endmodule






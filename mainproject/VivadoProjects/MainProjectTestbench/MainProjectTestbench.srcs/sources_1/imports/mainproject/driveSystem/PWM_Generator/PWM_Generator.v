/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/12/2023
     Program Name: PWM_Generator.v
    SubProgram of: PWM Generator
  
    Program Description:
        PWM Generator constructs 2 PWM signals. The duty cycle for PWMx
        is determined by Drivex, a control signal configured by the movement 
        system. See the section in the project notebook concerning the PWM
        generator for a detailed block diagram and further notes on each submodule

    Inputs:
        CLK - MCLK (48.8 kHz) used for PWM generator
        [1:0] DriveA/B - control signals from movement system | sets duty cycle for PWM A/B
    
    Outputs:
       motor A/B - PWM signal line for motor A/B

    Internal Signals:
        [6:0] TCR  - timer counter value used for reference in output
        [6:0] CCRx - compare value used for reference in output
        E          - starts next PWM cycle

*///-----------------------------------------------------------


module PWM_Generator(
    input CLK,
    input [1:0] DriveA, DriveB,
    output MotorA, MotorB
);
    wire E;
    wire [6:0] TCR, CCRA, CCRB;

    TimerCounter TC(CLK, TCR, E);
    Comparex CCA(DriveA, E, CCRA);
    Comparex CCB(DriveB, E, CCRB);
    Outputx  OutA(CLK, E, TCR, CCRA, MotorA);
    Outputx  OutB(CLK, E, TCR, CCRB, MotorB);

endmodule

//----------------------------------------
/*  
    Timer Counter (TC)
        TC is a simple counter. It counts from 0-127, then overflows
        E is a synchronization signal. It is true iff TC == 0
*/
module TimerCounter(
    input CLK,
    output reg [6:0] TCR = -5,
    output reg E = 0
 );
    always@(negedge CLK) begin
        TCR = TCR+1;
        case (TCR)
            0: E <= 1;
            default: E <= 0; // all other cases, E = 0
        endcase
    end
endmodule

//----------------------------------------
/*  
    Comparex
        Comparex is a simple register. It holds the value determined by 
        Drivex (A/B). This value is compared against the TCR to determine 
        when to deactivate the PWM signal.
            Drivex  | CCRx
            --------|-----
                0   | 0
                1   | 64 (50%)
                2   | 96 (75%)
                3   | 64 (50% - reserved for reverse motor)
*/
module Comparex(
    input [1:0] Drivex,
    input E,
    output reg [6:0] CCRx = 0
 );
    always@(posedge E) begin
        case (Drivex) 
            0: CCRx = 0;
            1: CCRx = 64;
            2: CCRx = 96;
            3: CCRx = 64;
        endcase
    end
endmodule

//----------------------------------------
/*  
    Outputx
        Outputx configures the PWM A/B signal according to a few simple rules:
            turn on when  E = 1
            turn off when R = 1
            give precedence to R

            R = 1 when TCR == CCRx
*/

module Outputx(
    input CLK,
    input E,
    input [6:0] TCR, CCRx,
    output reg Motorx = 0
 );
    reg R = 0;

    always@(posedge CLK) begin
        R <= ~(TCR[0] ^ CCRx[0] | TCR[1] ^ CCRx[1] | TCR[2] ^ CCRx[2]
             | TCR[3] ^ CCRx[3] | TCR[4] ^ CCRx[4] | TCR[5] ^ CCRx[5] 
             | TCR[6] ^ CCRx[6]);
       //R = ~R;
    end

    always@(negedge CLK) begin
        Motorx <= ~R & (Motorx | E);
    end

endmodule
/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 11/1/2023
     Program Name: WasherPWM
    SubProgram of: Station System
  
    Program Description:
        Drives PWM signals for electromagnet and servo motor

    Inputs:
        MCLK - timing clock
        controlEM    - drives electromagnet
        controlServo - drives servo motor
    
    Outputs:  
        powerEM     - powers electromagnet via digital hardware switch
        powerServo  - powers servo motor

*///-----------------------------------------------------------

// module code here
module WasherPWM(
    input CLK, controlServo,
    output powerServo);

    reg  [9:0] CCRServo = 0;
    wire [9:0] TCR;
    wire E;

    localparam [9:0] ServoUP   = 75,  // 0 deg
                     ServoDOWN = 68;  // -15 deg 


    always @(posedge E) begin
        case (controlServo)
            0: CCRServo = ServoUP;
            1: CCRServo = ServoDOWN;
        endcase
    end

    WasherTC TCR0(CLK, TCR, E);
    WasherOut ServoMotorOUT   (CLK, E, TCR, CCRServo, powerServo);

endmodule

module WasherTC(
    input CLK,
    output reg [9:0] TCR = -1,
    output reg E = 0
 );
    always@(negedge CLK) begin
        TCR <= TCR+1;
        case (TCR)
            0: E <= 1;
            975: TCR <= 0;
            default: E <= 0; // all other cases, E = 0
        endcase
    end
endmodule

module WasherOut(
    input CLK,
    input E,
    input [9:0] TCR, CCR,
    output reg out = 0
 );
    reg R = 0;

    always@(posedge CLK) begin
        case (TCR - CCR)
            0: R <= 1;
            default: R <= 0;
        endcase
    end

    always@(negedge CLK) begin
        out <= ~R & (out | E);
    end

endmodule
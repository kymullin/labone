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
    input CLK, controlEM, controlServo,
    output powerEM,
    output powerServo
    );

    reg  [9:0] CCREM = 0, CCRServo = 0;
    wire [9:0] TCR;
    wire E;

    localparam [9:0] EM_OFF    = 0,
                     EM_ON     = 100, // placeholder
                     ServoUP   = 50,  // placeholder (-90 deg)
                     ServoDOWN = 100; // placeholder  (90 deg)


    always @(posedge E) begin
        case ({controlEM, controlServo})
            2'b00: begin CCREM <= EM_OFF; CCRServo <= ServoDOWN; end
            2'b01: begin CCREM <= EM_OFF; CCRServo <= ServoUP;   end
            2'b10: begin CCREM <= EM_ON;  CCRServo <= ServoDOWN; end
            2'b11: begin CCREM <= EM_ON;  CCRServo <= ServoUP;   end
        endcase
    end

    WasherTC TCR0(CLK, TCR, E);
    WasherOut ElectromagnetOUT(CLK, E, TCR, CCREM,       powerEM);
    WasherOut ServoMotorOUT   (CLK, E, TCR, CCRServo, powerServo);

endmodule

module WasherTC(
    input CLK,
    output reg [9:0] TCR = 0,
    output reg E = 0
 );
    always@(negedge CLK) begin
        TCR = TCR+1;
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
        out <= ~R & (Motorx | E);
    end

endmodule
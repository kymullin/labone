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

module TimerCounter(
    input CLK,
    output reg [6:0] TCR = -5,
    output reg E = 0
 );
    always@(negedge CLK) begin
        TCR = TCR+1;
        case (TCR)
            0: E <= 1;
            default: E <= 0;
        endcase
    end
endmodule

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
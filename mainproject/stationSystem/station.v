/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 11/26/2023
     Program Name: station.v
    SubProgram of: stationSystem
  
    Program Description:
        Combines all of the modules of the Station System
            Includes material system, 7Segment, XADC, and WasherPWM

    Inputs:
        vaux6 - XADC analog input differential pair connected to JXADC [0,4]
        stationTrigger - KY-032 signal output
        CLK100MHZ - drives 7-segment driver
        DisplayCLK - drives 7-segment multiplexer
        MCLK - drives Washer PWM Generators
        vp - reference voltages for XADC
    
    Outputs:
       PowerServo - PWM signal sent to Servo
       controlEM  - controls Electromagnet MOSFET
       sseg [6:0] - 7-segment cathodes
       A [3:0]    - 7-Segment Anodes

*///-----------------------------------------------------------

// directive calls

// module code here
module stationSystem(
    input  vauxp6, vauxn6, stationTrigger, CLK100MHZ, DisplayCLK, MCLK, ACLK, vp_in, vn_in,
    output powerServo, controlEM, 
    output [7:0] sseg,
    output [3:0] A
);
    wire [11:0] digitalTemp;
    wire correctStation, display, controlServo, ready;
    wire [7:0] decimalTemp;

    XADC_Module XADC0(
        .CLK(CLK100MHZ), 
        .Vp(vauxp6), 
        .Vn(vauxn6),
        .vp_in(vp_in), 
        .vn_in(vn_in),
        .digitalTemp(digitalTemp), 
        .ready(ready)
        );

    SSegDriver SSEGDriver0(
        .CLK(CLK100MHZ),
        .CorrectStation(correctStation),
        .digitalTemp(digitalTemp),
        .ready(ready),
        .decimalTemp(decimalTemp),
        .display(display)
        ); 

    SSEG_Display SSEG_Display0(
        .displayCLK(DisplayCLK),
        .display(display),
        .decimalTemp(decimalTemp),
        .A(A), .sseg(sseg)
        );

    materialSystem matSys(
        .CLK(ACLK),
        .trigger(stationTrigger),
        .digitalTemp(digitalTemp),
        .ready(ready),
        .correctStation(correctStation),
        .controlEM(controlEM),
        .controlServo(controlServo)
        );

    WasherPWM WasherPWM(
        .CLK(MCLK),
        .controlServo(controlServo),
        .powerServo(powerServo)
        );

endmodule
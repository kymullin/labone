/*-------------------------------------------------------------
    Project Lab 1 - Mini Motor Project
       Program by: Kyle Mullins
    Creation Date: 09/07/2023
     Program Name: motorcontrol.v
    SubProgram of: N/A
  
    Program Description:
    motorcontrol.v acts as a single point of communication between the basys board and the H-Bridge


    Revision 2.0:
    Incorporated Current Detection and overcurrent protection to module

    Inputs:
        PWM_OUT
        SW7
        Over1 - Current through motor A exceeds 1 Amp
        Under750 - Current through motor A below 750 mA
        CLK - Clock source from PWM_SYSTEM
    
    Outputs:
        Forward
        Backward
        SnsA - sent to SSEG_Block
*/

module motorcontrol(
    output Forward,
    output Backward,
    output SnsA,
    input PWM_OUT,
    input SW7,
    input Over1,
    input Under750,
    input CLK);

    // primary module for motor control system
    wire MotorOut;

    CurrentProtection P0(MotorOut, PWM_OUT, Over1, Under750, CLK);

    assign Forward = ~SW7 & MotorOut;
    assign Backward = SW7 & MotorOut;

    assign SnsA = Over1;
endmodule


module CurrentProtection(
    output MotorOut,
    input  PWM_OUT,
    input  Over1,
    input  Under750,
    input CLK);

    // Simple state machine. Stops motor power if overcurrent detected
    // Resets motor power after current drops below 750 mA

    reg PowerStop = 0;

    always@(posedge CLK) begin
        PowerStop <= Over1 | PowerStop & ~Under750;
        
    end
    assign MotorOut = PWM_OUT & ~PowerStop;

endmodule


module testbench;
    reg PWM = 1;
    reg SW  = 0;
    reg Over1 = 0;
    reg Under750 = 1;
    reg CLK = 0;
    
    wire Forward, Backward, SnsA;

    motorcontrol UUT(Forward, Backward, SnsA, PWM, SW, Over1, Under750, CLK);

    always begin
        #1; CLK = ~CLK;
    end

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, testbench);
        #10;
        PWM = 0; Under750 = 0;
        #5;
        PWM = 1;
        #4;
        Over1 = 1;
        #3;
        Over1 = 0;
        #2;
        Under750 = 1;
        #10;
        SW = 1;
        #10;
        $finish;
    end
endmodule
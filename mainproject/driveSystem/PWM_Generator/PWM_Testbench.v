`include "mainproject\driveSystem\PWM_Generator\PWM_Generator.v"
`timescale 10us/1us // 2 units = 20 uS, rise-to-rise f = 48.8 kHz

module testbench;
    reg MCLK = 0;
    reg [1:0] DriveA = 1, DriveB = 2;
    wire MotorA, MotorB;

    always begin
        #1; MCLK = ~MCLK;
    end

    PWM_Generator UUT(MCLK, DriveA, DriveB, MotorA, MotorB);

    initial begin
        $dumpfile("PWM_Gen.vcd");
        $dumpvars(0, testbench);
        #200; DriveA = 2; DriveB = 0;
        #300;
        $finish;
    end
endmodule
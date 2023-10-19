/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/18/23
     Program Name: 7SegDriverTestbench.v
    SubProgram of: Station System
  
    Program Description:
        This runs a simulated testbench of the 7-segment driver.      

*///-----------------------------------------------------------

// directive calls
`include "mainproject\stationSystem\7SegmentDriver\7SegDriver.v"
`timescale 1ns/1ns

// module code here
module testbench;
    reg CLK = 0;
    reg CorrectStation = 0;
    reg [11:0] digitalTemp = 362;
    wire [7:0] decimalTemp;
    wire display;

    SSegDriver UUT(CLK, CorrectStation, digitalTemp, decimalTemp, display);

    always begin
        #5; CLK = ~CLK;
    end

    initial begin
        $dumpfile("7SegDriver.vcd");
        $dumpvars(0, testbench);
        #40; CorrectStation = 1;                 // convert 362 -> 5
        #1000;
        CorrectStation = 0; digitalTemp = 1379; // convert 1379 -> 20

        #40; CorrectStation = 1;
        #1000;
        CorrectStation = 0; digitalTemp = 1718; // convert 1718 -> 25

        #40; CorrectStation = 1;
        #110;
        CorrectStation = 0; digitalTemp = 2395; // convert 2395 -> 35

        #40; CorrectStation = 1; // demonstrate that Conversion is isolated 
        #1000;                   // from fast oscillation of correctStation
        CorrectStation = 0;

        #40; CorrectStation = 1;
        #1000;

        $finish;
    end

endmodule
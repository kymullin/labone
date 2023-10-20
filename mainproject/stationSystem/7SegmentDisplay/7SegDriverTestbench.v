/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/20/2023
     Program Name: 7SegDriverTestbench.v
    SubProgram of: Station System
  
    Program Description:
        Runs a simulated testbench of 7 Segment Display

*///-----------------------------------------------------------

// directive calls
`include "mainproject\stationSystem\7SegmentDisplay\7SegDisplay.v"

module testbench();
    reg displayCLK = 0;
    reg display = 0;
    reg [7:0] decimalTemp = 8'h01;
    wire [3:0] A;
    wire [7:0] sseg;

    SSEG_Display UUT(displayCLK, display,
                     decimalTemp, A, sseg);
    
    always begin
        #1; displayCLK = ~displayCLK;
    end

    initial begin
        $dumpfile("7SegDisplay.vcd");
        $dumpvars(0, testbench);
        #8; display = 1;
        #8; decimalTemp = 8'h23;
        #8; decimalTemp = 8'h45;
        #8; decimalTemp = 8'h67;
        #8; decimalTemp = 8'h89;
        #8; decimalTemp = 8'hAB;
        #8; decimalTemp = 8'hCD;
        #8; decimalTemp = 8'hEF;
        #8; display = 0;
        #8;
        $finish;
    end
endmodule
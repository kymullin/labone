/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/29/2023
     Program Name: MaterialSystemTest.v
    SubProgram of: Station System
  
    Program Description:
        Runs simulated testbench of material system       
*///-----------------------------------------------------------

// directive calls
`include "mainproject\\stationSystem\\MaterialSystem\\MaterialSystem.v"
`timescale 100us/100us

// module code here
module testbench();
    reg ACLK = 0;
    reg trigger = 0;
    reg [11:0] digitalTemp = 25*68; // 25 C
    reg ready = 1; // XADC always ready
    wire enable, correct, control;

    materialSystem UUT(ACLK, trigger, digitalTemp, ready, enable, correct, control);

    localparam PRD = 10; // 10 * timescale = 1 ms

    always #(PRD/2) begin
        ACLK = ~ACLK;
    end

    initial begin
        $dumpfile("materialSystem.vcd");
        $dumpvars(0, testbench);
        #(PRD*5);
        trigger = 1; // start delay 1
        #(PRD*2);
        trigger = 0;
        #(PRD*605); // delay1 -> ... -> PICKUP -- w/ correct station
        trigger = 1;
        #(PRD*1); // IDLE
        #(PRD*200) // test wrong station (@ ~700 ms)
        digitalTemp = 68*40; // 40 C
        #(PRD*800);
        $finish;
    end

endmodule
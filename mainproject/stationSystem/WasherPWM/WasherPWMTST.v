/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 
     Program Name: 
    SubProgram of: 
  
    Program Description:
*///-----------------------------------------------------------

// directive calls
`include "mainproject\\stationSystem\\WasherPWM\\WasherPWM.v"
`timescale 10us/10us


// module code here
module WasherTST();
    reg MCLK = 0;
    reg controlServo = 0;
    wire powerEM, powerServo;

    parameter PRD = 2;

    always#(PRD/2) begin
        MCLK = ~MCLK;
    end

    WasherPWM UUT(MCLK, controlServo, powerServo);

    initial begin
        $dumpfile("Washer.vcd");
        $dumpvars(0, WasherTST);
        #(PRD*900); 
        controlServo = 1;
        #(PRD*900);
        $finish;
    end

endmodule
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
    reg [11:0] digitalTemp = 25*SCALE; // 25 C
    reg ready = 1; // XADC always ready
    wire correct, controlEM, controlServo;

    materialSystem UUT(ACLK, trigger, digitalTemp, ready, correct, controlEM, controlServo);

    localparam PRD = 10; // 10 * timescale = 1 ms
    localparam SCALE = 68;

    integer temps [0:2]; 
     

    always #(PRD/2) begin
        ACLK = ~ACLK;
    end

    initial begin
        $dumpfile("materialSystem.vcd");
        $dumpvars(0, testbench);
        temps[0] = 25;
        temps[1] = 15;
        temps[2] = 39;
       
        #(PRD * 5);


        for (integer i = 0; i < 3; i = i+1) begin
        digitalTemp = temps[i] * SCALE;

        // Station Found - read temp (correct)
        trigger = 1;
        #(PRD*5);
        
        // leave dropoff
        trigger = 0;
        #(PRD * 25);

        // Pickup Found - (drop servo)
        trigger = 1;
        #(PRD * 5);

        // Leave Pickup
        trigger = 0;
        #(PRD * 50);
        end

        $finish;
    end

endmodule
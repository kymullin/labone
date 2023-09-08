/*-------------------------------------------------------------
    Project Lab 1 - Mini Motor Project
       Program by: Zachary Bonneau
    Creation Date: 09/06/2023
     Program Name: SSEG_Block.v
    SubProgram of: 7 Segment System

    includes:
        T-FF.v
  
    Program Description:
    SSEG_Block reads SW7 and SnsA to configure the 7 segment values accordingly. 
    PWM::TCR.E controls the multiplexing FF ASEL 

    Inputs:
        PWM::TCR.E (E)
        SW7
        SnsA
    
    Outputs:
        Anode1
        Anode2
        SSEG_Data [6:0]

    Internal Signals
        ASEL - multiplexing control and anode selection bit
        SW7_SSEG_DAT  - SSEG config for Digit 1
        SnsA_SSEG_DAT - SSEG config for Digit 2
*/

`include "\Project_Lab_1\Mini_Motor\T-FF.v"

module SSEG_Block(SSEG_Data, Anode1, Anode2, SW7, E, SnsA);
    // SSEG_Block connects inputs, outputs, and internal signals within the 7 Segment Block
    // see 7 Segment Block Diagram for details

    input SnsA, E, SW7;
    output Anode1, Anode2;
    output [6:0] SSEG_Data;

    wire ASEL;
    wire [6:0] SW7_SSEG_DAT;
    wire [6:0] SnsA_SSEG_DAT;

    ASEL FF0(ASEL, Anode1, Anode2, E);
    SW7_Logic L0(SW7_SSEG_DAT,    SW7);
    SnsA_Logic L1(SnsA_SSEG_DAT, SnsA);
    SSEG_MPX MPX0(SSEG_Data, SW7_SSEG_DAT, SnsA_SSEG_DAT, ASEL);

endmodule

module ASEL(ASEL, Anode1, Anode2, CLK);
    // ASEL contains a pos-edge T-FF that sets which anode/SSEG configuration to use
    input CLK;
    output Anode1;
    output Anode2;
    output ASEL;

    TFF_POS FF0(ASEL, CLK);

    assign Anode1 = ~ASEL;
    assign Anode2 =  ASEL;
endmodule

module SW7_Logic(SW7_SSEG_DAT, SW7);
    // SW7_Logic reads SW7 and sends SSEG configuration to SSEG_MPX
    // SW7_SSEG_DAT[0] = a, [6] = g
    input SW7;
    output [6:0] SW7_SSEG_DAT;

    assign SW7_SSEG_DAT[0] = SW7;
    assign SW7_SSEG_DAT[1] = 1;
    assign SW7_SSEG_DAT[2] = ~SW7;
    assign SW7_SSEG_DAT[3] = ~SW7;
    assign SW7_SSEG_DAT[4] = 0;
    assign SW7_SSEG_DAT[5] = 0;
    assign SW7_SSEG_DAT[6] = 0;
endmodule

module SnsA_Logic(SnsA_SSEG_DAT, SnsA);
    // SnsA_Logic reads SnsA and sends SSEG configuration to SSEG_MPX
    // SnsA_SSEG_DAT[0] = a, [6] = g
    input SnsA;
    output [6:0] SnsA_SSEG_DAT;

    assign SnsA_SSEG_DAT[0] = 1;
    assign SnsA_SSEG_DAT[1] = 1;
    assign SnsA_SSEG_DAT[2] = ~SnsA;
    assign SnsA_SSEG_DAT[3] = ~SnsA;
    assign SnsA_SSEG_DAT[4] = ~SnsA;
    assign SnsA_SSEG_DAT[5] = 1;
    assign SnsA_SSEG_DAT[6] = ~SnsA;
endmodule

module SSEG_MPX(SSEG_Data, SW7_SSEG_DAT, SnsA_SSEG_DAT, ASEL);
    // SSEG_MPX is a simple multiplexer that selects which SSEG configuration to send
    input [6:0] SW7_SSEG_DAT;
    input [6:0] SnsA_SSEG_DAT;
    input ASEL;

    output [6:0] SSEG_Data;

    assign SSEG_Data[0] = ~ASEL & SW7_SSEG_DAT[0] | ASEL & SnsA_SSEG_DAT[0];
    assign SSEG_Data[1] = ~ASEL & SW7_SSEG_DAT[1] | ASEL & SnsA_SSEG_DAT[1];
    assign SSEG_Data[2] = ~ASEL & SW7_SSEG_DAT[2] | ASEL & SnsA_SSEG_DAT[2];
    assign SSEG_Data[3] = ~ASEL & SW7_SSEG_DAT[3] | ASEL & SnsA_SSEG_DAT[3];
    assign SSEG_Data[4] = ~ASEL & SW7_SSEG_DAT[4] | ASEL & SnsA_SSEG_DAT[4];
    assign SSEG_Data[5] = ~ASEL & SW7_SSEG_DAT[5] | ASEL & SnsA_SSEG_DAT[5];
    assign SSEG_Data[6] = ~ASEL & SW7_SSEG_DAT[6] | ASEL & SnsA_SSEG_DAT[6];
endmodule

module testbench;
    // testbench configures and tests SSEG_Block, and creates the waveform output
    reg SW7 = 0;
    reg E = 0;
    reg SnsA = 0;

    wire [6:0] SSEG_Data;
    wire Anode1, Anode2;

    SSEG_Block UUT(SSEG_Data, Anode1, Anode2, SW7, E, SnsA);

    initial begin
        $dumpfile("SSEG_waveform.vcd");
        $dumpvars(0, testbench);
        #5; E = 1; #2; E = 0;       // test ASEL FF for E pulse
        #3;
        SnsA = 1; #3; SnsA = 0;     // test SSEG configuration for SnsA = 0, SnsA = 1
        #2; 
        E = 1; # 2; E = 0;          // toggle ASEL = 0 (SW7 configuration)
        #3;
        SW7 = 1; #3; SW7 = 0;       // test SSEG configuration for SW = 0, SW7 = 1
        #2;
        $finish;
    end
endmodule
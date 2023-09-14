/*-------------------------------------------------------------
    Project Lab 1 - Mini Motor Project
       Program by: Zachary Bonneau
    Creation Date: 09/13/2023
     Program Name: SSEG_Board.v
    SubProgram of: 7 Segment System

    includes:
        T-FF.v
  
    Program Description:
    This program Tests the functionality of the 
    7Segment Display on the Basys board. 
    Control signals are replicated by onboard switches.

    Inputs:
        PWM::TCR.E (E)  (sw2)
        SW7             (sw7)
        SnsA            (sw0)
    
    Outputs:
        Anode1
        Anode2
        SSEG_Data [6:0]
        
        Anode3/4 are configured only so that they are set off at all times

    Internal Signals
        ASEL - multiplexing control and anode selection bit
        SW7_SSEG_DAT  - SSEG config for Digit 1
        SnsA_SSEG_DAT - SSEG config for Digit 2
*/

module SSEG_Block(SSEG_Data, Anode, dp, SW7, E, SnsA);
    // SSEG_Block connects inputs, outputs, and internal signals 
    // within the 7 Segment Block. See 7 Segment Block Diagram for details

    input SnsA, E, SW7;
    output [3:0] Anode;
    output dp;
    output [6:0] SSEG_Data;

    wire ASEL;
    wire [6:0] SW7_SSEG_DAT;
    wire [6:0] SnsA_SSEG_DAT;
    
    assign dp = 1;

    ASEL FF0(ASEL, Anode, E);
    SW7_Logic L0(SW7_SSEG_DAT,    SW7);
    SnsA_Logic L1(SnsA_SSEG_DAT, SnsA);
    SSEG_MPX MPX0(SSEG_Data, SW7_SSEG_DAT, SnsA_SSEG_DAT, ASEL);

endmodule

module TFF_POS(T, CLK);
    // positive edge TFF - Copied from T-FF.v
    input CLK;
    output reg T = 0;

    always@(posedge CLK) begin
        // flip T on rising edge
        T = ~T;
    end
endmodule

module ASEL(ASEL, Anode, CLK);
    // ASEL contains a pos-edge T-FF that sets 
    // which anode/SSEG configuration to use
    
    // Anode converted to 4 bit output to set 2/3 off
    input CLK;
    output [3:0] Anode;
    output ASEL;

    TFF_POS FF0(ASEL, CLK);
    //assign ASEL = CLK;

    assign Anode[0] =  ASEL;
    assign Anode[1] = ~ASEL;
    assign Anode[2] = 1;
    assign Anode[3] = 1;
endmodule

module SW7_Logic(SW7_SSEG_DAT, SW7);
    // SW7_Logic reads SW7 and sends SSEG 
    // configuration to SSEG_MPX
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
    // SnsA_Logic reads SnsA and sends SSEG 
    // configuration to SSEG_MPX
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
    // SSEG_MPX is a simple multiplexer that selects 
    // which SSEG configuration to send
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

/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/20/2023
     Program Name: 7SegDisplay.v
    SubProgram of: Station System
  
    Program Description:
        7 Segment Display configures the anodes and cathodes of the 
        Basys3 board 7 Segment Display.

    Inputs:
        DisplayCLK - 381 Hz clock for multiplexing
        decimalTemp - 8-bit BCD value of temperature
        display - enables/disables entire display module
    
    Outputs:
        A [3:0] - 4 anodes for 4 digits of 7-seg display
        sseg [7:0] - 8 bit configuration for 7 segments + decimal point (dp)      

    Internal Signals:
        ASEL [1:0] - Anode select register, chooses between A0 - A3

*///-----------------------------------------------------------

module SSEG_Display(
    input displayCLK, display,
    input [7:0] decimalTemp,
    output [3:0] A,
    output reg [7:0] sseg = 8'hFF
    );

    //----------------------------
    // ASEL code block

    reg [1:0] ASEL = 0; 

    always@(posedge displayCLK) begin
        ASEL = ASEL + 1;
    end

    //----------------------------
    // digit 3-0 code block
    // digits 3, 2 use digitDriver modules

    wire [7:0] SSEG3, SSEG2;

    digitDriver Digit3(decimalTemp[7:4], SSEG3);
    digitDriver Digit2(decimalTemp[3:0], SSEG2);

    reg [7:0] SSEG1 = 8'b11111111; // blank code
    reg [7:0] SSEG0 = 8'b01100011; // "C"

    //----------------------------
    // digit Multiplexer

    always@(ASEL, SSEG2, SSEG3) begin 
        // Multiplexer selects between digit configurations
        case (ASEL)
            0: sseg <= SSEG0;
            1: sseg <= SSEG1;
            2: sseg <= SSEG2;
            3: sseg <= SSEG3;
        endcase
    end

    //----------------------------
    // Anode Selection Assignments

    assign A[3] = ~(display &  ASEL[1] &  ASEL[0]);
    assign A[2] = ~(display &  ASEL[1] & ~ASEL[0]);
    assign A[1] = ~(display & ~ASEL[1] &  ASEL[0]);
    assign A[0] = ~(display & ~ASEL[1] & ~ASEL[0]);

endmodule

//-------------------------------
/*
    Digit Driver: converts 4-bit BCD to 7seg configurations
        - used for digit 3/2
*/

module digitDriver(
    input [3:0] num,
    output reg [7:0] SSEG
);
    always@(num) begin
        case (num)
                // abcdefg-dp
            0:  SSEG <= 8'b00000011;
            1:  SSEG <= 8'b10011111;
            2:  SSEG <= 8'b00100101;
            3:  SSEG <= 8'b00001101;
            4:  SSEG <= 8'b10011001;
            5:  SSEG <= 8'b01001001;
            6:  SSEG <= 8'b01000001;
            7:  SSEG <= 8'b00011111;
            8:  SSEG <= 8'b00000001;
            9:  SSEG <= 8'b00001001;
        // 10-14: Error Codes (num: 0-9)
            10: SSEG <= 8'b01111110; 
            11: SSEG <= 8'b10111110;
            12: SSEG <= 8'b11011110;
            13: SSEG <= 8'b11101110;
            14: SSEG <= 8'b11110110;
            15: SSEG <= 8'b11111111; // blank code
        endcase
    end
endmodule
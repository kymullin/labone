/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/18/2023
     Program Name: 7SegDriver.v
    SubProgram of: Station System
  
    Program Description: 
        This module transforms the 12-bit binary number "digitalTemp" 
        from the XADC into an 8-bit Binary-Coded Decimal (BCD) number. 

    Inputs:
        CLK - 100 MHz CLK
        CorrectStation - true when rover has found correct station
        digitalTemp [11:0] - 12-bit binary number from XADC

    Outputs:
       decimalTemp [7:0] - 8-bit BCD number representing perceived temperature
       display - true when correct station found. Causes 7-segment display to 
       turn on

    Internal Signals:
        capture [11:0] - stores digitalTemp when conversion begins
        out [7:0] - stores final result of conversion
        busy - true while conversion occurs

*///-----------------------------------------------------------

module SSegDriver(
    input CLK,
    input CorrectStation,
    input [11:0] digitalTemp,
    output reg [7:0] decimalTemp = 0,
    output display);

    reg [11:0] capture = 0;
    reg [7:0]  y = 0;
    reg busy = 0;

    localparam IDLE =        0;
    localparam CAPTURE =     1;
    localparam DIVISION =    2;
    localparam OUTPUT =      3;

    reg [2:0] state = IDLE;

    assign display = CorrectStation;

    always@(posedge CLK) begin
        case (state)
            
            IDLE: begin
                case (CorrectStation) 
                    0: state = IDLE;
                    1: state = CAPTURE;
                endcase
            end

            CAPTURE: begin
                busy    <= 1;
                y       <= 0;
                
                // 15 is "blank" code for 7 segment module
                decimalTemp = 8'hFF; 
                capture = digitalTemp;
                state   <= (capture >= 68) ? DIVISION : OUTPUT;
            end

            DIVISION: begin
                capture = capture - 68;
                case (y[3:0]) 
                    9: begin
                        y[3:0] = 0;
                        y[7:4] = y[7:4] + 1;
                    end

                    default: y = y + 1;
                endcase
                state = (capture >= 68) ? DIVISION : OUTPUT;
            end

            OUTPUT: begin
                busy <= 0;
                decimalTemp <= y;
                case (CorrectStation)
                    0: state = IDLE; 

                    // prevents multiple capture/converts per station
                    1: state = OUTPUT; 
                endcase
            end

            default: begin // error occurred, trigger restart
                busy        <= 0;
                y           <= 0;
                decimalTemp <= 8'hFF;
                capture     <= 0;
                state       <= IDLE; 
            end
        endcase
    end
endmodule
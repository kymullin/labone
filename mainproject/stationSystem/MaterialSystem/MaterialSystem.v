/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/23/2023
     Program Name: MaterialSystem.v
    SubProgram of: Station System
  
    Program Description:
        The material system detects stations, determines its temp,
        and collects/drops washers @ the correct station.
        It also triggers the seven segment system.

    Inputs:
        CLK - ACLK
        trigger - station trigger from KY-032 -- active low
        digitalTemp [11:0] - 12-bit XADC value
        ready - ready from XADC
    
    Outputs:
        EnableIR - supplies power to IR device
        Correct Station - triggers the 7-segment system
        controlSignal - powers washer electromagnet       

*///-----------------------------------------------------------

// module code here
module materialSystem(
    input CLK,
    input trigger,
    input [11:0] digitalTemp,
    input ready,
    output reg enableIR = 1, correctStation = 0, controlSignal = 0;
);

    reg [3:0] state = IDLE;
    reg [1:0] station = START;
    reg [9:0] delay1 = 100; // 100 clk cycles = .1 sec

    localparam [3:0] IDLE    = 4'h0;
    localparam [3:0] DELAY1  = 4'h1;
    localparam [3:0] READ    = 4'h2;
    localparam [3:0] CORRECT = 4'h3;
    localparam [3:0] DELAY2  = 4'h4;
    localparam [3:0] PICKUP  = 4'h5;

    localparam [1:0] START  = 2'd0;
    localparam [1:0] HOT    = 2'd1;
    localparam [1:0] COLD   = 2'd2;
    localparam [1:0] FINISH = 2'd3;

    always @(posedge CLK) begin
        case (state) 
            IDLE: begin
                controlSignal  <= 0;
                correctStation <= 0;
                case (trigger)
                    0: begin
                        EnableIR <= 1;
                        state    <= IDLE;
                    end

                    1: begin
                        enableIR <= 0;
                        state    <= DELAY1;
                    end
                endcase
            end

            DELAY1: begin
                
            end

            READ: begin

            end

            CORRECT: begin

            end

            DELAY2: begin

            end

            PICKUP: begin

            end

            default: begin

            end
        endcase
    end
endmodule
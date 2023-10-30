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
    output reg enableIR = 1,
    output reg correctStation = 0, 
    output reg controlSignal = 0
);

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

    localparam prd1 = 100; // .1 sec
    localparam prd2 = 500; // .5 sec

    localparam Threshold1 = 1200; // 17-18 C from XADC
    localparam Threshold2 = 1900; // 27-28 C from XADC

    reg [3:0] state = IDLE;
    reg [1:0] station = START;
    reg [6:0] delay1 = prd1; // 100 clk cycles = .1 sec
    reg [8:0] delay2 = prd2; // 500 clk cycles = .5 sec

    always @(posedge CLK) begin
        case (state) 
            IDLE: begin
                controlSignal  <= 0;
                correctStation <= 0;
                case (trigger)
                    0: begin
                        enableIR <= 1;
                        state    <= IDLE;
                    end

                    1: begin
                        enableIR <= 0;
                        state    <= DELAY1;
                    end
                endcase
            end

            DELAY1: begin
                if (delay1 == 0) begin
                    delay1 <= prd1;
                    state  <= READ;
                end
                else
                    delay1 <= delay1 - 1;
            end

            READ: begin
                if (ready == 1) begin // test XADC ready flag
                    case (station)
                        HOT: begin
                            if (digitalTemp < Threshold2)
                                state <= DELAY2; // wrong station
                            else
                                state <= CORRECT; // correct station (HOT)
                        end

                        COLD: begin
                            if (digitalTemp > Threshold1)
                                state <= DELAY2; // wrong station
                            else
                                state <= CORRECT; // correct station (COLD)
                        end

                        default: begin // START and FINISH are ambient
                            if (digitalTemp < Threshold1 || digitalTemp > Threshold2)
                                state <= DELAY2; // wrong station detected
                            else
                                state <= CORRECT; // correct station detected (ambient)
                        end
                    endcase
                end
            end

            CORRECT: begin
                controlSignal  <= 1;
                correctStation <= 1;
                // set station to next (start -> hot -> cold -> finish -> start)
                station <= station + 1; 
                state   <= DELAY2;
            end

            DELAY2: begin
                if (delay2 == 300)
                    enableIR = 1; // turn IR detector on after .2 sec

                if (delay2 == 0) begin
                    delay2 <= prd2;
                    state  <= PICKUP;
                end
                else 
                    delay2 <= delay2 - 1;
            end

            PICKUP: begin // wait for second pillar
                state <= (trigger == 1) ? IDLE: PICKUP;
            end

            default: begin
                state <= IDLE;
            end
        endcase
    end
endmodule
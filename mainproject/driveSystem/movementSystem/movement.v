/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/12/2023
     Program Name: movement.v
    SubProgram of: movement system
  
    Program Description:
        This program constructs the movement system state machine. This machine
        evaluates the condition of 3 IPS sensors (L, C*, R) and determines the type 
        of track it is following. It uses this information to determine how to drive 
        motors A/B of the rover.

        L   C*  R   |   Track Type
        ------------|-------------
        0   0   0   |   Straight (ST)
        0   0   1   |   Curve Right (CR)
        0   1   0   |   NONE
        0   1   1   |   Right 90 deg (R90)
        1   0   0   |   Curve Left (CL)
        1   0   1   |   Crossroad (Cross)
        1   1   0   |   Left 90 deg (L90)
        1   1   1   |   Crossroad (no center line detected, but no T-Junctions exist on track)

        Note: C* bc C is an inverted input (active low)

    Inputs:
        CLK     - timing clock
        L,C,R   - IPS sensors (determine track position/angle relative to rover)
    
    Outputs:
        [1:0] DriveA/B - drive strength sent to PWM generator for motors A/B

    Internal Signals:
        [3:0] state - state machine register
        CrossNum    - tracks crossroads events

*///-----------------------------------------------------------

module movement(
    input CLK, L, C, R,
    output reg [1:0] DriveA = 0, 
    output reg [1:0] DriveB = 0
);
    // local params to represent track types
    localparam track_ST     = 3'b000;
    localparam track_CR     = 3'b001;
    localparam track_None   = 3'b010;
    localparam track_R90    = 3'b011;
    localparam track_LC     = 3'b100;
    localparam track_Cross  = 3'b101;
    localparam track_L90    = 3'b110;
    localparam track_CrossT = 3'b111;

    // local params to represent different state values
    localparam OFF      = 4'b0000;
    localparam ST       = 4'b0001;
    localparam CL       = 4'b0010;
    localparam L90      = 4'b0011;
    localparam CR       = 4'b0100;
    localparam R90      = 4'b0101;
    localparam Cross    = 4'b0110;
    localparam CST      = 4'b1001;
    localparam C90      = 4'b1101;

    reg [3:0] state = OFF;
    reg CrossNum = 0; // 0: first time crossing, 1: second time crossing

    // inside this block is a set of nested case statements which compute:
        // The next state to go to
        // how to configure output registers

        // example case iteration:
            // state: 
                // set DriveA/DriveB
                // nested case (IPS sensors)
                    // set next state according to State machine
                // end nested case
            // end state
    always@(posedge CLK) begin
        case (state)
            OFF: begin
                DriveA <= 0;
                DriveB <= 0;
                casex({L,C,R})
                    track_ST:   state <= ST;
                    track_None: state <= OFF;
                    3'b0X1:     state <= CR;
                    3'b1X0:     state <= CL;
                    3'b1X1:     state <= CR;
                endcase
            end

            ST: begin
                DriveA <= 1;
                DriveB <= 1;
                casex({L,C,R})
                    3'b0X0: state <= ST;
                    3'b1X0: state <= CL;
                    3'b0X1: state <= CR;
                    3'b1X1: state <= Cross;
                endcase
            end

            CL: begin
                DriveA <= 1;
                DriveB <= 2;
                casex({L,C,R})
                    3'b00X: state <= ST;
                    3'b1X1: state <= Cross;
                    track_R90:  state <= Cross;
                    track_LC:   state <= CL;
                    track_None: state <= CL;
                    track_L90:  state <= L90;
                endcase
            end

            L90: begin
                DriveA <= 0;
                DriveB <= 2;
                casex({L,C,R})
                    3'bX0X: state <= CL;
                    3'bX1X: state <= L90;
                endcase
            end

            CR: begin
                DriveA <= 2;
                DriveB <= 1;
                casex({L,C,R})
                    3'bX00:     state <= ST;
                    3'b1X1:     state <= Cross;
                    track_L90:  state <= Cross;
                    track_CR:   state <= CR;
                    track_None: state <= CR;
                    track_R90:  state <= R90;
                endcase
            end

            R90: begin
                DriveA <= 2;
                DriveB <= 0;
                casex({L,C,R})
                    3'bX1X: state <= R90;
                    3'bX0X: state <= CR;
                endcase
            end

            Cross: begin
                case (CrossNum)
                    0: begin
                        state = C90;
                        CrossNum = 1;
                    end

                    1: begin
                        state = CST;
                        CrossNum = 0;
                    end
                endcase
            end

            CST: begin
                DriveA <= 1;
                DriveB <= 1;
                case({L,C,R})
                    track_ST:   state <= ST;
                    default:    state <= CST;
                endcase
            end

            C90: begin
                DriveA <= 2;
                DriveB <= 0;
                casex({L,C,R})
                    3'bX0X: state <= C90;
                    3'bX1X: state <= R90;
                endcase
            end

            default: begin
                state  <= OFF;
                DriveA <= 0;
                DriveB <= 0;
            end
        endcase
    end
endmodule
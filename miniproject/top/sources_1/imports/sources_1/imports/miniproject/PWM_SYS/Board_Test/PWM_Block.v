//`timescale  10ns/1ps
/*-------------------------------------------------------------
    Project Lab 1 - Mini Motor Project
       Program by: Zachary Bonneau
    Creation Date: 09/10/2023
     Program Name: PWM_Block.v
    SubProgram of: PWM System
  
    Program Description:
    PWM_Block.v integrates all of the subsystems of the PWM system. 
    This will pull modules created and tested from CCR.v, 
        TCR.v, PWM_OUT.v, and T-FF.v

    Considering my lack of knowledge on proper 'include syntax, 
        this will be accomplished via copy/paste 

    Inputs:
        SW [6:0] - 7-bit data input from onboard switches
        CLK      - System Clock as configured in Vivado at later date
        
    
    Outputs:
        PWM_OUT  - from PWM_OUT module
        E        - from TCR module
*/

module PWM_Block(PWM_OUT, E, LED, CLK_OUT, SW, CLK_100MHz);
    // Top module of this system. Connects I/O of each subsystem

    input CLK_100MHz;
    input [6:0] SW;

    output E;
    output PWM_OUT;
    output [6:0] LED;
    output CLK_OUT;
    
    wire CLK;
    wire [6:0] CCR_internal;
    wire [6:0] TCR_internal;
    wire       E_internal;
    
    // instantiate submodules
    CLK_DIV CLK0(CLK, CLK_100MHz);
    TCBlock TCR0(TCR_internal, E_internal, CLK);
    CCR CCR0(CCR_internal, SW, E_internal);
    PWM_OUT_Block PWM0(PWM_OUT, TCR_internal, CCR_internal, E_internal, CLK);

    assign E = E_internal;
    assign LED[0] = SW[0];
    assign LED[1] = SW[1];
    assign LED[2] = SW[2];
    assign LED[3] = SW[3];
    assign LED[4] = SW[4];
    assign LED[5] = SW[5];
    assign LED[6] = SW[6];
    assign CLK_OUT = CLK;
    
endmodule

module CLK_DIV(output CLK, input CLK_100MHz);
    // divides 100 MHz source clock to 48.8 kHz

    reg [10:0] clk_reg = 0;
    
    always@(posedge CLK_100MHz) begin
        clk_reg <= clk_reg + 1;
    end
    
    assign CLK = clk_reg[10];
    
endmodule

module TCBlock(TCR, E, CLK);
    // Timer/Counter module - from TCR.v

    // Logic Hazard Found during integration. To resolve this issue, 
    // E becomes a register
    input CLK;

    output reg E = 0;
    output reg [6:0] TCR = 0;

    always @(negedge CLK) begin
        TCR <= TCR + 1;
    end
    
    always @(negedge CLK) begin
        case(TCR)
            127: E <= 1; // E goes high right as TCR -> 0
            default: E <= 0;
        endcase
    end
endmodule

module CCR (CCR_OUT, SW, E);
    // CCR module - from CCR.v
    input [6:0] SW;                 // from onboard switches
    input E;                        // from TCR block
    output reg [6:0] CCR_OUT = 0;   // to PWM_OUT block

    always@(posedge E) begin
        // On rising edge of E (posedge of clk), assign CCR_OUT = SW
        CCR_OUT[0] <= SW[0];
        CCR_OUT[1] <= SW[1];
        CCR_OUT[2] <= SW[2];
        CCR_OUT[3] <= SW[3];
        CCR_OUT[4] <= SW[4];
        CCR_OUT[5] <= SW[5];
        CCR_OUT[6] <= SW[6];
    end
endmodule 

module PWM_OUT_Block(PWM_OUT, TCR, CCR, E, CLK);
    // PWM_OUT_Block contains SM for output control

    input E; // Enable signal from TCR (E = 1 when TCR = 0)
    input CLK;
    input [6:0] TCR;
    input [6:0] CCR; // from TCBlock and CCR

    output reg PWM_OUT = 0;

    wire R; // internal signal from PWM_OUT_RESET

    PWM_OUT_RESET R0(R, TCR, CCR); // RESET combinational logic

    always @(posedge CLK) begin
        PWM_OUT = ~R & (PWM_OUT | E);
    end
endmodule

module PWM_OUT_RESET(R, TCR, CCR);
    // Reset - an internal signal that pulls PWM_OUT to 0
    // This block contains the combinational logic for Reset
    // from PWM_OUT.v

    input [6:0] TCR;
    input [6:0] CCR;

    output R;

    assign R = ~(TCR[0] ^ CCR[0] | TCR[1] ^ CCR[1] | TCR[2] ^ CCR[2]
               | TCR[3] ^ CCR[3] | TCR[4] ^ CCR[4] | TCR[5] ^ CCR[5] | TCR[6] ^ CCR[6]);
endmodule
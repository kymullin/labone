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

module PWM_Block(PWM_OUT, E, LED, SW, CLK_100MHz);
    // Top module of this system. Connects I/O of each subsystem

    input CLK_100MHz;
    input [6:0] SW;

    output E;
    output PWM_OUT;
    output [6:0] LED;
   // output CLK_OUT;
    
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
    //input CLK_100MHz;
    //output CLK;
    
//    wire [10:0] T;

//    TFF_NEG T0(T[0], CLK_100MHz);
//    TFF_NEG T1(T[1], T[0]);
//    TFF_NEG T2(T[2], T[1]);
//    TFF_NEG T3(T[3], T[2]);
//    TFF_NEG T4(T[4], T[3]);
//    TFF_NEG T5(T[5], T[4]);
//    TFF_NEG T6(T[6], T[5]);
//    TFF_NEG T7(T[7], T[6]);
//    TFF_NEG T8(T[8], T[7]);
//    TFF_NEG T9(T[9], T[8]);
//    TFF_NEG T10(T[10], T[9]);

//    assign CLK = T[10];

    reg [10:0] clk_reg = 0;
    
    always@(posedge CLK_100MHz) begin
        clk_reg <= clk_reg + 1;
    end
    
    assign CLK = clk_reg[10];
    
endmodule

module TFF_NEG(T, CLK);
    // negative edge TFF
    // copied from T-FF.v
    input CLK;
    output reg T = 1;

    always@(negedge CLK) begin
        // flip T on falling edge
        T = ~T;
    end
endmodule

module TCBlock(TCR, E, CLK);
    // Timer/Counter module - from TCR.v

    // Logic Hazard Found during integration. To resolve this issue, 
    // E becomes a SR-latch 
        // S = negedge of TCR[6] (7F -> 00)
        // R = posedge of TCR[0] (00 -> 01 & all other even -> odd)
    input CLK;

    output reg E = 0;
    //wire [6:0] T;
    output reg [6:0] TCR = 0;

//    TFF_NEG T0(TCR[0], CLK);
//    TFF_NEG T1(TCR[1], TCR[0]);
//    TFF_NEG T2(TCR[2], TCR[1]);
//    TFF_NEG T3(TCR[3], TCR[2]);
//    TFF_NEG T4(TCR[4], TCR[3]);
//    TFF_NEG T5(TCR[5], TCR[4]);
//    TFF_NEG T6(TCR[6], TCR[5]);

    always @(negedge CLK) begin
        TCR <= TCR + 1;
    end
    
    always @(negedge CLK) begin
        case(TCR)
            127: E <= 1;
            default: E <= 0;
        endcase
    end
    
//    always @(negedge TCR[6]) begin
//         E = 1; #2; E = 0;
//    end

//    always @(posedge TCR[0]) begin
//        E = 0;
//    end
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
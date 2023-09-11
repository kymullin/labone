/*-------------------------------------------------------------
    Project Lab 1 - Mini Motor Project
       Program by: Zachary Bonneau
    Creation Date: 09/10/2023
     Program Name: PWM_Block.v
    SubProgram of: PWM System
  
    Program Description:
    PWM_Block.v integrates all of the subsystems of the PWM system. This will pull modules 
    created and tested from CCR.v, TCR.v, PWM_OUT.v, and T-FF.v
    Considering my lack of knowledge on proper 'include syntax, this will be accomplished via copy/paste 

    Inputs:
        SW [6:0] - 7-bit data input from onboard switches
        CLK      - System Clock as configured in Vivado at later date
        
    
    Outputs:
        PWM_OUT  - from PWM_OUT module
        E        - from TCR module
*/

module PWM_Block(PWM_OUT, E, SW, CLK);
    // Top module of this system. Connects I/O of each subsystem

    input CLK;
    input [6:0] SW;

    output E;
    output PWM_OUT;

    wire [6:0] CCR_internal;
    wire [6:0] TCR_internal;
    wire       E_internal;

    // instantiate submodules
    TCBlock TCR0(TCR_internal, E_internal, CLK);
    CCR CCR0(CCR_internal, SW, E_internal);
    PWM_OUT_Block PWM0(PWM_OUT, TCR_internal, CCR_internal, E_internal, CLK);

    assign E = E_internal;
    
endmodule

module TFF_NEG(T, CLK);
    // negative edge TFF
    // copied from T-FF.v
    input CLK;
    output reg T = 0;

    always@(negedge CLK) begin
        // flip T on falling edge
        T = ~T;
    end
endmodule

module TCBlock(TCR, E, CLK);
    // Timer/Counter module - from TCR.v
    input CLK;

    output E;
    wire [6:0] T;
    output [6:0] TCR;

    TFF_NEG T0(TCR[0], CLK);
    TFF_NEG T1(TCR[1], TCR[0]);
    TFF_NEG T2(TCR[2], TCR[1]);
    TFF_NEG T3(TCR[3], TCR[2]);
    TFF_NEG T4(TCR[4], TCR[3]);
    TFF_NEG T5(TCR[5], TCR[4]);
    TFF_NEG T6(TCR[6], TCR[5]);

    assign E = ~(TCR[0] | TCR[1] | TCR[2] | TCR[3] | TCR[4] | TCR[5] | TCR[6]);
    
endmodule

module CCR (CCR_OUT, SW, E);
    // CCR module - from CCR.v
    input [6:0] SW;                 // from onboard switches
    input E;                        // from TCR block
    output reg [6:0] CCR_OUT = 0;   // to PWM_OUT block

    always@(posedge E) begin
        // On rising edge of E, assign CCR_OUT = SW
        #1;
        CCR_OUT[0] <= E & SW[0] | ~E & CCR_OUT[0];
        CCR_OUT[1] <= E & SW[1] | ~E & CCR_OUT[1];
        CCR_OUT[2] <= E & SW[2] | ~E & CCR_OUT[2];
        CCR_OUT[3] <= E & SW[3] | ~E & CCR_OUT[3];
        CCR_OUT[4] <= E & SW[4] | ~E & CCR_OUT[4];
        CCR_OUT[5] <= E & SW[5] | ~E & CCR_OUT[5];
        CCR_OUT[6] <= E & SW[6] | ~E & CCR_OUT[6];
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
        #1;
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

module testbench;
    // Testbench - Configures/tests PWM_Block & creates waveform
    reg CLK = 0;
    reg [6:0] Switches;

    wire PWM_OUT, E;

    PWM_Block UUT(PWM_OUT, E, Switches, CLK);

    always begin
        #1; CLK = ~CLK;
    end

    initial begin
        $dumpfile("PWM_waveform.vcd");
        $dumpvars(0, testbench);
        Switches = 7'b0000100; // SW = 4
        #6; Switches = 7'b0010001;
        #300;
        $finish;
    end

endmodule
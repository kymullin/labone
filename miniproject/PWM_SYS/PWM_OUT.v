/*-------------------------------------------------------------
    Project Lab 1 - Mini Motor Project
       Program by: Zachary Bonneau
    Creation Date: 09/07/2023
     Program Name: PWM_OUT.v
    SubProgram of: PWM System

    includes:
        
  
    Program Description:
    PWM_OUT converts the internal PWM signals (TCR, CCR, etc.) and delivers the motor control
    signal. 

    Inputs:
        TCR [6:0] - TCR Data Register
        CCR [6:0] - CCR Data Register
        E         - TCR Enable signal
        CLK       - System Clock
    
    Outputs:
        PWM_OUT - Motor control signal

    Internal Signals
        - R - reset signal (pulls motor control to 0)
*/

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

    input [6:0] TCR;
    input [6:0] CCR;

    output R;

    assign R = ~(TCR[0] ^ CCR[0] | TCR[1] ^ CCR[1] | TCR[2] ^ CCR[2]
               | TCR[3] ^ CCR[3] | TCR[4] ^ CCR[4] | TCR[5] ^ CCR[5] | TCR[6] ^ CCR[6]);
endmodule

module testbench;
    // testbench module - tests PWM_OUT_Block

    reg CLK = 0;
    reg [6:0] TCR = 0;
    reg [6:0] CCR = 20;
    reg E = 1;
    wire PWM_OUT;

    PWM_OUT_Block UUT(PWM_OUT, TCR, CCR, E, CLK);

    always begin
        #1; CLK = ~CLK;
    end

    always@(negedge CLK) begin
        TCR = TCR + 1;
    end

    initial begin
        $dumpfile("TCR_waveform.vcd");
        $dumpvars(0, testbench);
        #2; E = 0;                  // test E signal 
        #44;                        // wait for reset
        E = 1; TCR = -1; #2;        // test E signal again
        E = 0;
        #44;                        // wait for reset
        $finish;
    end

endmodule

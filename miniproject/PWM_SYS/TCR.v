/*-------------------------------------------------------------
    Project Lab 1 - Mini Motor Project
       Program by: Zachary Bonneau
    Creation Date: 09/06/2023
     Program Name: TCR.v
    SubProgram of: PWM System

    includes:
        T-FF.v
  
    Program Description:
    The Timer/Counter does the following:
        - sets the period of the PWM signal
        - sends the 7-bit value TCR to the output block
        - sends the enable signal E to the CCR and output blocks

    Inputs:
        CLK - system clock source
    
    Outputs:
        TCR [6:0] - 7-bit data output sent to PWM_OUT block
        E         - control output sent to CCR and PWM_OUT
*/

`include "\miniproject\T-FF.v"

module TCBlock(TCR, E, CLK);
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

    assign E = ~(TCR[0] | TCR[1] | TCR[2] 
      | TCR[3] | TCR[4] | TCR[5] | TCR[6]);
    
endmodule

module testbench;
    // Testbench - Configure and Test TCR to 
    //   evaluate chained T-FFs and E signal
    reg CLK = 1;
    wire E;
    wire [6:0] TCR;

    TCBlock UUT(TCR, E, CLK);

    always begin
        #1; CLK = ~CLK;
    end

    initial begin
        $dumpfile("TCR_waveform.vcd");
        $dumpvars(0, testbench);
        #256;
        $finish;
    end
endmodule
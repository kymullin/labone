/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/12/2023
     Program Name: CLK_SYS.v
    SubProgram of: CLK_System
  
    Program Description:
        CLK_SYS generates 3 timing signals for the software solution.
            - MCLK -      48.8 kHz - drives Motor PWM
            - ACLK -         1 kHz - drives auxilary modules
            - DisplayCLK - 381  Hz - Drives 7-seg display multiplexing

    Inputs:
        CLK100MHz - 100 MHz system clock from basys board
    
    Outputs:
        ACLK
        MCLK
        Display CLK

    Internal Signals:
        CLK_DIV  - 18-bit register. Divides sys clock 
        ACLK_GEN - 17-bit register. Counts to 49,999, then flips ACLK
       

*///-----------------------------------------------------------

module CLK_SYS(
    input CLK100MHz,
    output reg ACLK = 0, 
    output MCLK,  DisplayCLK
);
    reg [17:0] CLK_DIV = 0;
    reg [16:0] ACLK_GEN = 0;

    always @(posedge CLK100MHz) begin
        CLK_DIV <= CLK_DIV + 1;
        ACLK_GEN <= ACLK_GEN +1;
        if (ACLK_GEN == 49999) begin
            ACLK <= ~ACLK;
            ACLK_GEN <= 0;
        end
    end

    assign MCLK = CLK_DIV[10];
    assign DisplayCLK = CLK_DIV[17];

endmodule
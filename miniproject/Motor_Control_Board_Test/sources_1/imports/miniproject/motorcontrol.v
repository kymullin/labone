/*-------------------------------------------------------------
    Project Lab 1 - Mini Motor Project
       Program by: Kyle Mullins
    Creation Date: 09/07/2023
     Program Name: motorcontrol.v
    SubProgram of: N/A
  
    Program Description:
    motorcontrol.v acts as a single point of communication between the basys board and the H-Bridge


    Revision 2.0:
    Incorporated Current Detection and overcurrent protection to module

    Inputs:
        PWM_OUT
        SW7
        Over1 - Current through motor A exceeds 1 Amp
        Under750 - Current through motor A below 750 mA
        CLK - Clock source from PWM_SYSTEM
    
    Outputs:
        Forward
        Backward
        SnsA - sent to SSEG_Block
*/

module motorcontrol(
    output Forward,
    output Backward,
    output SnsA,
    input PWM_OUT,
    input SW7,
    input Over1,
    input Under750,
    input CLK_100MHz);

    // primary module for motor control system
    wire MotorOut;
    wire CLK;

    CLK_DIV(CLK, CLK_100MHz);
    CurrentProtection P0(MotorOut, PWM_OUT, Over1, Under750, CLK);

    assign Forward = ~SW7 & MotorOut;
    assign Backward = SW7 & MotorOut;

    assign SnsA = Over1;
endmodule

module CLK_DIV(output CLK, input CLK_100MHz);
    // divides 100 MHz source clock to 48.8 kHz
    //input CLK_100MHz;
    //output CLK;

    reg [10:0] clk_reg = 0;
    
    always@(posedge CLK_100MHz) begin
        clk_reg <= clk_reg + 1;
    end
    
    assign CLK = clk_reg[10];
    
endmodule


module CurrentProtection(
    output MotorOut,
    input  PWM_OUT,
    input  Over1,
    input  Under750,
    input CLK);

    // Simple state machine. Stops motor power if overcurrent detected
    // Resets motor power after current drops below 750 mA

    reg PowerStop = 0;

    always@(posedge CLK) begin
        PowerStop <= Over1 | PowerStop & ~Under750;
        
    end
    assign MotorOut = PWM_OUT & ~PowerStop;

endmodule
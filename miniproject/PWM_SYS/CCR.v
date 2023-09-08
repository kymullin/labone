/*-------------------------------------------------------------
    Project Lab 1 - Mini Motor Project
       Program by: Zachary Bonneau
    Creation Date: 09/06/2023
     Program Name: CCR.v
    SubProgram of: PWM System
  
    Program Description:
    The Capture Compare Register (CCR) is a 7-bit data Register within the PWM System.
    Its purpose is to hold the TCR value at which the PWM signal is set to 0.
    The register CCR may only change on the rising edge of TCR:E
        - this ensures that CCR updates in sync with TCR overflow 

    Inputs:
        SW [6:0] - 7-bit data input from onboard switches
        E        - Enable signal from TCR block
    
    Outputs:
        CCR_OUT [6:0] - 7-bit data output sent to PWM_OUT block
*/


module CCR (CCR_OUT, SW, E);
    // assign inputs and outputs
    input [6:0] SW;                 // from onboard switches
    input E;                        // from TCR block
    output reg [6:0] CCR_OUT = 0;   // to PWM_OUT block

    always@(posedge E) begin
        // On rising edge of E, assign CCR_OUT = SW
        CCR_OUT[0] <= SW[0];
        CCR_OUT[1] <= SW[1];
        CCR_OUT[2] <= SW[2];
        CCR_OUT[3] <= SW[3];
        CCR_OUT[4] <= SW[4];
        CCR_OUT[5] <= SW[5];
        CCR_OUT[6] <= SW[6];
    end
endmodule 

module testbench;
    // testbench module - tests CCR and outputs to waveform file
    reg [6:0] SW;
    reg E;

    wire [6:0] CCR_OUT;

    // instantiate module CCR
    CCR UUT(.CCR_OUT(CCR_OUT), .SW(SW), .E(E));

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, testbench);
        E = 0;
        SW = 7'b0010010;        // test for E=0 CCR
        #2;

        E = 1; #1;              // test for rising edge trigger

        SW = 7'b0101101; #2;    // test for E=1 hold

        E = 0; #2;              // test for falling-edge hold

        E = 1; #2;              // test for rising edge trigger

        $finish;
    end

endmodule
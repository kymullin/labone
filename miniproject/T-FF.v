/*-------------------------------------------------------------
    Project Lab 1 - Mini Motor Project
       Program by: Zachary Bonneau
    Creation Date: 09/06/2023
     Program Name: T-FF_negCLK.v
    SubProgram of: Mini Motor
  
    Program Description:
    The T-FF is a standard data register that inverts every clock cyle. 
    This program has two modules: TFF_POS and TFF_NEG
     - POS flips on rising edge of CLK
     - NEG flips on negative edge of CLK

    Inputs:
        CLK - Clock src
    
    Outputs:
        T - non-inverted data value
*/


module TFF_POS(T, CLK);
    // positive edge TFF
    input CLK;
    output reg T = 0;

    always@(posedge CLK) begin
        // flip T on rising edge
        T = ~T;
    end
endmodule

module TFF_NEG(T, CLK);
    // negative edge TFF
    input CLK;
    output reg T = 0;

    always@(negedge CLK) begin
        // flip T on falling edge
        T = ~T;
    end
endmodule

/*
module testbench;
    // testbench module - tests posedge and negedge signals
    reg CLK = 0;
    wire T_POS, T_NEG;

    always begin
       #1; CLK = ~CLK;
    end

        TFF_POS UUT1(T_POS, CLK);
    TFF_NEG UUT2(T_NEG, CLK);

    initial begin
        $dumpfile("TFF_waveform.vcd");
        $dumpvars(0, testbench);
        #10;                            // no control necessary, just wait 10
        $finish;
    end
endmodule

*/
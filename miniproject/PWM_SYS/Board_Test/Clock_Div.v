/*-------------------------------------------------------------
    Project Lab 1 - Mini Motor Project
       Program by: Zachary Bonneau
    Creation Date: 09/10/2023
     Program Name: Clock_Div.v
    SubProgram of: PWM System
  
    Program Description:
    Divides 100 MHz Clock on Basys board to 48.8 kHz

    Inputs:
        CLK_100MHz
    
    Outputs:
        CLK
*/

`include "\miniproject\T-FF.v"

module CLK_DIV(output CLK, input CLK_100MHz);
    // divides 100 MHz source clock to 48.8 kHz
    //input CLK_100MHz;
    //output CLK;
    
    wire [10:0] T;

    TFF_NEG T0(T[0], CLK_100MHz);
    TFF_NEG T1(T[1], T[0]);
    TFF_NEG T2(T[2], T[1]);
    TFF_NEG T3(T[3], T[2]);
    TFF_NEG T4(T[4], T[3]);
    TFF_NEG T5(T[5], T[4]);
    TFF_NEG T6(T[6], T[5]);
    TFF_NEG T7(T[7], T[6]);
    TFF_NEG T8(T[8], T[7]);
    TFF_NEG T9(T[9], T[8]);
    TFF_NEG T10(T[10], T[9]);

    assign CLK = T[10];
    
endmodule

module testbench;
    reg CLK_100MHZ = 0;
    wire CLK;

    CLK_DIV C0(CLK, CLK_100MHZ);

    always begin
        #1; CLK_100MHZ = ~CLK_100MHZ;
    end

    initial begin
        $dumpfile("CLK_waveform.vcd");
        $dumpvars(0, testbench);
        #1000000;
        $finish;
    end

endmodule
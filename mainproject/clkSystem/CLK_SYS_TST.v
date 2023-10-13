/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/12/2023
     Program Name: CLK_SYS_TST.v
    SubProgram of: CLK System
  
    Program Description:
        This program runs a simulated testbench of the clk system.
        The waveform confirms that a 100 MHz system clk generates 
        48.8 kHz, 1 kHz, and 381 Hz timing signals

*///-----------------------------------------------------------

`include "mainproject\clkSystem\CLK_SYS.v"
`timescale 1ns/1ns

module testbench;
    reg CLK100MHz = 0;
    wire MCLK, ACLK, DisplayCLK;

    always begin
        #5; CLK100MHz = ~CLK100MHz;
    end

    CLK_SYS UUT(CLK100MHz, ACLK, MCLK, DisplayCLK);

    initial begin
        $dumpfile("CLKSYS.vcd");
        $dumpvars(0, testbench);
        #3000000;
        $finish;
    end

endmodule
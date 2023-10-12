`include "mainproject\clkSystem\CLK_SYS.v"
`timescale 10ns/1ps

module testbench;
    reg CLK100MHz = 0;
    wire MCLK, ACLK, DisplayCLK;

    always begin
        #1; CLK100MHz = ~CLK100MHz;
    end

    CLK_SYS UUT(CLK100MHz, ACLK, MCLK, DisplayCLK);

    initial begin
        $dumpfile("CLKSYS.vcd");
        $dumpvars(0, testbench);
        #600000;
    end

endmodule
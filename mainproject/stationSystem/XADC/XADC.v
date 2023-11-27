/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 10/20/2023
     Program Name: XADC.v
    SubProgram of: Station System
  
    Program Description:
        The XADC module utilizes the XADC wizard to configure the Basys 3 XADC. 
        This converts the analog thermopile output to a 12-bit digitalTemp. 

    Inputs:
        CLK - 100 MHz Clock
        Vp - Vout from thermopile - R: [.3-1.3 V]
        Vn - 0.300 V bottom threshold - represents ~0 C
    
    Outputs:
        digitalTemp [11:0] - 12-bit digital conversion of Thermopile output
        ready - XADC conversion is done when ready is true
*///-----------------------------------------------------------

// directive calls


// module code here
module XADC_Module(
    input CLK, Vp, Vn, vp_in, vn_in,
    output [11:0] digitalTemp,
    output ready
);

    reg [6:0] Address = 8'h16; // XA1 = VAUX6 - See Note 1
    wire enable;
    wire [15:0]data;
    
    assign digitalTemp[11:0] = data[15:4];

    xadc_wiz_0 xadc1(
        .daddr_in(Address),
        .dclk_in(CLK),
        .den_in(enable),
        .di_in(0),
        .dwe_in(0), 
        .busy_out(),
        .vauxp6(Vp),
        .vauxn6(Vn),
        .vn_in(vn_in), 
        .vp_in(vp_in),
        .alarm_out(), 
        .do_out(data),
        .eoc_out(enable),
        .eos_out(),
        .channel_out(),
        .drdy_out(ready),
        .reset_in()
          );   
endmodule

    // Note 1
// Register Address from AMD Documentation
// https://docs.xilinx.com/r/en-US/ug480_7Series_XADC/XADC-Register-Interface
// Section: XADC Register Interace

/* Module Instantiation
XADC U0(.CLK(CLK100MHz), .Vp(vauxp6), .Vn(vauxn6),
            .vp_in(vp_in), .vn_in(vn_in),
            .digitalTemp(digitalTemp), .ready(ready));

*/
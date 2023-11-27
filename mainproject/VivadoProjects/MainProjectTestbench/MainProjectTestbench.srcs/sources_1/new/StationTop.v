/*-------------------------------------------------------------
    Project Lab 1 - Main Project
       Program by: Zachary Bonneau
    Creation Date: 
     Program Name: 
    SubProgram of: 
  
    Program Description:
    

    Inputs:
        
    
    Outputs:
       

*///-----------------------------------------------------------

// module code here

module StationTop(
    input [15:0] sw,
    input CLK100MHZ, JA2, JA3, JA6, JA7, JC0, JC1, JC2, JC5, vauxp6, vauxn6, vp_in, vn_in,
    output JA0, JA1, JA4, JA5, JC3, JC4,
    output [7:0] seg,
    output [3:0] A,
    output [15:0] LED
    );
    
    wire MCLK, DisplayCLK, ACLK;
    assign LED = sw;
    
    CLK_SYS CLK(CLK100MHZ, ACLK, MCLK, DisplayCLK);
    
    drive Drive(
        .MCLK(MCLK), .ACLK(ACLK),
        .L(JC0), .C(JC1), .R(JC2),
        .OverA(JA2), .UnderA(JA3),
        .OverB(JA6), .UnderB(JA7),
        .MotorA({JA0, JA1}), .MotorB({JA4, JA5})
        );
    
    stationSystem Station(
        .vauxp6(vauxp6), .vauxn6(vauxn6),
        .vp_in(vp_in), .vn_in(vn_in),
        .stationTrigger(JC5), 
        .MCLK(MCLK), .CLK100MHZ(CLK100MHZ), .DisplayCLK(DisplayCLK), .ACLK(ACLK),
        .powerServo(JC4), .controlEM(JC3),
        .sseg(seg), .A(A)
        );
endmodule

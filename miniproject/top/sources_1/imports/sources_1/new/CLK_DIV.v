/*-------------------------------------------------------------
    Project Lab 1 - Mini Motor Project
       Program by: Zachary Bonneau
    Creation Date: 09/18/2023
     Program Name: CLK_DIV.v
    SubProgram of: top
  
    Program Description:
    CLK_DIV divides the 100 MHz clock to 48.8 kHz

    Inputs:
        CLK_100MHz        
    
    Outputs:
        CLK
*/


module CLK_DIV(output CLK, input CLK_100MHz);
    // divides 100 MHz source clock to 48.8 kHz

    reg [10:0] clk_reg = 0;
    
    always@(posedge CLK_100MHz) begin
        clk_reg <= clk_reg + 1;
    end
    
    assign CLK = clk_reg[10];
    
endmodule
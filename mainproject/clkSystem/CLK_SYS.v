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
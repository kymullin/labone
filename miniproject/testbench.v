`include "motorcontrol.v"

module testbench;
    reg PWM, SW;
    wire [1:0] out;
    motorcontrol UUT(out, PWM, SW);
    initial begin
        $monitor("PWM=%d SW=%d out=%b", PWM, SW, out);
        PWM = 1'b0;     SW = 1'b0;  #1;
        PWM = 1'b0;     SW = 1'b1;  #1;
        PWM = 1'b1;     SW = 1'b0;  #1;
        PWM = 1'b1;     SW = 1'b1;  #1;
    end
endmodule
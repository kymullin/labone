/*-------------------------------------------------------------
    Project Lab 1 - Mini Motor Project
       Program by: Kyle Mullins
    Creation Date: 09/07/2023
     Program Name: motorcontrol.v
    SubProgram of: N/A
  
    Program Description:
    motorcontrol.v acts as a single point of communication between the basys board and the H-Bridge

    Inputs:
        PWM - pwm motor control signal
        SW  - SW7 direction control
    
    Outputs:
        out [1:0] - bi-directional output for motor signal
        [0] - In1/3
        [1] - In2/4
*/

module motorcontrol(out, PWM, SW);
    // primary module for motor control system
    input PWM, SW;
    output [1:0] out;

    assign out[0] = (~SW & PWM);
    assign out[1] = (SW & PWM);
endmodule


module testbench;
    reg PWM = 1;
    reg SW  = 0;

    wire [1:0] out;

    motorcontrol UUT(out, PWM, SW);

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, testbench);
        #10; PWM = 0; #10;                  // 10 t of power, 10 t of no power
        SW = 1; PWM = 1; #10 PWM = 0; #10   // 10 t of power in reverse, 10 t of no power
        $finish;
    end
endmodule
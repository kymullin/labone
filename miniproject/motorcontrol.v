module motorcontrol(out, PWM, SW);
    input PWM, SW;
    output [1:0] out;
    assign out[0] = (~SW & PWM);
    assign out[1] = (SW & PWM);
endmodule
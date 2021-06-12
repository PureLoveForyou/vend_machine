`timescale 1ns / 1ps
// Create Date: 2021/05/25 21:57:02

module FourLights(
    input [3:0] an,
    input [7:0] change_bcd,
    input [7:0] paid_bcd,
    output logic [7:0] a_to_g
    );
    logic [7:0] a_to_g1, a_to_g2, a_to_g3, a_to_g4;
    x7seg_d Light1(.x(paid_bcd[3:0]), .a_to_g(a_to_g1));
    x7seg_d Light2(.x(paid_bcd[7:4]), .a_to_g(a_to_g2));
    x7seg_d Light3(.x(change_bcd[3:0]), .a_to_g(a_to_g3));
    x7seg_d Light4(.x(change_bcd[7:4]), .a_to_g(a_to_g4));
    always_comb begin
        if(an == 4'b0001)
            a_to_g = a_to_g1;
        else if(an == 4'b0010)
            a_to_g = a_to_g2;
        else if(an == 4'b0100)
            a_to_g = a_to_g3;
        else if(an == 4'b1000)
            a_to_g = a_to_g4;
        else
            a_to_g = 8'b11000000;//显示4个0（复位时）
    end
endmodule

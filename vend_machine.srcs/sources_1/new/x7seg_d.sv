`timescale 1ns / 1ps
// Create Date: 2021/05/25 23:35:35

module x7seg_d(
    input [3 : 0] x,
    output logic [7 : 0] a_to_g
    );
    always_comb begin
        case (x)
            0 : a_to_g = 8'b11000000;
            1 : a_to_g = 8'b11111001;
            2 : a_to_g = 8'b10100100;
            3 : a_to_g = 8'b10110000;
            4 : a_to_g = 8'b10011001;
            5 : a_to_g = 8'b10010010;
            6 : a_to_g = 8'b10000010;
            7 : a_to_g = 8'b11111000;
            8 : a_to_g = 8'b10000000;
            9 : a_to_g = 8'b10010000;
            default : a_to_g = 8'b11000000;
        endcase
    end
endmodule

`timescale 1ns / 1ps
// Create Date: 2021/05/25 16:05:39

module an_ctrl(
    input sys_clk,
    input sys_rst_n,
    output logic [3:0] an
    );
    //控制四个七段数码管的四个使能端
    int cnt;
    always_ff @(posedge sys_clk, negedge sys_rst_n)begin
        if(!sys_rst_n)begin
            cnt <= 0;
            an <= 4'b1111;
        end
        else begin
            cnt <= (cnt + 1) % 4;
            an <= 4'b0000 | (1'b1 << cnt);
        end
    end
endmodule

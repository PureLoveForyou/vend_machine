`timescale 1ns / 1ps
// Create Date: 2021/05/24 21:29:55

module edge_det(
    input sys_clk,
    input sys_rst_n,
    input i_btn,
    output logic posedge_flag
    );
    //基于2位移位寄存器的边沿检测电路
    logic [1:0] diffe;
    always_ff @(posedge sys_clk)begin
        if(!sys_rst_n)begin
            diffe <= 2'b00;
            //posedge_flag <= 1'b0;
        end
        else
            diffe[1:0] <= {diffe[0], i_btn};
    end
        
    assign posedge_flag = diffe[0] & (~diffe[1]);
endmodule

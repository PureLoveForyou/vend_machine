`timescale 1ns / 1ps
// Create Date: 2021/05/24 21:16:33

module clken(
    input sys_clk,
    input sys_rst_n,
    output logic clk_flag
    );
    //��25MHZ��ʱ�ӽ���25000��Ƶ����Ϊ1kHZ��ʱ��
    int cnt;
    always_ff @(posedge sys_clk)begin
        if(!sys_rst_n)begin
            cnt <= 0;
            clk_flag <= 1'b0;
        end
        else if(cnt == 24999)begin
            cnt <= 0;
            clk_flag <= 1;
        end
        else begin
            cnt <= cnt + 1'b1;
            clk_flag <= 1'b0;
        end
    end
endmodule

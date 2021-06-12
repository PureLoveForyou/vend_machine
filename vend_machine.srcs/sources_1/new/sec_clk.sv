`timescale 1ns / 1ps
// Create Date: 2021/05/24 22:10:19

module sec_clk(
    input sys_clk,
    input sys_rst_n,
    input start,
    output logic reset_flag
    );
    //计时
    //start为1表示在计时，为0表示暂停
    int cnt;//计算有多少个40纳秒
    always_ff @(posedge sys_clk)begin
        if(!sys_rst_n)begin
            //复位所有值
            cnt <= 0;
            reset_flag <= 1'b0;
        end
        else if(cnt == 249999999 && start == 1)begin
            //计得10秒了;
            cnt <= 0;
            reset_flag <= 1'b1;
        end
        else if(start == 1)begin
            cnt <= cnt + 1'b1;
            reset_flag <= 1'b0;
        end
        else begin
            reset_flag <= 1'b0;
        end
    end
endmodule

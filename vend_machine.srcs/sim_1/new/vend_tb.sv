`timescale 1ns / 1ps
// Create Date: 2021/06/01 17:00:08
`define CLK_PERIOD 40
module vend_tb();
    logic sys_clk, sys_rst_n, coin5, coin10, open;
        logic [3 : 0]    an;
        logic [7 : 0]    a_to_g;
        vend dut( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .coin5(coin5), .coin10(coin10), .an(an), .a_to_g(a_to_g), .open(open) );
        // 时钟、复位、输入数据初始化，复位信号生成
        initial begin
            sys_clk <= 1'b0;
            sys_rst_n <= 1'b0;
            coin5 <= 1'b0;
            coin10 <= 1'b0;
            #100;
            sys_rst_n <= 1'b1;
        end
        always #(`CLK_PERIOD/2) sys_clk = ~sys_clk;//产生时钟
        initial begin//产生测试激励;
            @(posedge sys_clk);             #1000000;coin5 <= 1'b1;
            @(posedge sys_clk);             #100;coin5 <= 1'b0;
            @(posedge sys_clk);             #100;coin5 <= 1'b1;
            @(posedge sys_clk);             #100;coin5 <= 1'b0;            
            @(posedge sys_clk);             #100;coin10 <= 1'b1;
            @(posedge sys_clk);             #100;coin10 <= 1'b0;          
        end
        initial begin
            $timeformat(-9, 0, "ns", 5);
            $monitor("At time %t:sys_rst_n = %b, an = %b, a_to_g = %b, open = %b", $time, sys_rst_n, an, a_to_g, open);
        end
endmodule

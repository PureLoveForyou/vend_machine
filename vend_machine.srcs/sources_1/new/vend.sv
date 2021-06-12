`timescale 1ns / 1ps

module vend(
    input sys_clk, sys_rst_n,
    input coin5, coin10,
    output [3 : 0] an,
    output [7 : 0] a_to_g,
    output open
    );
    logic EnClk;
    logic [7:0] sec;
    logic [7:0] change_bcd, paid_bcd, paid, change;
    logic reset_flag;
    logic coin5_flag, coin10_flag;
    
    clken CLKEN( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .clk_flag(EnClk) );//1kHZ的使能时钟
    
    edge_det COIN5( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .i_btn(coin5), .posedge_flag(coin5_flag) );//检测coin5的上升沿
    edge_det COIN10( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .i_btn(coin10), .posedge_flag(coin10_flag) );//检测coin10的上升沿
    
    sec_clk Sec( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .start(open), .reset_flag(reset_flag) );//计时，亮10秒,显示10秒
    
    vend_fsm VEND( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .coin5_flag(coin5_flag), .coin10_flag(coin10_flag), .reset_flag(reset_flag), .paid(paid), .change(change), .open(open));//投币，状态转化

    bin2bcd_0 transfer_change(.bin(change), .bcd(change_bcd));//转换分为10进制数
    bin2bcd_0 transfer_paid(.bin(paid), .bcd(paid_bcd));//转换秒为10进制数

    an_ctrl An(.sys_clk(EnClk), .sys_rst_n(sys_rst_n), .an(an));//控制四个使能端
    FourLights FL( .an(an), .a_to_g(a_to_g), .change_bcd(change_bcd), .paid_bcd(paid_bcd) );//控制4个七段数码管
    
endmodule
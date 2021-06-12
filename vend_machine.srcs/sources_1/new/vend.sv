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
    
    clken CLKEN( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .clk_flag(EnClk) );//1kHZ��ʹ��ʱ��
    
    edge_det COIN5( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .i_btn(coin5), .posedge_flag(coin5_flag) );//���coin5��������
    edge_det COIN10( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .i_btn(coin10), .posedge_flag(coin10_flag) );//���coin10��������
    
    sec_clk Sec( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .start(open), .reset_flag(reset_flag) );//��ʱ����10��,��ʾ10��
    
    vend_fsm VEND( .sys_clk(sys_clk), .sys_rst_n(sys_rst_n), .coin5_flag(coin5_flag), .coin10_flag(coin10_flag), .reset_flag(reset_flag), .paid(paid), .change(change), .open(open));//Ͷ�ң�״̬ת��

    bin2bcd_0 transfer_change(.bin(change), .bcd(change_bcd));//ת����Ϊ10������
    bin2bcd_0 transfer_paid(.bin(paid), .bcd(paid_bcd));//ת����Ϊ10������

    an_ctrl An(.sys_clk(EnClk), .sys_rst_n(sys_rst_n), .an(an));//�����ĸ�ʹ�ܶ�
    FourLights FL( .an(an), .a_to_g(a_to_g), .change_bcd(change_bcd), .paid_bcd(paid_bcd) );//����4���߶������
    
endmodule
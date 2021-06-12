`timescale 1ns / 1ps
// Create Date: 2021/05/31 22:58:55

//������״̬��
module vend_fsm(
    input sys_clk, sys_rst_n,
    input coin5_flag,
    input coin10_flag,
    input reset_flag,
    output logic [7:0] paid,
    output logic [7:0] change,
    output logic open
    );
    
    
    //����Ͷ��Ͷ�˶���Ǯ
    logic [2:0] cstate, nstate;
        
        //��һ�Σ�ͬ��ʱ��ģ�飬��ʽ��������̬�Ĵ���Ǩ�Ƶ���̬�Ĵ���
        always_ff @(posedge sys_clk)begin
            if(!sys_rst_n)begin
                cstate <= 3'b000;
            end
            else
                cstate <= nstate;
        end
    
        //�ڶ���,����״̬ת�������ж�
        always_ff@(posedge sys_clk) begin
            if(!sys_rst_n)
                nstate <= 3'b000;
            else begin
                case(cstate)
                3'b000:begin//S0
                    if(coin5_flag == 1)
                        nstate = 3'b001;//S1
                    else if(coin10_flag == 1)
                        nstate = 3'b010;//S2
                end
                3'b001:begin//S1
                    if(coin5_flag == 1)
                        nstate = 3'b010;//S2
                    else if(coin10_flag == 1)
                        nstate = 3'b011;//S3
                end
                3'b010:begin//S2
                    if(coin5_flag == 1)
                        nstate = 3'b011;//S3
                    else if(coin10_flag == 1)
                        nstate = 3'b100;//S4
                end
                3'b011:begin//S3
                    if(reset_flag)
                        nstate = 3'b000;//S0
                    end
                3'b100:begin//S4
                    if(reset_flag)
                        nstate = 3'b000;//S0
                end
                default:nstate = 3'b000;
                endcase
            end
        end
    
        //������,����״̬�������
        always_ff @(posedge sys_clk)begin
            if(!sys_rst_n)begin//��λ
                open <= 1'b0;
                change <= 0;
                paid <= 0;
            end
            else begin
            
                if(nstate == 3'b100)begin//S4������20��
                    open <= 1'b1;
                    change <= 5;
                    paid <= 20;
                end
                else if(nstate == 3'b011)begin//S3������15��
                    open <= 1'b1;
                    change <= 0;
                    paid <= 15;
                end
                else begin//û����Ǯ
                    open <= 1'b0;
                    change <= 0;
                    if(nstate == 3'b000)
                        paid <= 0;
                    else if(nstate == 3'b001)
                        paid <= 5;
                    else if(nstate == 3'b010)
                        paid <= 10;
                end
                    
            end
        end
endmodule
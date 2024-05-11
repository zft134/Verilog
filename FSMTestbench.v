`timescale 1ns / 1ps  // ���÷����ʱ�䵥λΪ1���룬ʱ�侫��Ϊ1Ƥ��

module FSMTestbench;
  reg x, y, rst, clk;
  wire z;
    
  // ʵ����״̬��ģ��
  FSM uut (
    .z(z),
    .x(x),
    .y(y),
    .rst(rst),
    .clk(clk)
  );

  // ��ʼ�����벢��������
  initial #2000 $finish;  // ��2000������ʱ�䵥λ���������
    
  // ʱ���ź�����
  initial begin 
    clk = 0;               // ��ʼ��ʱ��Ϊ��
    forever #5 clk = ~clk; // ÿ5��ʱ�䵥λ��תʱ���ź�
  end
    
  // ��λ�źſ���
  initial begin
    rst = 1;    // ��ʼ�ø�λΪ��
    #20 rst = 0;  // 20��ʱ�䵥λ���ͷŸ�λ
    #150 rst = 1; // 150��ʱ�䵥λ���ٴθ�λ
    #10 rst = 0;  // 10��ʱ�䵥λ���ͷŸ�λ
  end
    
  // �����ź�����
  initial begin
    #16  {x,y} = 2'b10; // �л���״̬S2
    #30  {x,y} = 2'b01; // �л���״̬S3
    #10  {x,y} = 2'b10; // �л���״̬S1
    #10  {x,y} = 2'b01; // �л���״̬S3
    #10  {x,y} = 2'b01; // �л���״̬S2
    #10  {x,y} = 2'b10; // �л���״̬S1
    #10  {x,y} = 2'b10; // ά����״̬S1
	$stop;
  end

  // �����źű仯
  initial begin
    $monitor("Time = %t, x = %b, y = %b, z = %b, rst:%b", $time, x, y, z, rst);
  end

endmodule

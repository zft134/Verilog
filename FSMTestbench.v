`timescale 1ns / 1ps  // 设置仿真的时间单位为1纳秒，时间精度为1皮秒

module FSMTestbench;
  reg x, y, rst, clk;
  wire z;
    
  // 实例化状态机模块
  FSM uut (
    .z(z),
    .x(x),
    .y(y),
    .rst(rst),
    .clk(clk)
  );

  // 初始化输入并启动仿真
  initial #2000 $finish;  // 在2000个仿真时间单位后结束仿真
    
  // 时钟信号生成
  initial begin 
    clk = 0;               // 初始化时钟为低
    forever #5 clk = ~clk; // 每5个时间单位翻转时钟信号
  end
    
  // 复位信号控制
  initial begin
    rst = 1;    // 初始置复位为高
    #20 rst = 0;  // 20个时间单位后释放复位
    #150 rst = 1; // 150个时间单位后再次复位
    #10 rst = 0;  // 10个时间单位后释放复位
  end
    
  // 输入信号序列
  initial begin
    #16  {x,y} = 2'b10; // 切换到状态S2
    #30  {x,y} = 2'b01; // 切换到状态S3
    #10  {x,y} = 2'b10; // 切换到状态S1
    #10  {x,y} = 2'b01; // 切换到状态S3
    #10  {x,y} = 2'b01; // 切换到状态S2
    #10  {x,y} = 2'b10; // 切换到状态S1
    #10  {x,y} = 2'b10; // 维持在状态S1
	$stop;
  end

  // 监视信号变化
  initial begin
    $monitor("Time = %t, x = %b, y = %b, z = %b, rst:%b", $time, x, y, z, rst);
  end

endmodule

`timescale 1ns / 1ps  // 指定仿真的时间单位为1纳秒，时间精度为1皮秒。

// 定义模块dff，该模块用于实现一个4位宽的D触发器
module dff(
    output reg [3:0] q,  // 输出端口q，4位寄存器，存储触发器的当前状态
    input [3:0] d,       // 输入端口d，4位，用于设置触发器的目标状态
    input clk,           // 输入时钟信号clk，用于同步状态更新
    input rst,           // 输入复位信号rst，用于重置触发器状态到初始值
    input en             // 输入使能信号en，控制是否更新触发器的状态
);

// 描述触发器的行为，always块在时钟信号clk的上升沿触发
always @(posedge clk) begin
    if (rst) 
        q <= 4'b0001;       // 如果复位信号激活，则将输出q重置为0001
    else if (en) 
        q <= d;             // 如果使能信号激活，将输入d的值赋给输出q
end

endmodule

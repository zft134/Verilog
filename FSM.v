`timescale 1ns / 1ps  // 指定仿真的时间单位为纳秒和时间精度为皮秒

module FSM(
    output z,           // 定义输出变量z，不使用reg类型，直接通过D触发器控制
    input x, y,         // 定义输入变量x和y，用于接收外部信号。
    input rst,          // 定义输入复位信号rst，用于重置状态机到初始状态。
    input clk           // 定义输入时钟信号clk，用于同步状态转换。
);

// 定义状态编码，使用4位二进制数表示四种状态。
parameter S0 = 4'b0001;
parameter S1 = 4'b0010;
parameter S2 = 4'b0100;
parameter S3 = 4'b1000;

reg [3:0] nextstate; // 下一个状态的变量
wire [3:0] state;    // 当前状态，由D触发器维持
reg z_internal;      // 通过D触发器控制的内部z输出
wire [1:0] inxy;     // 组合输入x和y

assign inxy = {x, y}; // 将输入x和y组合成一个二位的二进制数

// 状态寄存器和输出z的D触发器实例化
dff state_reg(.d(nextstate), .clk(clk), .rst(rst), .q(state), .en(1'b1));
dff z_reg(.d(z_internal), .clk(clk), .rst(rst), .q(z), .en(1'b1));

// 组合逻辑块
always @* begin
    nextstate = state; // 默认保持当前状态
    z_internal = z;    // 默认保持当前输出
    case (state)  // 根据当前状态进行处理
        S0: begin
            if (inxy == 2'b10) begin
                nextstate = S2;
                z_internal = 0;
            end else if (inxy == 2'b01) begin
                nextstate = S3;
                z_internal = 1;
            end
        end
        S1: begin
            if (inxy == 2'b10) begin
                nextstate = S2;
                z_internal = 1;
            end else if (inxy == 2'b01) begin
                nextstate = S3;
                z_internal = 0;
            end
        end
        S2: begin
            if (inxy == 2'b10) begin
                nextstate = S1;
                z_internal = 0;
            end else if (inxy == 2'b01) begin
                nextstate = S3;
                z_internal = 1;
            end
        end
        S3: begin
            if (inxy == 2'b10) begin
                nextstate = S1;
                z_internal = 1;
            end else if (inxy == 2'b01) begin
                nextstate = S2;
                z_internal = 0;
            end
        end
        default: begin
            nextstate = S0; // 默认状态为S0
            z_internal = 0;
        end
    endcase
end

endmodule

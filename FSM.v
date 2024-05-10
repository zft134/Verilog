`timescale 1ns / 1ps  // 指定仿真的时间单位为纳秒和时间精度为皮秒

module FSM(
    output reg z,      // 定义输出变量z，使用reg类型，因为需要在always块中进行赋值操作。
    input x, y,        // 定义输入变量x和y，用于接收外部信号。
    input rst,         // 定义输入复位信号rst，用于重置状态机到初始状态。
    input clk          // 定义输入时钟信号clk，用于同步状态转换。
);

// 定义状态编码，使用4位二进制数表示四种状态。
parameter S0 = 4'b0001;
parameter S1 = 4'b0010;
parameter S2 = 4'b0100;
parameter S3 = 4'b1000;

reg [3:0] nextstate; // 下一个状态的变量
wire [3:0] state;    // 当前状态，由D触发器维持
reg en;              // 使能信号，控制状态寄存器是否更新
wire [1:0] inxy;     // 组合输入x和y

assign inxy = {x, y}; // 将输入x和y组合成一个二位的二进制数

// 状态寄存器的实例化，使用自定义的dff模块，控制状态的存储和更新。
dff dff0(.d(nextstate), .clk(clk), .rst(rst), .q(state), .en(en));

// 主要的逻辑控制块
always @(posedge clk or posedge rst) begin
    if (rst) begin
        nextstate = S0; // 如果复位，则状态设置为S0
        en = 1;         // 使能状态寄存器更新
        z = 0;          // 输出z重置为0
    end else begin
        en = 0;         // 默认不更新状态
        if (inxy != 2'b00 && inxy != 2'b11) begin  // 当输入不是00或11时，处理状态转换
            en = 1;     // 使能状态寄存器更新
            case (state)  // 根据当前状态进行处理
                S0: begin
                    if (inxy == 2'b10) begin
                        nextstate = S2;
                        z = 0;
                    end else if (inxy == 2'b01) begin
                        nextstate = S3;
                        z = 1;
                    end
                end
                S1: begin
                    if (inxy == 2'b10) begin
                        nextstate = S2;
                        z = 1;
                    end else if (inxy == 2'b01) begin
                        nextstate = S3;
                        z = 0;
                    end
                end
                S2: begin
                    if (inxy == 2'b10) begin
                        nextstate = S1;
                        z = 0;
                    end else if (inxy == 2'b01) begin
                        nextstate = S3;
                        z = 1;
                    end
                end
                S3: begin
                    if (inxy == 2'b10) begin
                        nextstate = S1;
                        z = 1;
                    end else if (inxy == 2'b01) begin
                        nextstate = S2;
                        z = 0;
                    end
                end
                default: begin
                    nextstate = S0; // 默认状态为S0
                    en = 1;         // 总是使能，以确保从非法状态恢复
                end
            endcase
        end
    end
end

endmodule

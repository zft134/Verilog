module ALUTestbench;

    reg [3:0] A, B; // 声明两个4位宽的输入寄存器 A 和 B
    reg [2:0] op; // 声明一个3位宽的操作码寄存器 op
    reg [3:0] counter; // 声明一个用于循环的计数器

    wire [3:0] out; // 输出结果（4位）
    wire cout, overflow, zero; // 声明进位输出、溢出和零标志信号

    // 实例化ALU模块
    ALU alu(out, cout, overflow, zero, A, B, op);
    
    // 测试过程
    initial begin
        // 打印头部，包括时间、输入和输出
        $monitor("Time = %0t, A = %b, B = %b, op = %b, Result = %b, Cout = %b, Overflow = %b, Zero = %b", $time, A, B, op, out, cout, overflow, zero);
        
        // 测试案例 1：A=1001, B=1010
        A = 4'b1001; B = 4'b1010;
        op = 3'b000; // 初始化操作码
        counter = 4'b0000; // 初始化计数器
        for (counter = 4'b0000; counter < 4'b1000; counter = counter + 1) begin
            op = counter[2:0]; // 设置操作码，只取counter的低三位
            #10; // 仿真时钟周期
        end
        
        // 测试案例 2：A=0011, B=1111
        A = 4'b0011; B = 4'b1111;
        op = 3'b000; // 重置操作码
        counter = 4'b0000; // 初始化计数器
        for (counter = 4'b0000; counter < 4'b1000; counter = counter + 1) begin
            op = counter[2:0]; // 设置操作码，只取counter的低三位
            #10; // 仿真时钟周期
        end
        
        // 测试案例 3：A=1100, B=1000
        A = 4'b1100; B = 4'b1000;
        op = 3'b000; // 重置操作码
        counter = 4'b0000; // 初始化计数器
        for (counter = 4'b0000; counter < 4'b1000; counter = counter + 1) begin
            op = counter[2:0]; // 设置操作码，只取counter的低三位
            #10; // 仿真时钟周期
        end
        
        // 所有测试案例结束完成后暂停仿真
        $stop;
    end

endmodule

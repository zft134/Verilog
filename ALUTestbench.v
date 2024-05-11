module ALUTestbench;

   // 声明输入 A、B 和操作（op）的寄存器
   reg [3:0] A, B;
   reg [2:0] op;

   // 声明输出 out、进位（cout）、溢出和零标志的连线
   wire [3:0] out;
   wire cout, overflow, zero;

   // 实例化 ALU 模块
   ALU uut(out, cout, overflow, zero, A, B, op);

   // 测试台初始化块
   initial begin
      // 打印头部，包括时间、输入和输出
      $monitor("Time = %0t, A = %b, B = %b, op = %b, Result = %b, Cout = %b, Overflow = %b, Zero = %b", $time, A, B, op, out, cout, overflow, zero);
      
      // 测试案例 1：A = 5，B = 5，op = 加法
      A = 4'b1010; B = 4'b1010; op = 3'b000; #10;
	  A = 4'b1010; B = 4'b1010; op = 3'b001; #10;
	  A = 4'b1010; B = 4'b1010; op = 3'b010; #10;
	  A = 4'b1010; B = 4'b1010; op = 3'b011; #10;
	  A = 4'b1010; B = 4'b1010; op = 3'b100; #10;
	  A = 4'b1010; B = 4'b1010; op = 3'b101; #10;
	  A = 4'b1010; B = 4'b1010; op = 3'b110; #10;
	  A = 4'b1010; B = 4'b1010; op = 3'b111; #10;
      // 测试案例 2：A = 3，B = -1，op = 减法
	  A = 4'b0011; B = 4'b1111; op = 3'b000; #10;
      A = 4'b0011; B = 4'b1111; op = 3'b001; #10;
	  A = 4'b0011; B = 4'b1111; op = 3'b010; #10;
	  A = 4'b0011; B = 4'b1111; op = 3'b011; #10;
	  A = 4'b0011; B = 4'b1111; op = 3'b100; #10;
	  A = 4'b0011; B = 4'b1111; op = 3'b101; #10;
	  A = 4'b0011; B = 4'b1111; op = 3'b110; #10;
	  A = 4'b0011; B = 4'b1111; op = 3'b111; #10;
      // 测试案例 3：A = -4，B = 8，op = 减法
      A = 4'b1100; B = 4'b1000; op = 3'b000; #10;
	  A = 4'b1100; B = 4'b1000; op = 3'b001; #10;
	  A = 4'b1100; B = 4'b1000; op = 3'b010; #10;
	  A = 4'b1100; B = 4'b1000; op = 3'b011; #10;
	  A = 4'b1100; B = 4'b1000; op = 3'b100; #10;
	  A = 4'b1100; B = 4'b1000; op = 3'b101; #10;
	  A = 4'b1100; B = 4'b1000; op = 3'b110; #10;
	  A = 4'b1100; B = 4'b1000; op = 3'b111; #10;
      // 所有测试案例完成后暂停仿真
      $stop;
   end

endmodule

module ALU(output [3:0] out, output cout, output overflow, output zero,
           input [3:0] A, B, 
           input [2:0] op);
   
   // 内部连线用于计算和、进位和相等性
   wire [3:0] sum;
   wire carry;
   wire equal;

   // 输出零标志指示结果是否为零
   // 当输出的所有位都为零时，该标志为真
   assign zero = (out == 4'b0000);

   // 输出进位标志直接赋值为进位
   assign cout = carry;
   
   // 根据加法或减法的结果计算溢出标志
   // 如果两个操作数都是正数且结果为负数，
   // 或者两个操作数都是负数且结果为正数，则会发生溢出
   assign overflow = ~A[3] & ~B[3] & sum[3] | A[3] & B[3] & ~sum[3];
   
   // 输出 out[3:0] 根据操作码（op）确定
   // 每个操作根据 op 的值分配到相应的输出
   // A + B
   // A - B
   // B - A
   // 传递 A
   // 传递 B
   // A AND B
   // A OR B
   // A XOR B
   assign out[3:0] = (op == 3'b000) ? A + B :
                     (op == 3'b001) ? A - B :
                     (op == 3'b010) ? B - A :
                     (op == 3'b011) ? A :
                     (op == 3'b100) ? B :
                     (op == 3'b101) ? (A & B) :
                     (op == 3'b110) ? (A | B) :
                                      (A ^ B);

   // 计算溢出标志所需的和和进位
   assign {carry, sum} = A + B;

endmodule

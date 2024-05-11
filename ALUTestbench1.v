module ALUTestbench;

    reg [3:0] A, B; // ��������4λ�������Ĵ��� A �� B
    reg [2:0] op; // ����һ��3λ��Ĳ�����Ĵ��� op
    reg [3:0] counter; // ����һ������ѭ���ļ�����

    wire [3:0] out; // ��������4λ��
    wire cout, overflow, zero; // ������λ�������������־�ź�

    // ʵ����ALUģ��
    ALU alu(out, cout, overflow, zero, A, B, op);
    
    // ���Թ���
    initial begin
        // ��ӡͷ��������ʱ�䡢��������
        $monitor("Time = %0t, A = %b, B = %b, op = %b, Result = %b, Cout = %b, Overflow = %b, Zero = %b", $time, A, B, op, out, cout, overflow, zero);
        
        // ���԰��� 1��A=1001, B=1010
        A = 4'b1001; B = 4'b1010;
        op = 3'b000; // ��ʼ��������
        counter = 4'b0000; // ��ʼ��������
        for (counter = 4'b0000; counter < 4'b1000; counter = counter + 1) begin
            op = counter[2:0]; // ���ò����룬ֻȡcounter�ĵ���λ
            #10; // ����ʱ������
        end
        
        // ���԰��� 2��A=0011, B=1111
        A = 4'b0011; B = 4'b1111;
        op = 3'b000; // ���ò�����
        counter = 4'b0000; // ��ʼ��������
        for (counter = 4'b0000; counter < 4'b1000; counter = counter + 1) begin
            op = counter[2:0]; // ���ò����룬ֻȡcounter�ĵ���λ
            #10; // ����ʱ������
        end
        
        // ���԰��� 3��A=1100, B=1000
        A = 4'b1100; B = 4'b1000;
        op = 3'b000; // ���ò�����
        counter = 4'b0000; // ��ʼ��������
        for (counter = 4'b0000; counter < 4'b1000; counter = counter + 1) begin
            op = counter[2:0]; // ���ò����룬ֻȡcounter�ĵ���λ
            #10; // ����ʱ������
        end
        
        // ���в��԰���������ɺ���ͣ����
        $stop;
    end

endmodule

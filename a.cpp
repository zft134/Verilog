#include <iostream>
#include <vector>

using namespace std;

int main() {
    // 定义变量length和两个vector数组sequence1和sequence2
    int length;
    cin >> length;
    vector<int> sequence1(length), sequence2(length);
    
    // 读取sequence1的length个元素
    for(int i = 0; i < length; i++) {
        cin >> sequence1[i];
    }
    
    // 读取sequence2的length个元素
    for(int i = 0; i < length; i++) {
        cin >> sequence2[i];
    }
    
    // 初始化计数器currentCount，sequence1和sequence2的索引index1和index2，以及临时变量currentElement
    int currentCount = 0, index1 = 0, index2 = 0, currentElement = 0;
    
    // 计算合并序列的中位数位置
    int medianPosition = (2 * length - 1) / 2;
    
    // 循环直到找到中位数位置的元素
    while(currentCount <= medianPosition) {
        // 如果sequence1的当前元素小于等于sequence2的当前元素
        if(index1 < length && (index2 >= length || sequence1[index1] <= sequence2[index2])) {
            // 将sequence1的当前元素赋值给临时变量currentElement，并增加sequence1的索引
            currentElement = sequence1[index1++];
        } else {
            // 否则，将sequence2的当前元素赋值给临时变量currentElement，并增加sequence2的索引
            currentElement = sequence2[index2++];
        }
        // 增加计数器currentCount
        currentCount++;
    }
    
    // 输出并集序列的中位数
    cout << currentElement << endl;
    
    // 返回0，表示程序成功结束
    return 0;
}


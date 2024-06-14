#include <iostream>
#include <vector>

using namespace std;

int main() {
    // �������length������vector����sequence1��sequence2
    int length;
    cin >> length;
    vector<int> sequence1(length), sequence2(length);
    
    // ��ȡsequence1��length��Ԫ��
    for(int i = 0; i < length; i++) {
        cin >> sequence1[i];
    }
    
    // ��ȡsequence2��length��Ԫ��
    for(int i = 0; i < length; i++) {
        cin >> sequence2[i];
    }
    
    // ��ʼ��������currentCount��sequence1��sequence2������index1��index2���Լ���ʱ����currentElement
    int currentCount = 0, index1 = 0, index2 = 0, currentElement = 0;
    
    // ����ϲ����е���λ��λ��
    int medianPosition = (2 * length - 1) / 2;
    
    // ѭ��ֱ���ҵ���λ��λ�õ�Ԫ��
    while(currentCount <= medianPosition) {
        // ���sequence1�ĵ�ǰԪ��С�ڵ���sequence2�ĵ�ǰԪ��
        if(index1 < length && (index2 >= length || sequence1[index1] <= sequence2[index2])) {
            // ��sequence1�ĵ�ǰԪ�ظ�ֵ����ʱ����currentElement��������sequence1������
            currentElement = sequence1[index1++];
        } else {
            // ���򣬽�sequence2�ĵ�ǰԪ�ظ�ֵ����ʱ����currentElement��������sequence2������
            currentElement = sequence2[index2++];
        }
        // ���Ӽ�����currentCount
        currentCount++;
    }
    
    // ����������е���λ��
    cout << currentElement << endl;
    
    // ����0����ʾ����ɹ�����
    return 0;
}


//
//  HeapsortController.m
//  AlgorithmStudy
//
//  Created by 陈舒澳 on 16/4/22.
//  Copyright © 2016年 speeda. All rights reserved.
//

#import "HeapsortController.h"
@interface HeapsortController ()

@end
@implementation HeapsortController
- (void)viewDidLoad{
    [self Heapsort];
}
/**  堆排序算法
 
    定义：堆排序是指利用堆这种数据结构所设计的一种排序算法。堆积是一个近似完全二叉树的结构，并同时满足堆积的性质：即子节点的键值或索引总是小于（或者大于）它的父节点。
 
    平均时间复杂程度：0(nlogn)
 
    耗时操作：初始化堆、反复调整堆 0(logn) + 0(n-1) * 0(logn) =  0(nlogn)
        1、初始化堆：每个父节点会和左右子节点进行最多2次比较和1次交换，所以复杂度跟父节点个数有关，0(logn)
        2、反复调整堆：由于初始化堆过程中，会记录数据比较结果，所以堆排序对原序列的数组顺序并不敏感，需要抽取n-1次堆顶元素，每次取堆顶元素都需要重建堆（0(重建堆)<0(初始化堆)） 0(n-1) * 0(logn)
 
 
    步骤：
        1、创建一个堆H[0...n-1] 无序
        2、把堆首（最大值）和堆尾互换
        3、把堆得尺寸缩小1，并调用shift_down(0)，目的是把新的数组顶端数据调整到相应位置
        4、重复步骤2，直到堆得尺寸为1.
 
 */
- (void)Heapsort{
    int a[] = {15,14,21,2,7,2,69,45,30};
//    bigHeapsort(a, sizeof(a)/sizeof(int));
    SmallHeapsort(a, sizeof(a)/sizeof(int));
    for (int i = 0; i < sizeof(a)/sizeof(int); i ++) {
         NSLog(@"---%d",a[i]);
    }
}
#pragma mark --- 最大堆排序
/**  最大堆排序
 *   特点：1、父节点的键值总是大于或者等于任何一个子节点的键值
 *        2、每个节点的左子树和右子树都有一个最大堆
 *
 */
void adjustMaxHeap(int a[], int len,int parentNodeIndex){
    if (len <= 0) {
        return;
    }
    //记录比父节点大的左孩子或者右孩子的索引
    int targetIndex = -1;
    //获取左右孩子的索引
    int leftChildIndex = 2 * parentNodeIndex + 1;
    int rightChildIndex = 2 * parentNodeIndex + 2;
    //没有左孩子
    if (leftChildIndex >= len) {
        return;
    }
    //有左孩子，没有右孩子
    if (rightChildIndex >= len) {
        targetIndex = leftChildIndex;
    }else{//左孩子右孩子都有,去左右孩子两者中最大的
        targetIndex = a[leftChildIndex] > a[rightChildIndex] ? leftChildIndex : rightChildIndex;
    }
    //只有孩子比父节点的值大，才需要交换
    if (a[targetIndex] > a[parentNodeIndex]) {
        int temp = a[targetIndex];
        a[targetIndex] = a[parentNodeIndex];
        a[parentNodeIndex] = temp;
        // 交换完成后，可能导致a[targetIndex]节点所形成的子树不满足堆得条件；因此还要继续调整使其成为堆
        adjustMaxHeap(a, len, targetIndex);
    }
    
}
void bigHeapsort(int a[],int len){
    if (len <= 1) {
        return;
    }
    // 初始化堆成无序最大堆
    initBigHeap(a, len);

    for (int i = len -1; i > 0; -- i) {
        /**
         *  将当前堆顶元素与最后一个元素交换，保证这一趟所查找的堆顶元素与最后一个元素交换
         *  注：这里所说的最后一个并不是a[len-1]，而是每一趟的范围中最后一个元素
         *  每一趟的改变都能保证堆顶的是最大的，
         *
         */
        if (a[0] > a[i]) {
            int temp = a[0];
            a[0] = a[i];
            a[i] = temp;
        }
        /**
         *  范围改变
         *  0...len-1
         *  0...len-2
         *  0...1
         *  其中，0是堆顶，每次都是找出在指定的范围内比堆顶还大的元素，然后与堆顶元素交换
         */
        adjustMaxHeap(a, i - 1, 0);
    }
    
}

/**   初始化堆
 *  从完全二叉树最后一个非子节点开始
 *  在数组中第一个元素的索引是0
 *  第n个元素的左孩子为2n + 1 ，右孩子为2n + 2；
 *  最后一个非子节点位置在 （n - 1)/2
 */
void initBigHeap(int a[],int len){
    for (int i = (len - 1) / 2; i >= 0; --i) {
        adjustMaxHeap(a,len, i);
    }

}
#pragma mark --- 最小堆排序
/**  最小堆排序
 *   特点：1、父节点的键值总是小于或者等于任何一个子节点的键值
 *        2、每个节点的左子树和右子树都有一个最小堆
 *
 */
void adjustMinHeap(int a[], int len,int parentNodeIndex){
    if (len <= 0) {
        return;
    }
    //记录比父节点小的左孩子或者右孩子的索引
    int targetIndex = -1;
    //获取左右孩子的索引
    int leftChildIndex = 2 * parentNodeIndex + 1;
    int rightChildIndex = 2 * parentNodeIndex + 2;
    //没有左孩子
    if (leftChildIndex >= len) {
        return;
    }
    //有左孩子，没有右孩子
    if (rightChildIndex >= len) {
        targetIndex = leftChildIndex;
    }else{//左孩子右孩子都有,去左右孩子两者中最小的
        targetIndex = a[leftChildIndex] < a[rightChildIndex] ? leftChildIndex : rightChildIndex;
    }
    //只有孩子比父节点的值小，才需要交换
    if (a[targetIndex] < a[parentNodeIndex]) {
        int temp = a[targetIndex];
        a[targetIndex] = a[parentNodeIndex];
        a[parentNodeIndex] = temp;
        // 交换完成后，可能导致a[targetIndex]节点所形成的子树不满足堆得条件；因此还要继续调整使其成为堆
        adjustMinHeap(a, len, targetIndex);
    }
    
}
void SmallHeapsort(int a[],int len){
    if (len <= 1) {
        return;
    }
    // 初始化堆成无序最大堆
    initSmallHeap(a, len);
    
    for (int i = len -1; i > 0; -- i) {
        /**
         *  将当前堆顶元素与最后一个元素交换，保证这一趟所查找的堆顶元素与最后一个元素交换
         *  注：这里所说的最后一个并不是a[len-1]，而是每一趟的范围中最后一个元素
         *  每一趟的改变都能保证堆顶的是最大的，
         *
         */
        if (a[0] < a[i]) {
            int temp = a[0];
            a[0] = a[i];
            a[i] = temp;
        }
        /**
         *  范围改变
         *  0...len-1
         *  0...len-2
         *  0...1
         *  其中，0是堆顶，每次都是找出在指定的范围内比堆顶还小的元素，然后与堆顶元素交换
         */
        adjustMinHeap(a, i - 1, 0);
    }
    
}

/**   初始化堆
 *  从完全二叉树最后一个非子节点开始
 *  在数组中第一个元素的索引是0
 *  第n个元素的左孩子为2n + 1 ，右孩子为2n + 2；
 *  最后一个非子节点位置在 （n - 1)/2
 */
void initSmallHeap(int a[],int len){
    for (int i = (len - 1) / 2; i >= 0; --i) {
        adjustMinHeap(a,len, i);
    }
    
}



















@end

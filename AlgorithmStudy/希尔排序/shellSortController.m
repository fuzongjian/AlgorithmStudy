//
//  shellSortController.m
//  AlgorithmStudy
//
//  Created by 陈舒澳 on 16/5/7.
//  Copyright © 2016年 speeda. All rights reserved.
//

#import "shellSortController.h"

@implementation shellSortController
- (void)viewDidLoad{
    [super viewDidLoad];
    int a[] = {15,14,21,2,7,2,69,45,30};
    [self shellSort:a len:sizeof(a)/sizeof(int)];
    for (int i = 0; i < sizeof(a)/sizeof(int); i ++) {
         NSLog(@"希尔排序---%d",a[i]);
    }
}
/*   希尔排序算法
 *  将无序数组分割为若干个子序列，子序列不是逐段分割的，而是相隔特定的增量的子序列，对各个子序列进行插入排序，然后再选择一个更小的增量，再讲数组
 *  分割为多个子序列进行排序...最后选择增量为1，即使用直接插入排序，是最终数组成为有序
 *  增量的选择
 *  在每趟的排序过程都有一个增量，至少满足一个规则增量管理d[1]>d[2]>d[3]>...d[t] = 1（t趟排序）；根据增量序列的选取其复杂度也会有变化，
 *  这里选择增量 n/2，以此递推，每次增量为原先的一半，直到增量为1
 *  平均时间复杂度
 *  希尔排序的时间复杂度和其增量序列有关系，涉及到数学上为尚未解决的难题，某些序列中复杂度可以为O(n 1.3)
 *  空间复杂度
 *  O(1)
 *  稳定性
 *  不稳定
 */
/**
 *  @brief 希尔排序
 *
 *  @param a   数组
 *  @param len 数组长度
 */
- (void)shellSort:(int[])a len:(int)len{
    // 在这里设置初始增量为数组长度的一半
    int d = len / 2;
    while (d >=1) {
        [self shellSort:a len:len zeng:d];
        // 每次增量变为上次的一半
        d = d / 2;
    }
}
/**
 *  @brief 希尔排序
 *
 *  @param a    数组
 *  @param len  数组长度
 *  @param zeng 此次排序增量
 */
- (void)shellSort:(int[])a len:(int)len zeng:(int)zeng{
    // 从第二个数据开始插入
    for (int i = zeng; i < len; i ++) {
        int j = i - zeng;
        // 记录要插入的数据
        int temp = a[i];
        // 从后向前，找到比其小的数的位置
        while (j >= 0 && a[j] > temp) {
            // 向后挪动
            a[j + zeng] = a[j];
            j -= zeng;
        }
        // 存在比其小的数
        if (j != i - zeng) {
            a[j + zeng] = temp;
        }
    }
}
@end

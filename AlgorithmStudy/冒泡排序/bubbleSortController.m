//
//  bubbleSortController.m
//  AlgorithmStudy
//
//  Created by 陈舒澳 on 16/5/7.
//  Copyright © 2016年 speeda. All rights reserved.
//

#import "bubbleSortController.h"

@implementation bubbleSortController
- (void)viewDidLoad{
    [super viewDidLoad];
    int a[] = {15,14,21,2,7,2,69,45,30};
    [self bubbleSort:a len:sizeof(a)/sizeof(int)];
    for (int i = 0; i < sizeof(a)/sizeof(int); i ++) {
         NSLog(@"冒泡排序---%d",a[i]);
    }
    
    
    int b[] = {15,14,21,2,7,2,69,45,30};
    [self selectSort:b len:sizeof(b)/sizeof(int)];
    for (int i = 0; i < sizeof(b)/sizeof(int); i ++) {
        NSLog(@" 选择排序---%d",b[i]);
    }
}
/*      冒泡排序算法
 *
 *
 *
 */
- (void)bubbleSort:(int[])a len:(int)len{
    for (int i = 0; i < len - 1; i ++) {
        for (int j = len - 1 ; j > i; j --) {
            if (a[j] > a[j-1]) {
                int temp = a[j];
                a[j] = a[j-1];
                a[j-1] = temp;
            }
        }
    }
}

/*      选择排序算法selectSort
 *  这个算法比较简单，无疑是利用双重循环，第一个数依次和后面的数进行判断，然后第二个数和后面的数进行判断，直到循环截止
 *  外层循环主要控制进行几轮比较    内层循环则是控制每轮比较的次数
 *  外层循环进行 len次   内层循环 len + len -1 + ... 0
 */
- (void)selectSort:(int[])a len:(int)len{
    int numOne = 0,numTwo = 0;
    for (int i = 0; i < len; i ++) {
        numOne ++;
        for (int j = i ; j < len; j ++) {
            numTwo ++;
            // 这里认为是由大到小排序
            if (a[i] < a[j +1]) {
                int temp = a[i];
                a[i] = a[j + 1];
                a[j +1] = temp;
            }
        }
    }
     NSLog(@"外层循环进行了%d次---内层循环进行了%d次",numOne,numTwo);
}
@end

//
//  FastSortController.m
//  AlgorithmStudy
//
//  Created by 陈舒澳 on 16/4/22.
//  Copyright © 2016年 speeda. All rights reserved.
//

#import "FastSortController.h"
@interface FastSortController ()
@end
@implementation FastSortController
- (void)viewDidLoad{
    [self FastSort];
    
}
/**  快速排序算法
 *
 */
- (void)FastSort{
    int a[] = {15,14,21,2,7,2,69,45,30};
    quickSort(a, 0, 9);
    for (int i = 0; i < sizeof(a)/sizeof(int); i ++) {
         NSLog(@"---%d",a[i]);
    }
}
void quickSort(int *a,int left,int right){
    
    if (left >= right) {
        return;
    }
    int base = a[left];
    int i = left,j = right;

    // 一趟快速排序（两边同时扫描）
    while (i < j) {
        while (i < j && a[j] >= base)
            j --;
            a[i] = a[j];
       
        while (i < j && a[i] <= base)
            i ++ ;
            a[j] = a[i];
    }
    a[i] = base;
    //快排左边部分
    quickSort(a, left, i -1);
    //快排右边部分
    quickSort(a, i + 1, right);
   
}
int partition(int a[],int left,int right){
    //每一次的划分，都让第一个元素作为基准
    int base = a[left];
    //记录刚开始的基准的位置，便于最后相遇时交换
    int baseIndex = left;
    while (left < right) {
        //查找右边部分比base还小的元素的下标
        while (left < right && a[right] >= base) {
            right --;
            a[left] = a[right];
        }
        //查找左部分比base还大的元素的下标
        while (left < right && a[left] <= base) {
            left ++;
            a[right] = a[left];
        }
        //将这一趟比基准大和比基准小的所找到的第一个值，互相交换
        swap(a, left, right);
    }
    // 在left与right相遇时，将基准数与相遇点交换
    // 这一次划分后，就可以保证左边的比基准数小，右边的比基准数大
    swap(a, baseIndex, left);
    // 划分完成后，以left位置的元素作为新的基准，分成左右序列，分别递归排序
    return left;
}
void swap(int a[],int i, int j){
    int temp = a[i];
    a[i] = a[j];
    a[j] = temp;
}
@end

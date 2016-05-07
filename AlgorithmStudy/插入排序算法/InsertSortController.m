//
//  InsertSortController.m
//  AlgorithmStudy
//
//  Created by 陈舒澳 on 16/4/22.
//  Copyright © 2016年 speeda. All rights reserved.
//

#import "InsertSortController.h"

@implementation InsertSortController
- (void)viewDidLoad{
    [self insertSort];
}
/**  插入排序
 *  插入排序就是每一步都将一个待排数据按其大小插入到已经排序的数据中的适当位置，直到全部插入完毕。 
 *
 *  1、直接插入排序
 *  2、折半插入排序
 */

- (void)insertSort{
    int a[] = {15,14,21,2,7,2,69,45,30};
    [self insert:a len:sizeof(a)/sizeof(int)];
    
    for (int i = 0; i < sizeof(a)/sizeof(int); i ++) {
         NSLog(@"直接插入---%d",a[i]);
    }
    
    int b[] = {15,14,21,2,7,2,69,45,30};
    [self insertMiddle:b len:sizeof(b)/sizeof(int)];
    for (int i = 0; i < sizeof(b)/sizeof(int); i ++) {
        NSLog(@"折半插入---%d",b[i]);
    }
    
}

#pragma mark --- 折半插入排序
- (void)insertMiddle:(int[])a len:(int)len{
    //保存中间插入的值
    int insert = 0;
    
    for (int i = 1; i < len; i ++) {
        int low = 0;
        int high = i -1;
        insert = a[i];
        //不断的折半
        while (low <= high) {
            // 找出中间值
            int middle = (low + high)/2;
            // 如果大于中间值
            if (a[i] > a[middle]) {
                // 在大于中间值得那部分查找
                low = middle + 1;
            }else{
                // 在小于中间值得那部分查找
                high = middle - 1;
            }
        }
        //将整体数组向后移
        for (int j = i ; j > low ; j--) {
            a[j] = a[j - 1];
        }
        // 插入到指定的位置
        a[low] = insert;
    }
}
#pragma mark --- 直接插入排序
- (void)insert:(int[])a len:(int)len{
    for (int i = 1; i < len; i++ ) {
        //遇到乱序的才进行移动元素
        if (a[i] < a[i -1]) {
            int target = a[i];
            // 移动前j-1元素，分别向后移动一个位置

            int j = i;
            while (j > 0 && a[j - 1] > target) {
                a[j] = a[j-1];
                j --;
            }
            // 将目标元素放到目标位置，使之有序
            a[j] = target;
        }
    }
}
@end

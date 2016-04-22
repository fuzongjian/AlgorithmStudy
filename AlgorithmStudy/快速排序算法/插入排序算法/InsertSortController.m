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
 *  1、直接插入排序
 *  2、折半插入排序
 */
- (void)insertSort{
    int a[] = {15,14,21,2,7,2,69,45,30};
    insert(a);
    for (int i = 0; i < sizeof(a)/sizeof(int); i ++) {
         NSLog(@"---%d",a[i]);
    }
}
void insert(int *a){
    for (int i = 1; i < sizeof(a)/sizeof(int); ++i ) {
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

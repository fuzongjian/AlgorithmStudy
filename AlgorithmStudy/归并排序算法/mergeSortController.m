//
//  mergeSortController.m
//  AlgorithmStudy
//
//  Created by 陈舒澳 on 16/5/7.
//  Copyright © 2016年 speeda. All rights reserved.
//

#import "mergeSortController.h"

@implementation mergeSortController
- (void)viewDidLoad{
    [super viewDidLoad];
    int a[] = {15,14,21,2,7,2,69,45,30};
    
    int * tempArray = (int *)malloc(sizeof(a));
    mergeSortHelp(a, tempArray, 0, sizeof(a)/sizeof(int));
    free(tempArray);
    
    
    for (int i = 0 ; i < sizeof(a)/sizeof(int); i ++) {
         NSLog(@"归并排序算法%d",a[i]);
    }
}
/*  归并排序算法
 *  把原始数组分成若干子数组，对每一个子数组进行排序合并，直到该数组形成有序的数组
 *  平均时间复杂程度 O(nlog2n)
 *  稳定性：稳定
 */

/**
 *  @brief 归并排序  将一个无序序列分厂长度位1的序列，然后两两归并
 */
void mergeSortHelp(int *data, int *temData, int first, int last){
    if (first < last) {
        int middle = (first + last) /2;
        mergeSortHelp(data, temData, first, middle);
        mergeSortHelp(data, temData, middle + 1, last);
        mergeSort(data, temData, first, middle, last);
    }
}
/**
 *  @brief 归并排序 核心算法
 *
 *  @param a      原无序数组
 *  @param b      临时数组
 *  @param start  需要合并的序列1起始位置
 *  @param middle 需要合并的序列1结束位置并作为序列2开始位置
 *  @param end    需要合并的序列2的结束位置
 */
void mergeSort(int *data,int * tmpData,int first,int mid,int last){
    int i,j,k;
    for(i=first,j=mid+1,k=first;i<=mid && j<=last;k++)
    {
        if(data[i]<=data[j])
        {
            tmpData[k]=data[i];
            i++;
        }
        else
        {
            tmpData[k]=data[j];
            j++;
        }
        
    }
    
    for(;i<=mid;i++,k++)
        tmpData[k]=data[i];
    
    for(;j<=last;j++,k++)
        tmpData[k]=data[j];
    
    for(i=first;i<=last;i++)
        data[i]=tmpData[i];

}
@end

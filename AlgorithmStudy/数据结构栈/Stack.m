//
//  Stack.m
//  AlgorithmStudy
//
//  Created by 陈舒澳 on 16/4/22.
//  Copyright © 2016年 speeda. All rights reserved.
//

#import "Stack.h"
#define max 9
@interface Stack ()
@property (nonatomic,strong) NSMutableArray * list;
@property (nonatomic,assign) NSInteger  top;
@end
@implementation Stack
- (instancetype)init{
    if (self = [super init]) {
        self.top = - 1;
    }
    return self;
}
- (id)pop{
    if ([self isEmpty]) {
        NSException * exception = [NSException exceptionWithName:@"pop" reason:@"underflow" userInfo:nil];
        @throw exception;
    }
    return self.list[self.top--];
}
- (id)peek{
    if ([self isEmpty]) {
        NSException * exception = [NSException exceptionWithName:@"peek" reason:@"underflow" userInfo:nil];
        @throw exception;
    }
    return self.list[self.top];
}
- (BOOL)isEmpty{
    return self.top == -1;
}
- (BOOL)push:(id)object{
    if (self.top + 1 >= max) {
        NSException * exception = [NSException exceptionWithName:@"push" reason:@"overflow" userInfo:nil];
        @throw exception;
    }
    self.list[++self.top] = object;
    return YES;
}
- (NSMutableArray *)list{
    if (_list == nil) {
        _list = [[NSMutableArray alloc] initWithCapacity:max];
    }
    return _list;
}
@end

//
//  Stack.h
//  AlgorithmStudy
//
//  Created by 陈舒澳 on 16/4/22.
//  Copyright © 2016年 speeda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject
- (id)pop;//出栈
- (BOOL)push:(id)object;//进栈
- (id)peek;//取栈顶元素
- (BOOL)isEmpty;//判断是否栈空
@end

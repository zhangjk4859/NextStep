//
//  TestObject.m
//  block强弱引用
//
//  Created by kevin on 2017/7/6.
//  Copyright © 2017年 kevin. All rights reserved.
//

#import "TestObject.h"

#define jKLog(...) NSLog(__VA_ARGS__)

@interface TestObject()

@end

@implementation TestObject

-(instancetype)init{
    
    
    if (self = [super init]) {
        __weak typeof(self)weakSelf = self;
        self.block = ^{
            __strong typeof(weakSelf)strongSelf = weakSelf;//告诉block，暂时先引用，等代码块结束了，再释放，如果直接用self，block就会一直抓住不放
            dispatch_async(dispatch_get_global_queue(0, 0), ^{//异步子线程执行，不用等当前排队
                [NSThread sleepForTimeInterval:1];//一秒后执行
                NSLog(@"%@",strongSelf);//先打印，后释放
            });
        };
    }
    return self;
}

-(void)dealloc{
    NSLog(@"%s",__func__);//打印function 用s
}

@end

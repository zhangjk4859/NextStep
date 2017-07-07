//
//  TestObject.h
//  block强弱引用
//
//  Created by kevin on 2017/7/6.
//  Copyright © 2017年 kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestObject : NSObject
@property(nonatomic,copy)void(^block)();
@end

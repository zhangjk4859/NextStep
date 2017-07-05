//
//  NSObject+category.m
//  应对实例没有实现消息的防御
//
//  Created by kevin on 2017/7/5.
//  Copyright © 2017年 kevin. All rights reserved.
//

#import "NSObject+category.h"
#import <objc/runtime.h>

@implementation NSObject (category)
-(id)forwardingTargetForSelector:(SEL)aSelector{
    
    NSString *selectorStr = NSStringFromSelector(aSelector);
    // 做一次类的判断，只对 UIResponder 和 NSNull 有效
    if ([[self class] isSubclassOfClass: NSClassFromString(@"UIResponder")] ||
        [self isKindOfClass: [NSNull class]])
    {
        NSLog(@"PROTECTOR: -[%@ %@]", [self class], selectorStr);
        NSLog(@"PROTECTOR: unrecognized selector \"%@\" sent to instance: %p", selectorStr, self);
        // 查看调用栈
        NSLog(@"PROTECTOR: call stack: %@", [NSThread callStackSymbols]);
        
        // 对保护器插入该方法的实现
        Class protectorCls = NSClassFromString(@"Protector");
        if (!protectorCls)
        {
            protectorCls = objc_allocateClassPair([NSObject class], "Protector", 0);
            objc_registerClassPair(protectorCls);
        }
        
        // 检查类中是否存在该方法，不存在则添加
        if (![self isExistSelector:aSelector inClass:protectorCls])
        {
            class_addMethod(protectorCls, aSelector, [self safeImplementation:aSelector],
                            [selectorStr UTF8String]);
        }
        
        Class Protector = [protectorCls class];
        id instance = [[Protector alloc] init];
        
        return instance;
    }
    else
    {
        return nil;
    }
    
}


// 一个安全的方法实现
- (IMP)safeImplementation:(SEL)aSelector
{
    IMP imp = imp_implementationWithBlock(^()
                                          {
                                              NSLog(@"PROTECTOR: %@ Done", NSStringFromSelector(aSelector));
                                          });
    return imp;
}


// 判断某个class中是否存在某个SEL
- (BOOL)isExistSelector: (SEL)aSelector inClass:(Class)currentClass
{
    BOOL isExist = NO;
    unsigned int methodCount = 0;
    Method *methods = class_copyMethodList(currentClass, &methodCount);
    
    for (int i = 0; i < methodCount; i++)
    {
        Method temp = methods[i];
        SEL sel = method_getName(temp);
        NSString *methodName = NSStringFromSelector(sel);
        if ([methodName isEqualToString: NSStringFromSelector(aSelector)])
        {
            isExist = YES;
            break;
        }
    }
    return isExist;
}

@end

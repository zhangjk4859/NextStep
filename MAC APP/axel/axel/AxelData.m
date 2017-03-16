//
//  AxelData.m
//  axel
//
//  Created by 张俊凯 on 2017/3/13.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

#import "AxelData.h"

@implementation AxelData
-(instancetype)initWithTitle:(NSString *)title rating:(float)rating
{
    if (self = [super init]) {//如果初始化成功
        self.title = title;
        self.rating = rating;
    }
    return self;
}
@end

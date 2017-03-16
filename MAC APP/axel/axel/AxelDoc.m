//
//  AxelDoc.m
//  axel
//
//  Created by 张俊凯 on 2017/3/13.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

#import "AxelDoc.h"
#import "AxelData.h"

@implementation AxelDoc
-(instancetype)initWithTitle:(NSString *)title rating:(float)rating thumbImage:(NSImage *)thumbImage fullImage:(NSImage *)fullImage
{
    if (self = [super init]) {
        self.data = [[AxelData alloc] initWithTitle:title rating:rating];
        self.thumbImage = thumbImage;
        self.fullImage = fullImage;
    }
    return self;
}
@end

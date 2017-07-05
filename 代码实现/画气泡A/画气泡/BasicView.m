//
//  BasicView.m
//  画气泡
//
//  Created by kevin on 2017/7/4.
//  Copyright © 2017年 kevin. All rights reserved.
//

#import "BasicView.h"

@implementation BasicView

-(void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"BasicView layoutSubviews");
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.



//view 被加载完之后开始调用，开始画

//view改变了尺寸就会重新画，比如 size to fit，

//contentMode 设置为 redraw ,改变了尺寸，重画

// set need display 设置需要的显示，（frame改变）就会重画

// set need layout  和 set need display 都会改变frame 导致重画，

//set need display 直接调用 drawRect ，重写就得重画

//UIView 是 drawRect 方法，CALayer 是 drawInContext 方法

//touchBegin 直接调用的是 set need display 方法
- (void)drawRect:(CGRect)rect {
    
//    NSLog(@"BasicView drawRect");
}


@end

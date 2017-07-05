//
//  PopView.m
//  画气泡
//
//  Created by kevin on 2017/7/4.
//  Copyright © 2017年 kevin. All rights reserved.
//

#import "PopView.h"
@interface PopView()
@property(nonatomic,assign)CGPoint arrowPosition;
@end

static CGFloat arrowWidth = 16;
static CGFloat arrowHeight = 8;

#define DEGREES_TO_RADIANS(degrees)  ((3.14159265359 * degrees)/ 180)

@implementation PopView


//1.先布局子视图
-(void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"PopView layoutSubviews");
    
    self.arrowPosition = CGPointMake(self.frame.origin.x + self.frame.size.width / 2, self.frame.size.width);
    
    CGFloat anchor = self.arrowPosition.x / self.frame.size.width;
    self.layer.anchorPoint = (CGPoint){ anchor, 1 };
    self.layer.position = (CGPoint){ self.layer.position.x + self.frame.size.width * anchor, self.layer.position.y + self.frame.size.height / 2 };
}


//2.再画，任何时候，画好了才显示      ce
// 自定义画
// 空方法在动画时会影响性能
- (void)drawRect:(CGRect)rect {
    //把自己画成一个气泡的形式
    
    
    //三大步骤
    //1.绘图区域上底色
    [[UIColor yellowColor] setFill];//关键语句一
    
    //2.用path裁剪画板
    CGFloat margin = 10;
    CGFloat cornerRadius = (100 - margin)* 0.5;//外界给的宽高度的一半
    CGFloat borderWidth = 5;
    CGRect baloonFrame = CGRectMake(margin, margin, self.frame.size.width - margin * 2, self.frame.size.height - margin * 2);
    UIBezierPath *path;
    
    
    [path moveToPoint:(CGPoint){ self.arrowPosition.x + borderWidth, self.arrowPosition.y - borderWidth }];
    [path addLineToPoint:(CGPoint){ borderWidth + self.arrowPosition.x + arrowWidth / 2, self.arrowPosition.y - arrowHeight - borderWidth }];
    [path addLineToPoint:(CGPoint){ baloonFrame.size.width - cornerRadius, baloonFrame.origin.y + baloonFrame.size.height + borderWidth }];
    [path addArcWithCenter:(CGPoint){ baloonFrame.size.width - cornerRadius, baloonFrame.origin.y + baloonFrame.size.height - cornerRadius + borderWidth } radius:cornerRadius startAngle:DEGREES_TO_RADIANS(90) endAngle:DEGREES_TO_RADIANS(0) clockwise:NO];
    [path addLineToPoint:(CGPoint){ baloonFrame.size.width, baloonFrame.origin.y + cornerRadius + borderWidth }];
    [path addArcWithCenter:(CGPoint){ baloonFrame.size.width - cornerRadius, baloonFrame.origin.y + cornerRadius + borderWidth } radius:cornerRadius startAngle:DEGREES_TO_RADIANS(0) endAngle:DEGREES_TO_RADIANS(270) clockwise:NO];
    [path addLineToPoint:(CGPoint){ borderWidth + cornerRadius, baloonFrame.origin.y + borderWidth }];
    [path addArcWithCenter:(CGPoint){ borderWidth + cornerRadius, baloonFrame.origin.y + cornerRadius + borderWidth } radius:cornerRadius startAngle:DEGREES_TO_RADIANS(270) endAngle:DEGREES_TO_RADIANS(180) clockwise:NO];
    [path addLineToPoint:(CGPoint){ borderWidth, baloonFrame.origin.y + baloonFrame.size.height - cornerRadius + borderWidth }];
    [path addArcWithCenter:(CGPoint){ borderWidth + cornerRadius, baloonFrame.origin.y + baloonFrame.size.height - cornerRadius + borderWidth } radius:cornerRadius startAngle:DEGREES_TO_RADIANS(180) endAngle:DEGREES_TO_RADIANS(90) clockwise:NO];
    [path addLineToPoint:(CGPoint){ borderWidth + self.arrowPosition.x - arrowWidth / 2, self.arrowPosition.y - arrowHeight - borderWidth }];
    [path closePath];
    
    
    
    [path fill];//关键语句二
    
   
    //3.设置path边框宽度颜色
    [path setLineWidth:borderWidth];
    [[UIColor greenColor] setStroke];
    [path stroke];
    
    
    
    
}

//画一个有边距的圆
/*
- (void)drawRect:(CGRect)rect {
    //把自己画成一个气泡的形式
    
    
    //三大步骤
    //1.绘图区域上底色
    [[UIColor yellowColor] setFill];//关键语句一
    
    //2.用path裁剪画板
    CGFloat margin = 10;
    CGFloat cornerRadius = (100 - margin)* 0.5;//外界给的宽高度的一半
    CGFloat borderWidth = 5;
    CGRect frame = CGRectMake(margin, margin, self.frame.size.width - margin * 2, self.frame.size.height - margin * 2);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:cornerRadius];
    [path fill];//关键语句二
    
    
    //3.设置path边框宽度颜色
    [path setLineWidth:borderWidth];
    [[UIColor greenColor] setStroke];
    [path stroke];
    
}
*/

@end

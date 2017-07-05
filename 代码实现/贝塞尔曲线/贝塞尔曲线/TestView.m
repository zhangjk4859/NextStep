//
//  TestView.m
//  贝塞尔曲线
//
//  Created by kevin on 2017/7/5.
//  Copyright © 2017年 kevin. All rights reserved.
//

#import "TestView.h"

@implementation TestView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 3.0;
    aPath.lineCapStyle = kCGLineCapRound; //线条末梢
    aPath.lineJoinStyle = kCGLineCapRound; //连接点处理
    
    // Set the starting point of the shape.
    [aPath moveToPoint:CGPointMake(100.0, 100.0)];
    
    /*
    // 五边形
    [aPath addLineToPoint:CGPointMake(200.0, 140.0)];
    [aPath addLineToPoint:CGPointMake(160, 240)];
    [aPath addLineToPoint:CGPointMake(40.0, 240)];
    [aPath addLineToPoint:CGPointMake(0.0, 140.0)];
    [aPath closePath];//第五条线通过调用closePath方法得到的
    */
    // triangle  等边三角形
    [aPath moveToPoint:CGPointMake(100.0, 100.0)];
    [aPath addLineToPoint:CGPointMake(200.0, 100 + 173.20508075689)];
    [aPath addLineToPoint:CGPointMake(0, 100 + 173.20508075689)];
    [aPath closePath];//第五条线通过调用closePath方法得到的
    
    //设置内部填充颜色
    [[UIColor redColor] setFill];
    [aPath fill];
    
    //设置条件颜色
    [[UIColor greenColor] setStroke];
    [aPath stroke];
}


@end

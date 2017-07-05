//
//  TestView.m
//  贝塞尔曲线
//
//  Created by kevin on 2017/7/5.
//  Copyright © 2017年 kevin. All rights reserved.
//

#import "TestView.h"

#define pi 3.14159265359
#define   DEGREES_TO_RADIANS(degrees)  (pi * (degrees/ 180))

@implementation TestView


//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    
//    
//    
//    
////    UIBezierPath* aPath = [UIBezierPath bezierPath];
//    //椭圆形
//    //UIBezierPath* aPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 200)];
//    //矩形
//    //UIBezierPath* aPath = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200, 100)];
//    //弧形线条
//    //UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:50 startAngle:DEGREES_TO_RADIANS(0) endAngle:DEGREES_TO_RADIANS(180) clockwise:YES];
//    /*
//    //二次贝塞尔曲线
//    UIBezierPath* aPath = [UIBezierPath bezierPath];
//    [aPath moveToPoint:CGPointMake(100, 100)];
//    [aPath addQuadCurveToPoint:CGPointMake(200, 100) controlPoint:CGPointMake(200, 200)];
//     */
//    /*
//    //三次贝塞尔曲线
//    UIBezierPath* aPath = [UIBezierPath bezierPath];
//    [aPath moveToPoint:CGPointMake(100, 100)];
//    [aPath addCurveToPoint:CGPointMake(300, 50) controlPoint1:CGPointMake(180, 0) controlPoint2:CGPointMake(220, 200)];
//     */
//    /*CG底层的方法 自定义路径
//    //用CGPath先设定好路径，在赋值给BezierPath
//    CGMutablePathRef cgPath = CGPathCreateMutable();//可添加的路径，多重路径
//    CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(0, 0, 300, 300));//外围大圆
//    CGPathAddEllipseInRect(cgPath, NULL, CGRectMake(50, 50, 200, 200));//内圈小圆
//    
//    UIBezierPath* aPath = [UIBezierPath bezierPath];
//    aPath.CGPath = cgPath;
//    aPath.usesEvenOddFillRule = YES;
//    CGPathRelease(cgPath);
//     */
//    /*把path的路径拿出来，经过加工后再赋值回去
//    UIBezierPath *aPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 300, 300)];
//    CGPathRef cgPath = aPath.CGPath;//底层路径拿出来
//    CGMutablePathRef  mutablePath = CGPathCreateMutableCopy(cgPath);//转换成可变底层路径
//    CGPathAddEllipseInRect(mutablePath, NULL, CGRectMake(50, 50, 200, 200));
//    aPath.CGPath = mutablePath;//画一个圆，赋值回去
//    CGPathRelease(mutablePath);
//    */
//    
//    /*画板挪动 产生效果*/
//    UIBezierPath* aPath = [UIBezierPath bezierPathWithOvalInRect:
//                           CGRectMake(0, 0, 200, 100)];
//    //把当前的画板拿出来，挪一下位置
//    CGContextRef aRef = UIGraphicsGetCurrentContext();
//    CGContextTranslateCTM(aRef, 50, 50);
//    
//    //CGContextSaveGState(aRef); 保存移动后的状态
//    //CGContextRestoreGState(aRef); 画别的东西前 重置一下画板
//    
//    aPath.lineWidth = 3.0;
//    aPath.lineCapStyle = kCGLineCapRound; //线条末梢
//    aPath.lineJoinStyle = kCGLineCapRound; //连接点处理
//    
//    // Set the starting point of the shape.
////    [aPath moveToPoint:CGPointMake(100.0, 100.0)];
//    
//    /*
//    // 五边形
//    [aPath addLineToPoint:CGPointMake(200.0, 140.0)];
//    [aPath addLineToPoint:CGPointMake(160, 240)];
//    [aPath addLineToPoint:CGPointMake(40.0, 240)];
//    [aPath addLineToPoint:CGPointMake(0.0, 140.0)];
//    [aPath closePath];//第五条线通过调用closePath方法得到的
//    */
//    /*
//    // triangle  等边三角形
//    [aPath moveToPoint:CGPointMake(100.0, 100.0)];
//    [aPath addLineToPoint:CGPointMake(200.0, 100 + 173.20508075689)];
//    [aPath addLineToPoint:CGPointMake(0, 100 + 173.20508075689)];
//    [aPath closePath];//第五条线通过调用closePath方法得到的
//     */
//    
//    
//    //设置内部填充颜色
//    [[UIColor redColor] setFill];
//    [aPath fill];
//    
//    //设置条件颜色
//    [[UIColor greenColor] setStroke];
//    [aPath stroke];
//}



-(void)drawRect:(CGRect)rect{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawArc:context];
}

-(void)drawArc:(CGContextRef)context{
    /*添加弧形对象
     x:中心点x坐标
     y:中心点y坐标
     radius:半径
     startAngle:起始弧度
     endAngle:终止弧度
     closewise:是否逆时针绘制，0则顺时针绘制
     右边0点，左边π点 上负下正
     */
    
    //上下两种方法的区别是 生成path 默认是在画板上生成的，这里的方法是 直接拿画板来操作
    
    //先在画板上设定一个弧形
    CGContextAddArc(context, 160, 160, 100.0, 0.0, M_PI, 0);
    
    //设置填充颜色和线条颜色
    [[UIColor redColor] setStroke];
    [[UIColor whiteColor] setFill];
    
    //在画板上根据之前设置绘制路径
    CGContextDrawPath(context, kCGPathEOFillStroke);
}

@end

//
//  DrawView.m
//  04-基本线条绘制
//
//  Created by LXF on 2016/12/4.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

/**
 *  作用： 专门用来绘图
 *
 *  @param rect 当前view的bounds
 */
- (void)drawRect:(CGRect)rect {
    // 在drawRect方法当中系统已经帮你创建了一个跟View相关联的上下文
    // 只要获取上下文就行了
    
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 画曲线
    // 2.1 设置起点
    [path moveToPoint:CGPointMake(50, 280)];
    // 2.2 添加一条曲线到某一个点
    [path addQuadCurveToPoint:CGPointMake(250, 280) controlPoint:CGPointMake(50, 50)];
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.把上下文的内容渲染到View上
    CGContextStrokePath(ctx);
}

#pragma mark - 画直线
- (void)drawLine {
    // 1.获取上下文(获取/创建上下文 都UIGraphics以开头)
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.绘制路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 2.1 设置起点
    [path moveToPoint:CGPointMake(50, 280)];
    // 2.2 添加一根线到终点
    [path addLineToPoint:CGPointMake(250, 50)];
    
    // 画第二条线
//    [path moveToPoint:CGPointMake(100, 280)];
//    [path addLineToPoint:CGPointMake(250, 100)];
    
    // addLineToPoint: 把上一条线的终点当作是下一条线的起点
    [path addLineToPoint:CGPointMake(200, 280)];
    
    // 上下文的状态
    // 设置线的宽度
    CGContextSetLineWidth(ctx, 10);
    // 设置线的连接样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    // 设置线的顶角样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    // 设置颜色
    [[UIColor redColor] set];
    
    // 3.把绘制的内容保存到上下文当中
    // UIBezierPath:UIKit框架  ->  CGContextRef:CoreGraphics框架
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.把上下文的内容显示到View上(渲染到View的layer)
    CGContextStrokePath(ctx);
}


@end

//
//  DrawView.m
//  05-图形绘制
//
//  Created by LXF on 2016/12/4.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect {
    // 画弧
    // center:      弧所在的圆心
    // radius:      圆的半径
    // startAngle:  开始角度
    // endAngle:    截至角度
    // clockwise：   YES: 顺时针  NO: 逆时针
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:-M_PI_2 clockwise:NO];
    
    // 画扇形
    // 添加一条线到圆心
    [path addLineToPoint:center];
    // 关闭路径
    [path closePath];
    
    [path stroke];
    
    // [path fill]; 如果是调用填充，则不用调用[path closePath]，因为在填充之前，它会自动关闭路径
}

#pragma mark - 画椭圆
- (void)drawOval {
    // 画椭圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 50)];
    
    // 设置线宽
    [path setLineWidth:10];
    
    // 使用UIBezierPath提供的绘图方法进行绘制
    [path stroke];
    // [path stroke]: 1.获取图形上下文 -> 2.描述路径 -> 3.把路径添加到上下文 -> 4.把上下文的内容渲染到view上
}

#pragma mark - 画矩形
- (void)drawRect {
    // 1.获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.描述路径
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 100)];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 100, 100) cornerRadius:50];
    
    [[UIColor redColor] set];
    
    // 3.把路径添加到上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.把上下文的内容渲染到view上
    // CGContextStrokePath(ctx);   // 描边
    CGContextFillPath(ctx);     // 填充
}

@end

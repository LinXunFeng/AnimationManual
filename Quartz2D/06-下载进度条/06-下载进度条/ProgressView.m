//
//  ProgressView.m
//  06-下载进度条
//
//  Created by LXF on 2016/12/4.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView
#pragma mark - setter
- (void)setProgressValue:(CGFloat)progressValue {
    _progressValue = progressValue;
    
    // 注意： drawRect如果是手动调用的话，它是不会给你创建跟view相关联的上下文
    // 只有系统调用该方法时，才会创建跟view相关联的上下文
//    [self drawRect:self.bounds];
    
    // 重绘(系统自动帮你调用drawRect:)
    [self setNeedsDisplay];
}

#pragma mark - 绘制进度条
- (void)drawRect:(CGRect)rect {
    // 画弧
    // 1.获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.描述路径
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startA = -M_PI_2;
    CGFloat angle = self.progressValue * M_PI * 2;
    CGFloat endA = startA + angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    // 3.将路径添加到图形上下文
    CGContextAddPath(ctx, path.CGPath);
    
    // 4.将上下文的内容渲染到view的layer止
    CGContextStrokePath(ctx);
}

@end

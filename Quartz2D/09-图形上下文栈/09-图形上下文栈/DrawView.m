//
//  drawView.m
//  09-图形上下文栈
//
//  Created by LXF on 2016/12/5.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 1.获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 150)];
    [path addLineToPoint:CGPointMake(280, 150)];
    
    // 3.将路径添加到图形上下文上
    CGContextAddPath(ctx, path.CGPath);
    
    // 保存当前上下文的状态
    CGContextSaveGState(ctx);
    
    // 设置上下文的状态
    CGContextSetLineWidth(ctx, 10);
    [[UIColor redColor] set];
    
    // 4.把上下文当中的内容渲染到View
    CGContextStrokePath(ctx);
    
    // 描述第二条路径
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(150, 20)];
    [path2 addLineToPoint:CGPointMake(150, 280)];
    
    CGContextAddPath(ctx, path2.CGPath);
    
    // 从上下文状态栈当中恢复上下文的状态
    CGContextRestoreGState(ctx);
    
    CGContextStrokePath(ctx);
}

@end

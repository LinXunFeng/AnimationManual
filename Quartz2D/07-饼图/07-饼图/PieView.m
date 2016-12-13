//
//  PieView.m
//  07-饼图
//
//  Created by LXF on 2016/12/4.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "PieView.h"

@implementation PieView


- (void)drawRect:(CGRect)rect {
    // 占用百分比数组
    NSArray *dataArray = @[@25, @25, @50];
    
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = 0;
    
    // 遍历
    for (NSNumber *num in dataArray) {
        startA = endA;
        angle = num.floatValue / 100.0 * M_PI * 2;
        endA = startA + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [[self randomColor] set];
        // 添加一根线到圆心
        [path addLineToPoint:center];
        [path fill];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 重绘
    [self setNeedsDisplay];
}

// 生成一个随机颜色
- (UIColor *)randomColor {
    // 0 ~ 255
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

@end

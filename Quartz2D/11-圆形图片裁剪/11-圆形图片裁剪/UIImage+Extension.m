//
//  UIImage+Extension.m
//  11-圆形图片裁剪
//
//  Created by LXF on 2016/12/6.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

#pragma mark - 圆形图片裁剪
- (UIImage *)clipWithBorderWith:(CGFloat)borderW borderColor:(UIColor *)color {
    
    // 边框宽度
    CGFloat width = borderW > 0 ? borderW : 0;
    
    // 1.开启图形上下文
    CGSize size = CGSizeMake(self.size.width + 2 * width, self.size.height + 2 * width);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    // 2.绘制大图，显示出来
    if (width != 0) {
        UIBezierPath *borderPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
        if (color == nil) {
            color = [UIColor redColor];
        }
        [color set];
        [borderPath fill];
    }
    
    // 3.绘制一个小圆，把小圆设置成裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, self.size.width, self.size.height)];
    [clipPath addClip];
    
    // 4.把图片绘制到上下文当中
    [self drawAtPoint:CGPointMake(borderW, borderW)];
    
    // 5.从上下文当中取出图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6.关闭上下文
    UIGraphicsEndImageContext();
    
    return newImg;
}

+ (UIImage *)imageWithBorderWith:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image {
    return [image clipWithBorderWith:borderW borderColor:color];
}

@end

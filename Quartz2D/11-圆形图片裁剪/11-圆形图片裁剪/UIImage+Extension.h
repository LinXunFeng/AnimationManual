//
//  UIImage+Extension.h
//  11-圆形图片裁剪
//
//  Created by LXF on 2016/12/6.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

#pragma mark - 圆形图片裁剪
- (UIImage *)clipWithBorderWith:(CGFloat)borderW borderColor:(UIColor *)color;
+ (UIImage *)imageWithBorderWith:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image;

@end

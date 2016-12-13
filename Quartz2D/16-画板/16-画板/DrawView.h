//
//  DrawView.h
//  16-画板
//
//  Created by LXF on 2016/12/7.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView

/** 要绘制的图片 */
@property(nonatomic, strong) UIImage *image;

// 清屏
- (void)clear;
// 撤销
- (void)undo;
// 橡皮擦
- (void)erase;
// 设置线的宽度
- (void)setLineWidth:(CGFloat)lineWidth;
// 设置线的颜色
- (void)setLineColor:(UIColor *)lineColor;

@end

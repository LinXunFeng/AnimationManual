//
//  LXFWheelBtn.m
//  13-转盘
//
//  Created by LXF on 2016/12/12.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "LXFWheelBtn.h"

@implementation LXFWheelBtn

// 返回当前按钮当中ImageView的位置尺寸
// contentRect: 当前按钮的位置尺寸
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat w = 40;
    CGFloat h = 48;
    CGFloat x = (contentRect.size.width - w) * 0.5;
    CGFloat y = 20;
    return CGRectMake(x, y, w, h);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect rect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height * 0.5);
    
    if (CGRectContainsPoint(rect, point)) {
        // 在指定的范围内
        return [super hitTest:point withEvent:event];
    } else {
        return nil;
    }
}

// 取消按钮高亮状态下做的事情
- (void)setHighlighted:(BOOL)highlighted {
    
}

@end

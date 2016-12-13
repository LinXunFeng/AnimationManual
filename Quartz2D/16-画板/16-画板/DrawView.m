//
//  DrawView.m
//  16-画板
//
//  Created by LXF on 2016/12/7.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "DrawView.h"
#import "LXFBezierPath.h"

@interface DrawView()

/** 当前绘制的路径 */
@property(nonatomic, strong) UIBezierPath *path;

/** 保存当前绘制的所有路径 */
@property(nonatomic, strong) NSMutableArray *allPathArray;

/** 当前路径的线宽 */
@property(nonatomic, assign) CGFloat width;

/** 当前路径的颜色 */
@property(nonatomic, strong) UIColor *color;

@end

@implementation DrawView
#pragma mark - 懒加载
- (NSMutableArray *)allPathArray {
    if (_allPathArray == nil) {
        _allPathArray = [NSMutableArray array];
    }
    return _allPathArray;
}

#pragma mark - setter
- (void)setImage:(UIImage *)image {
    _image = image;
    
    // 把图片添加到数组当中
    [self.allPathArray addObject:image];
    // 重绘
    [self setNeedsDisplay];
}

#pragma mark - 生命
- (void)awakeFromNib {
    [super awakeFromNib];
    
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    
    // 设置默认值
    self.width = 1;
    self.color = [UIColor blackColor];
}

#pragma mark - 手势方法
- (void)pan:(UIPanGestureRecognizer *)pan {
    // 获取的当前手指的点
    CGPoint curP = [pan locationInView:self];
    // 判断手势的状态
    if (pan.state == UIGestureRecognizerStateBegan) {
        // 创建路径
        // UIBezierPath *path = [UIBezierPath bezierPath];
        LXFBezierPath *path = [LXFBezierPath bezierPath];
        self.path = path;
        // 设置起点
        [path moveToPoint:curP];
        
        // 设置线的宽度
        [path setLineWidth:self.width];
        // 设置线的颜色(UIBezierPath 没有提供设置线的颜色的方法，通过自定义类来存储颜色，进而解决问题)
        path.color = self.color;
        
        [self.allPathArray addObject:path];
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        // 绘制一根线到当前所在的点
        [self.path addLineToPoint:curP];
        // 重绘
        [self setNeedsDisplay];
    }
}


- (void)drawRect:(CGRect)rect {
    // 绘制保存的所有路径
    for (LXFBezierPath *path in self.allPathArray) {
        // 判断取出的路径的真实类型
        if ([path isKindOfClass:[UIImage class]]) {
            UIImage *image = (UIImage *)path;
            [image drawInRect:rect];
        } else {
            [path.color set];
            [path stroke];
        }
    }
}

#pragma mark - 对外提供画板操作
// 清屏
- (void)clear {
    // 清空所有的路径
    [self.allPathArray removeAllObjects];
    
    [self setNeedsDisplay];
}
// 撤销
- (void)undo {
    // 删除最后一个路径
    [self.allPathArray removeLastObject];
    [self setNeedsDisplay];
}
// 橡皮擦
- (void)erase {
    [self setLineColor:self.backgroundColor];
}
// 设置线的宽度
- (void)setLineWidth:(CGFloat)lineWidth {
    self.width = lineWidth;
}
// 设置线的颜色
- (void)setLineColor:(UIColor *)lineColor {
    self.color = lineColor;
}

@end

//
//  HandleImageView.m
//  16-画板
//
//  Created by LXF on 2016/12/8.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "HandleImageView.h"

@interface HandleImageView() <UIGestureRecognizerDelegate>

/** imageV */
@property(nonatomic, weak) UIImageView *imageV;

@end

@implementation HandleImageView
#pragma mark - 懒加载
- (UIImageView *)imageV {
    if (_imageV == nil) {
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.frame = self.bounds;
        imageV.userInteractionEnabled = YES;
        _imageV = imageV;
        [self addSubview:imageV];
        // 添加手势
        [self addGes];
    }
    return _imageV;
}

#pragma mark - setter
- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageV.image = image;
}

#pragma mark - 添加手势
- (void)addGes {
    // 拖拽
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageV addGestureRecognizer:pan];
    // 捏合
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;
    [self.imageV addGestureRecognizer:pinch];
    // 添加旋转
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    [self.imageV addGestureRecognizer:rotation];
    // 长按
    UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longP:)];
    [self.imageV addGestureRecognizer:longP];
}

#pragma mark - 手势操作
#pragma mark 拖拽
- (void)pan:(UIPanGestureRecognizer *)pan {
    
    CGPoint transP = [pan translationInView:pan.view];
    pan.view.transform = CGAffineTransformTranslate(pan.view.transform, transP.x, transP.y);
    // 复位
    [pan setTranslation:CGPointZero inView:pan.view];
}
#pragma mark 捏合
- (void)pinch:(UIPinchGestureRecognizer *)pinch {
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    // 复位
    [pinch setScale:1];
}
#pragma mark 旋转
- (void)rotation:(UIRotationGestureRecognizer *)rotation {
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    // 复位
    [rotation setRotation:0];
}
#pragma mark 长按
- (void)longP:(UILongPressGestureRecognizer *)longP {
    if (longP.state == UIGestureRecognizerStateBegan) {
        
        // 先让图片闪一下，把图片绘制到画板当中
        [UIView animateWithDuration:0.25 animations:^{
            // 设置为透明
            self.imageV.alpha = 0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                self.imageV.alpha = 1;
            } completion:^(BOOL finished) {
                // 把当前的View做一个截屏
                UIGraphicsBeginImageContextWithOptions(longP.view.bounds.size, NO, 0);
                // 获取上下文
                CGContextRef ctx = UIGraphicsGetCurrentContext();
                [self.layer renderInContext:ctx];
                UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
                // 关闭上下文
                UIGraphicsEndImageContext();
                
                // 调用代理方法
                if ([self.delegate respondsToSelector:@selector(handleImageView:newImage:)]) {
                    [self.delegate handleImageView:self newImage:newImg];
                }
                
                // 从父控件当中移除
                [self removeFromSuperview];
            }];
        }];
        
    }
}

#pragma mark 能够同时支持多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}



@end

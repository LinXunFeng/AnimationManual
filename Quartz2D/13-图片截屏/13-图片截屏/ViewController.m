//
//  ViewController.m
//  13-图片截屏
//
//  Created by LXF on 2016/12/6.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

/** 开始时手指的点 */
@property(nonatomic, assign) CGPoint startP;
/** 遮盖View */
@property(nonatomic, weak) UIView *coverView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
// 懒加载
- (UIView *)coverView {
    if (_coverView == nil) {
        // 添加一个UIView
        UIView *coverView = [[UIView alloc] init];
        coverView.backgroundColor = [UIColor blackColor];
        coverView.alpha = 0.7;
        _coverView = coverView;
        [self.view addSubview:coverView];
    }
    return _coverView;
}

- (IBAction)pan:(UIPanGestureRecognizer *)pan { // 在拖动的时候会不断的调用该方法
    // 判断手势的状态
    CGPoint curP = [pan locationInView:self.imgView];
    if (pan.state == UIGestureRecognizerStateBegan) {   // 开始
        self.startP = curP;
    } else if (pan.state == UIGestureRecognizerStateChanged) {   // 拖动
        CGFloat x = self.startP.x;
        CGFloat y = self.startP.y;
        CGFloat w = curP.x - self.startP.x;
        CGFloat h = curP.y - self.startP.y;
        CGRect rect = CGRectMake(x, y, w, h);
        
        // 设置遮盖的frame
        self.coverView.frame = rect;
    } else if (pan.state == UIGestureRecognizerStateEnded) {    // 手指松开
        // 把超过coverView的frame以外的内容裁剪掉
        // 生成了一张图片，把原来的图片给替换掉
        UIGraphicsBeginImageContextWithOptions(self.imgView.bounds.size, YES, 0);
        
        // 把ImgView绘制到上下文之前，设置一个裁剪区域
        UIBezierPath *clipPath = [UIBezierPath bezierPathWithRect:self.coverView.frame];
        [clipPath addClip];
        
        // 把当前的ImgView渲染到上下文当中
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        [self.imgView.layer renderInContext:ctx];
        
        // 从上下文当中生成一张图片
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
        
        // 关闭上下文
        UIGraphicsEndPDFContext();
        
        // 移除遮盖
        [self.coverView removeFromSuperview];
        self.imgView.image = newImg;
    }
}


@end

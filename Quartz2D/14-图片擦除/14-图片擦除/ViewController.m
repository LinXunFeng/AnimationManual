//
//  ViewController.m
//  14-图片擦除
//
//  Created by LXF on 2016/12/6.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imgView addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    
    // 获取当前手指的点
    CGPoint curP = [pan locationInView:self.imgView];
    
    // 确定擦除区域
    CGFloat rectWH = 30;
    CGFloat x = curP.x - rectWH * 0.5;
    CGFloat y = curP.y - rectWH * 0.5;
    CGRect rect = CGRectMake(x, y, rectWH, rectWH);
    
    // 生成一张带有透明擦除区域的图片
    // 1.开启图片上下文
    UIGraphicsBeginImageContextWithOptions(self.imgView.bounds.size, NO, 0);
    
    // 2.把imgView的内容渲染到当前的上下文当中
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.imgView.layer renderInContext:ctx];
    
    // 3.擦除上下文当中的指定区域
    CGContextClearRect(ctx, rect);
    
    // 4.从上下文当中取出图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.关闭上下文
    UIGraphicsEndImageContext();
    
    // 替换之前imgView的图片
    self.imgView.image = newImg;
    
}


@end

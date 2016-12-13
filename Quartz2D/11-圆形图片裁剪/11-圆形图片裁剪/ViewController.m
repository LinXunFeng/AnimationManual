//
//  ViewController.m
//  11-圆形图片裁剪
//
//  Created by LXF on 2016/12/5.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Extension.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    // 带有边框的圆形图片裁剪
//    
//    // 1.加载图片
//    UIImage *img = [UIImage imageNamed:@"lxf"];
//    
//    // 2.确定边框宽度
//    CGFloat borderW = 5;
//    
//    // 3.开启图形上下文
//    CGSize size = CGSizeMake(img.size.width + 2 * borderW, img.size.height + 2 * borderW);
//    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
//    
//    // 4.绘制大图，显示出来
//    UIBezierPath *borderPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];;
//    [[UIColor redColor] set];
//    [borderPath fill];
//    
//    // 5.绘制一个小圆，把小圆设置成裁剪区域
//    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, img.size.width, img.size.height)];
//    [clipPath addClip];
//    
//    // 6.把图片绘制到上下文当中
//    [img drawAtPoint:CGPointMake(borderW, borderW)];
//    
//    // 7.从上下文当中取出图片
//    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
//    
//    // 8.关闭上下文
//    UIGraphicsEndImageContext();
//    
//    self.imageV.image = newImg;
    
//    UIImage *img = [UIImage imageNamed:@"lxf"];
    
//    UIImage *img = [UIImage imageNamed:@"minion"];
//    self.imageV.image = [img clipWithBorderWith:20 borderColor:[UIColor purpleColor]];
    
    self.imageV.image = [UIImage imageWithBorderWith:20 borderColor:[UIColor yellowColor] image:[UIImage imageNamed:@"minion"]];
    
}

// 简单圆形图片裁剪
- (void)drawAvatar {
    // 1.加载图片
    UIImage *img = [UIImage imageNamed:@"lxf"];
    
    // 2.开启跟原始图片一样大小的上下文
    UIGraphicsBeginImageContextWithOptions(img.size, NO, 0);
    
    // 3.设置一个圆形裁剪区域
    // 3.1 绘制一个圆形
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, img.size.width, img.size.height)];
    // 3.2 把圆形的路径设置成裁剪区域
    [path addClip];
    
    // 4.把图片绘制到上下文当中(超过裁剪区域以外的内容都绘裁剪掉)
    [img drawAtPoint:CGPointZero];
    
    // 5.从上下文当中取出图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6.关闭上下文
    UIGraphicsEndImageContext();
    
    self.imageV.image = newImg;
}


@end

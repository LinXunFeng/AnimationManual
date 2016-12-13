//
//  ViewController.m
//  12-截屏
//
//  Created by LXF on 2016/12/6.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 把控制器的View生成一张图片
    
    // 1.开启一个位图上下文(跟当前控制器View一样大小的尺寸)
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    
    // 2.把控制器的View绘制到上下文当中
    // 想要把UIView上的东西给绘制到上下文当中，必须得要使用渲染的方式
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:ctx];
    
    // 3.从上下文当中生成一张图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.关闭上下文
    UIGraphicsEndImageContext();
    
    // 把生成的图片写入到桌面(以文件方式进行传输:二进制流NSData)
    // 把图片转成二进制流NSData
    // compressionQuality: 压缩质量 0(most)..1(least 原始质量)
    // NSData *data = UIImageJPEGRepresentation(newImg, 1);
    // [data writeToFile:@"/Users/lxf/Desktop/newImg.jpg" atomically:YES];
    
    NSData *data = UIImagePNGRepresentation(newImg);
    [data writeToFile:@"/Users/lxf/Desktop/newImg.png" atomically:YES];
    
}

@end

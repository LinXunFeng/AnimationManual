//
//  ViewController.m
//  10-图片加水印
//
//  Created by LXF on 2016/12/5.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.加载图片
    UIImage *image = [UIImage imageNamed:@"test"];
    
    // 2.开启一个跟图片原始大小相等的上下文
    // opaque: YES: 不透明 NO: 透明
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // 3.把图片绘制到上下文当中
    [image drawAtPoint:CGPointZero];
    
    // 4.把文字绘制到上下文当中
    NSString *str = @"林洵锋";
    [str drawAtPoint:CGPointMake(10, 20) withAttributes:nil];
    
    // 5.从上下文当中生成一张图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6.关闭上下文
    UIGraphicsEndImageContext();
    
    self.imageV.image = newImg;
}


@end

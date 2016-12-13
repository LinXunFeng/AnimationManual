//
//  ViewController.m
//  09-图片抖动(帧动画)
//
//  Created by LXF on 2016/12/11.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"

#define angle2Rad(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 1.创建动画对象
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    // 2.绘制动画路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(300, 50)];
    [path addLineToPoint:CGPointMake(300, 400)];
    
    // 3.设置属性
    anim.duration = 2;
    anim.keyPath = @"position";
    anim.path = path.CGPath;
    
    [self.imageV.layer addAnimation:anim forKey:nil];
}

- (void)icon {
    // 1.创建动画对象
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    // 2.设置属性值
    anim.keyPath = @"transform.rotation";
    anim.values = @[@(angle2Rad(-3)), @(angle2Rad(3)), @(angle2Rad(-3))];
    
    // 3.设置动画执行次数
    anim.repeatCount = MAXFLOAT;
    anim.duration = 0.5;
    // anim.autoreverses = YES;
    
    [self.imageV.layer addAnimation:anim forKey:nil];
}


@end

//
//  ViewController.m
//  14-音量震动条
//
//  Created by LXF on 2016/12/13.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    // 渐变层
    CAGradientLayer *gradientL = [CAGradientLayer layer];
    gradientL.frame = self.contentV.bounds;
    // 设置渐变的颜色
    gradientL.colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor greenColor].CGColor, (id)[UIColor blueColor].CGColor];
    // 设置渐变的方向(默认坚向)
    gradientL.startPoint = CGPointMake(0, 0);
    gradientL.endPoint = CGPointMake(1, 0);
    // 设置一个渐变到另一个渐变的起始位置
    gradientL.locations = @[@0.2, @0.6];
    // 设置渐变透明
    gradientL.opacity = 0;

    [self.contentV.layer addSublayer:gradientL];
    */
    
    // 复制层
    CAReplicatorLayer *repL = [CAReplicatorLayer layer];
    repL.frame = self.contentV.bounds;
    [self.contentV.layer addSublayer:repL];
    // 复制的数量
    repL.instanceCount = 5;
    // 复制层平移
    repL.instanceTransform = CATransform3DMakeTranslation(45, 0, 0);
    // 设置复制出来的子层动画的延时执行时长
    repL.instanceDelay = 1;
    
    // 创建一个震动条
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(0, self.contentV.bounds.size.height - 100, 30, 100);
    layer.anchorPoint = CGPointMake(0, 1);
    layer.position = CGPointMake(0, self.contentV.bounds.size.height);
    [repL addSublayer:layer];
    
    // 添加动画
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale.y";
    anim.toValue = @0;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 1;
    anim.autoreverses = YES;
    [layer addAnimation:anim forKey:nil];
    
}






@end

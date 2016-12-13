//
//  ViewController.m
//  08-心跳效果
//
//  Created by LXF on 2016/12/11.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *heartView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置属性值
    anim.keyPath = @"transform.scale";
    anim.toValue = @0;
    // 设置动画执行次数
    anim.repeatCount = MAXFLOAT;
    // 设置动画的执行时长
    anim.duration = 0.5;
    // 自动反转(怎么样去，怎么样回来)
    anim.autoreverses = YES;
    
    // 3.添加动画
    [self.heartView.layer addAnimation:anim forKey:nil];
    
}


@end

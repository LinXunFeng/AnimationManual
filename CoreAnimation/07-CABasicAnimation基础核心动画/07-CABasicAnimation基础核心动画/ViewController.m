//
//  ViewController.m
//  07-CABasicAnimation基础核心动画
//
//  Created by LXF on 2016/12/11.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 核心动画的本质：设置layer的属性值
    // 1. 创建动画对象
    CABasicAnimation * anim = [CABasicAnimation animation];
    // 2. 设置属性值
    anim.keyPath = @"position.x";
    anim.toValue = @300;
    // 动画完成时会自动删除动画
    anim.removedOnCompletion = NO;          // 关闭完成动画后自动移除状态
    anim.fillMode = kCAFillModeForwards;    // 设置保持的状态（默认值为：kCAFillModeBackwards）
    // 3. 添加动画
    [self.redView.layer addAnimation:anim forKey:nil];
    
}


@end

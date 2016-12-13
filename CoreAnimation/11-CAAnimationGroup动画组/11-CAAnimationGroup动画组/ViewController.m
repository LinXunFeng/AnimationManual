//
//  ViewController.m
//  11-CAAnimationGroup动画组
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
    
    // 平移
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"position.y";
    anim.toValue = @400;
//    anim.removedOnCompletion = NO;
//    anim.fillMode = kCAFillModeForwards;
//    [self.redView.layer addAnimation:anim forKey:nil];
    
    // 缩放
    CABasicAnimation *anim2 = [CABasicAnimation animation];
    anim2.keyPath = @"transform.scale";
    anim2.toValue = @0.5;
//    anim2.removedOnCompletion = NO;
//    anim2.fillMode = kCAFillModeForwards;
//    [self.redView.layer addAnimation:anim2 forKey:nil];
    
    
    // 组动画
    CAAnimationGroup *group = [CAAnimationGroup animation];
    // 会自动执行animations数组当中所有的动画对象
    group.animations = @[anim, anim2];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    [self.redView.layer addAnimation:group forKey:nil];
}


@end

//
//  ViewController.m
//  12-UIView与核心动画的区别
//
//  Created by LXF on 2016/12/11.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

/**
 UIView与核心动画的区别
 
    1.核心动画只作用在layer
    2.核心动画看到的都是假像，它并没有去修改UIView的真实位置
 
 什么时候使用核心动画
    1.当不需要与用户进行交互，使用核心动画
    2.当要根据路径做动画时，使用核心动画
    3.当做转场动画时，使用核心动画(转场类型比较多)
 
 */

#import "ViewController.h"

@interface ViewController () <CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    CABasicAnimation *anim = [CABasicAnimation animation];
//    anim.keyPath = @"position.y";
//    anim.toValue = @400;
//    anim.removedOnCompletion = NO;
//    anim.fillMode = kCAFillModeForwards;
//    anim.duration = 1;
//    anim.delegate = self;
//    [self.redView.layer addAnimation:anim forKey:nil];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.redView.center = CGPointMake(50, 400);
    } completion:^(BOOL finished) {
        NSLog(@"%@", NSStringFromCGRect(self.redView.frame));
    }];
    
}

// 动画开始时执行
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"%s", __func__);
    NSLog(@"%@", NSStringFromCGRect(self.redView.frame));
}

// 动画完成时执行
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"%s", __func__);
    NSLog(@"%@", NSStringFromCGRect(self.redView.frame));
}



@end

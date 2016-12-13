//
//  ViewController.m
//  10-CATransition转场动画
//
//  Created by LXF on 2016/12/11.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

static int _i = 1;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 转场代码与转场动画必须得在同一个方法当中
    
    // 转场代码
    _i++;
    if (_i == 4) {
        _i = 1;
    }
    NSString *imageName = [NSString stringWithFormat:@"%d", _i];
    self.imageV.image = [UIImage imageNamed:imageName];
    
    // 转场动画
    CATransition *anim = [CATransition animation];
    anim.duration = 1;
    // 设置转场的类型
    // anim.type = @"cube";    // 立体上下翻滚
    // anim.type = @"rippleEffect"; // 水滴
    anim.type = @"pageCurl";  // 向上翻页

    // 设置动画的起始位置
    anim.startProgress = 0.3;
    // 设置动画的结束位置
    anim.endProgress = 0.5;
    
    [self.imageV.layer addAnimation:anim forKey:nil];
}


@end

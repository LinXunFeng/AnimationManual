//
//  ViewController.m
//  01-Transform
//
//  Created by LXF on 2016/11/25.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 事件监听
- (IBAction)moveUp:(UIButton *)sender {
    // 平移
    [UIView animateWithDuration:0.5 animations:^{
        // 使用Make，它是相对于最原始的位置做的形变(即只会移动一次)
        // 原始位置为(0, 0)
        // self.imageView.transform = CGAffineTransformMakeTranslation(0, -100);
        // 相对上一次形变
        self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, 0, -100);
    }];
    
}
- (IBAction)moveDown:(UIButton *)sender {
    // 平移
    [UIView animateWithDuration:0.5 animations:^{
        // 使用Make，它是相对于最原始的位置做的形变(即只会移动一次)
        // self.imageView.transform = CGAffineTransformMakeTranslation(0, 100);
        // 相对上一次形变
        self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, 0, 100);
    }];
}
- (IBAction)rotation:(UIButton *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        // 旋转(旋转的度数，是一个弧度)
        // self.imageView.transform = CGAffineTransformMakeRotation(M_PI_4);
        
        // 相对上一次旋转
        self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI_4);
    }];
}
- (IBAction)scale:(UIButton *)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        // 缩放
        // 原始比例 (1, 1)
        // self.imageView.transform = CGAffineTransformMakeScale(1.2, 1);
        self.imageView.transform = CGAffineTransformScale(self.imageView.transform, 0.8, 0.8);
    }];
}


@end

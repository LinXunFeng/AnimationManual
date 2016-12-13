//
//  ViewController.m
//  02-CATransform3D
//
//  Created by LXF on 2016/12/10.
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 3D效果
    [UIView animateWithDuration:0.5 animations:^{
        // self.imageV.layer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1); // 绕z轴旋转
        // self.imageV.layer.transform = CATransform3DMakeRotation(M_PI, 1, 1, 0); // 方向向量
        // self.imageV.layer.transform = CATransform3DRotate(self.imageV.layer.transform, M_PI, 1, 1, 0);
        
        // 把结构体转成对象
        NSValue *value = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 0)];
        // 通过KVC一般是做快速旋转、平移、缩放
        [self.imageV.layer setValue:value forKeyPath:@"transform"];
        
        [self.imageV.layer setValue:@(M_PI) forKeyPath:@"transform.rotation.x"];
        [self.imageV.layer setValue:@(100) forKeyPath:@"transform.translation.x"];
        [self.imageV.layer setValue:@(0.5) forKeyPath:@"transform.scalx"];
    }];
}


@end

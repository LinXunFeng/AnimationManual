//
//  ViewController.m
//  01-CALayer的基本操作
//
//  Created by LXF on 2016/12/8.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 设置阴影的颜色
    self.imageV.layer.shadowColor = [UIColor purpleColor].CGColor;
    // 设置阴影的不透明度
    self.imageV.layer.shadowOpacity = 1;
    self.imageV.layer.shadowOffset = CGSizeMake(-30, -30);
    // 设置阴影的模糊半径
    self.imageV.layer.shadowRadius = 5;
    
    // 设置的边框宽度是往里边走的
    self.imageV.layer.borderWidth = 3;
    self.imageV.layer.borderColor = [UIColor greenColor].CGColor;
    
    // 设置圆角
    self.imageV.layer.cornerRadius = 50;
    // 对layer进行操作不会影响到layer内部
    // UIImageView中的image是存放在 imageView.layer.contents 中，所心设置圆角对image无效
    // 把超过根层以外的东西都给裁剪掉(UIView自带的层称之为根层)
    self.imageV.layer.masksToBounds = YES;
}

- (void)UIViewLayer {
    // 设置阴影的颜色
    self.blueView.layer.shadowColor = [UIColor purpleColor].CGColor;
    // 设置阴影的不透明度
    self.blueView.layer.shadowOpacity = 1;
    self.blueView.layer.shadowOffset = CGSizeMake(-30, -30);
    // 设置阴影的模糊半径
    self.blueView.layer.shadowRadius = 5;

    // 设置的边框宽度是往里边走的
    self.blueView.layer.borderWidth = 3;
    self.blueView.layer.borderColor = [UIColor greenColor].CGColor;

    // 设置圆角
    self.blueView.layer.cornerRadius = 30;
}


@end

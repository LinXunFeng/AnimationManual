//
//  ViewController.m
//  05-隐式动画
//
//  Created by LXF on 2016/12/10.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** layer */
@property(nonatomic, strong) CALayer *layer;

@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor purpleColor].CGColor;
    layer.frame = CGRectMake(50, 50, 100, 100);
    self.layer = layer;
    [self.view.layer addSublayer:layer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 只有非根层才有隐式动画(自己手动创建的图层)
    self.layer.position = CGPointMake(100, 400);
    self.layer.bounds = CGRectMake(0, 0, 90, 90);
    self.layer.backgroundColor = [UIColor blueColor].CGColor;
    
    
    self.redView.layer.position = CGPointMake(300, 400);
    self.redView.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.redView.layer.backgroundColor = [UIColor grayColor].CGColor;
}


@end

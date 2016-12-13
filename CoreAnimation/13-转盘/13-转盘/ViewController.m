//
//  ViewController.m
//  13-转盘
//
//  Created by LXF on 2016/12/11.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"
#import "LXFWheelView.h"

@interface ViewController ()

/** 转盘 */
@property(nonatomic, strong) LXFWheelView *wheelV;

@end

@implementation ViewController
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    LXFWheelView *wheelV = [LXFWheelView wheelView];
    LXFWheelView *wheelV = [[LXFWheelView alloc] init];
    wheelV.center = self.view.center;
    self.wheelV = wheelV;
    [self.view addSubview:wheelV];
}

#pragma mark - 事件处理
- (IBAction)rotate {
    [self.wheelV rotate];
}

- (IBAction)stop {
    [self.wheelV pause];
}


@end

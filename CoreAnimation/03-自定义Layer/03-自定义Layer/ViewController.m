//
//  ViewController.m
//  03-自定义Layer
//
//  Created by LXF on 2016/12/10.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(50, 50, 100, 100);
    
    // contents 专门用来放图片的
    layer.contents = (id)[UIImage imageNamed:@"lxf"].CGImage;
    
    [self.view.layer addSublayer:layer];
}


@end

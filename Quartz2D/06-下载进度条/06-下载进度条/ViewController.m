//
//  ViewController.m
//  06-下载进度条
//
//  Created by LXF on 2016/12/4.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *progressL;
@property (weak, nonatomic) IBOutlet ProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - 事件监听
- (IBAction)valueChange:(UISlider *)sender {
    
    NSLog(@"%f", sender.value);
    // 设置进度值
    self.progressL.text = [NSString stringWithFormat:@"%.2f%%", sender.value * 100.0];
    self.progressView.progressValue = sender.value;
}



@end

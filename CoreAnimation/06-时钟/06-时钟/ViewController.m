//
//  ViewController.m
//  06-时钟
//
//  Created by LXF on 2016/12/11.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "ViewController.h"

// 每一秒旋转的度数(360度 / 60秒)
#define perSecAngle 6
// 每一分旋转的度数(360度 / 60分)
#define perMinAngle 6
// 每一小时旋转的度数(360度 / 12小时)
#define perHourAngle 30
// 每一分，时针旋转的度数(30 / 60)
#define perMinHour 0.5


// 角度转弧度
#define angle2Rad(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *clockView;
/** 当前秒针 */
@property(nonatomic, weak) CALayer *secLayer;
/** 当前分针 */
@property(nonatomic, weak) CALayer *minLayer;
/** 当前时针 */
@property(nonatomic, weak) CALayer *hourLayer;

@end

@implementation ViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加时针
    [self setHourPoint];
    // 添加分针
    [self setMinPoint];
    // 添加秒针
    [self setSecPoint];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    [self timeChange];
}

// 每一秒调用一次
- (void)timeChange {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    // components: 日历的组件(年，月，日，时，分，秒)
    // fromDate: 从什么时间开始获取
    NSDateComponents *cmp = [cal components:NSCalendarUnitSecond | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:[NSDate date]];
    // 获取当前多少秒
    NSInteger curSec = cmp.second;
    // 获取当前多少分
    NSInteger curMin = cmp.minute;
    // 获取当前多少时
    NSInteger curHour = cmp.hour;
    
    
    // 让秒针开始旋转
    // 计算秒针当前旋转的角度
    // angle = 当前多少秒 * 每一秒旋转多少度
    CGFloat secAngle = curSec * perSecAngle;
    self.secLayer.transform = CATransform3DMakeRotation(angle2Rad(secAngle), 0, 0, 1);
    
    // 让分针开始旋转
    // 计算分针当前旋转的角度
    // angle = 当前多少分 * 每一分旋转多少度
    CGFloat minAngle = curMin * perMinAngle;
    self.minLayer.transform = CATransform3DMakeRotation(angle2Rad(minAngle), 0, 0, 1);
    
    // 让时针开始旋转
    // 计算时针当前旋转的角度
    // angle = 当前多少时 * 每一时旋转多少度
    CGFloat hourAngle = curHour * perHourAngle + curMin * perMinHour;
    self.hourLayer.transform = CATransform3DMakeRotation(angle2Rad(hourAngle), 0, 0, 1);
}

#pragma mark - 添加针
#pragma mark 添加秒针
- (void)setSecPoint {
    
    CALayer *secLayer = [CALayer layer];
    secLayer.bounds = CGRectMake(0, 0, 1, 80);
    secLayer.backgroundColor = [UIColor redColor].CGColor;
    secLayer.anchorPoint = CGPointMake(0.5, 1);
    secLayer.position = CGPointMake(self.clockView.bounds.size.width * 0.5, self.clockView.bounds.size.height * 0.5);
    self.secLayer = secLayer;
    [self.clockView.layer addSublayer:secLayer];
}

#pragma mark 添加分针
- (void)setMinPoint {
    CALayer *minLayer = [CALayer layer];
    minLayer.bounds = CGRectMake(0, 0, 3, 70);
    minLayer.backgroundColor = [UIColor whiteColor].CGColor;
    minLayer.anchorPoint = CGPointMake(0.5, 1);
    minLayer.cornerRadius = 1.5;
    minLayer.position = CGPointMake(self.clockView.bounds.size.width * 0.5, self.clockView.bounds.size.height * 0.5);
    self.minLayer = minLayer;
    [self.clockView.layer addSublayer:minLayer];
}

#pragma mark 添加时针
- (void)setHourPoint {
    CALayer *hourLayer = [CALayer layer];
    hourLayer.bounds = CGRectMake(0, 0, 3, 50);
    hourLayer.backgroundColor = [UIColor whiteColor].CGColor;
    hourLayer.anchorPoint = CGPointMake(0.5, 1);
    hourLayer.cornerRadius = 1.5;
    hourLayer.position = CGPointMake(self.clockView.bounds.size.width * 0.5, self.clockView.bounds.size.height * 0.5);
    self.hourLayer = hourLayer;
    [self.clockView.layer addSublayer:hourLayer];
}
@end

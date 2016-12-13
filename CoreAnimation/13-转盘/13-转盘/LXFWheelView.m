//
//  LXFWheelView.m
//  13-转盘
//
//  Created by LXF on 2016/12/11.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "LXFWheelView.h"
#import "LXFWheelBtn.h"

#define angle2Rad(angle) ((angle) / 180.0 * M_PI)

@interface LXFWheelView() <CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *contentV;
/** 当前选中的按钮 */
@property(nonatomic, strong) UIButton *selectBtn;
/** 定时器 */
@property(nonatomic, strong) CADisplayLink *link;

@end

@implementation LXFWheelView
#pragma mark - 懒加载
- (CADisplayLink *)link {
    if (_link == nil) {
        // 添加定时器，保持一直旋转
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
        [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return _link;
}

#pragma mark - 创建
+ (instancetype)wheelView {
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return self;
}

#pragma mark - 生命周期
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.contentV.userInteractionEnabled = YES;
    
    // 添加转盘按钮
    CGFloat btnW = 65;
    CGFloat btnH = 143;
    CGFloat angle = 0;
    
    // 加载原始大图片
    UIImage *oriImage = [UIImage imageNamed:@"LuckyAstrology"];
    // 加载原始选中的大图片
    UIImage *oriSelImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    CGFloat clipX = 0;
    CGFloat clipY = 0;
    CGFloat clipW = oriImage.size.width / 12.0 * [UIScreen mainScreen].scale;
    CGFloat clipH = oriImage.size.height * [UIScreen mainScreen].scale;
    
    for (int i = 0; i<12; i++) {
        LXFWheelBtn *btn = [LXFWheelBtn buttonWithType:UIButtonTypeCustom];
        btn.bounds = CGRectMake(0, 0, btnW, btnH);
        // 设置按钮选中状态下的背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        // 给定一张图片，截取指定区域范围内的图片
        clipX = i * clipW;
        
        // CGImageCreateWithImageInRect 是C的函数，使用的坐标都是像素
        // 在iOS中使用的都是点坐标
        // 所以在高分辨率的状态下加载了@2x的图片，而CGImageCreateWithImageInRect还是以@1x的尺寸去进行裁剪，最终只裁剪了一半的尺寸
        // 解决方案： [UIScreen mainScreen].scale; // 获取当前屏幕坐标与像素坐标的比例
        CGImageRef clipImage = CGImageCreateWithImageInRect(oriImage.CGImage, CGRectMake(clipX, clipY, clipW, clipH));
        // 设置按钮正常状态下显示的图片
        [btn setImage:[UIImage imageWithCGImage:clipImage] forState:UIControlStateNormal];
        
        CGImageRef clipSelImage = CGImageCreateWithImageInRect(oriSelImage.CGImage, CGRectMake(clipX, clipY, clipW, clipH));
        // 设置按钮选中状态下显示的图片
        [btn setImage:[UIImage imageWithCGImage:clipSelImage] forState:UIControlStateSelected];
        
        
        // 设置按钮位置
        btn.layer.anchorPoint = CGPointMake(0.5, 1);    // 绕着大圆中心点进行旋转
        btn.layer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
        // 让每一个按钮在上一个基础上旋转30度
        btn.transform = CGAffineTransformMakeRotation(angle2Rad(angle));
        angle += 30;
        // 监听按钮的点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentV addSubview:btn];
        // 默认选中第一个
        if (i == 0) {
            [self btnClick:btn];
        }
    }
}

#pragma mark - 按钮事件
- (void)btnClick:(LXFWheelBtn *)btn {
    // 让当前点击的按钮成为选中状态
    
    // 1.让当前选中的按钮取消选中
    self.selectBtn.selected = NO;
    // 2.让当前点击的按钮成为选中状态
    btn.selected = YES;
    // 3.当前点击的按钮成为选中状态
    self.selectBtn = btn;
}



#pragma mark - 操作
// 让转盘开始旋转
- (void)rotate {
    self.link.paused = NO;
}

- (void)update {
    self.contentV.transform = CGAffineTransformRotate(self.contentV.transform, M_PI / 300.0);
}

// 让转盘暂停旋转
- (void)pause {
    self.link.paused = YES;
}

// 开始选号
- (IBAction)startChoose {
    
    // 让转盘快速旋转几圈，当前选中的按钮指向最上方
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.toValue = @(M_PI * 4);
    anim.duration = 1;
    anim.repeatCount = 0.5;
    anim.delegate = self;
    [self.contentV.layer addAnimation:anim forKey:nil];
    
}

#pragma mark - CAAnimationDelegate
// 当动画结束时调用
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    // 动画结束时当前选中的按钮指向最上方
    // 让当前选中的按钮的父控件倒着旋转回去
    
    // 获取当前选中按钮旋转的角度
    CGAffineTransform transform = self.selectBtn.transform;
    // 通过transform获取当前旋转的度数(弧度制)
    CGFloat angle = atan2(transform.b, transform.a);
    
    self.contentV.transform = CGAffineTransformMakeRotation(-angle);
}

@end

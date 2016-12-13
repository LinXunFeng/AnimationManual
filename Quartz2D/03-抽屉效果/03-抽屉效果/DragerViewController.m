//
//  DragerViewController.m
//  03-抽屉效果
//
//  Created by LXF on 2016/12/2.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "DragerViewController.h"

#define screenW [UIScreen mainScreen].bounds.size.width

@interface DragerViewController ()

@end

@implementation DragerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控件
    [self setupView];
    
    // 添加手势
    [self addGesture];
}

#pragma mark - 手势方法
// 点按手势
- (void)tap {
    // 让Main复位
    [UIView animateWithDuration:0.25 animations:^{
        self.mainView.frame = self.view.bounds;
    }];
}

#define targetR 275
#define targetL -275
// 拖拽手势
- (void)pan:(UIPanGestureRecognizer *)pan {
    // 获取偏移量
    CGPoint transP = [pan translationInView:self.mainView];
    // 为什么不使用transform，是因为我们还要去修改高度，使用transform，只能修改 x,y
    // self.mainView.transform = CGAffineTransformTranslate(self.mainView.transform, transP.x, 0);
    self.mainView.frame = [self frameWithOffsetX:transP.x];
    
    // 判断拖动的方向
    if (self.mainView.frame.origin.x > 0) {
        // 向右
        self.rightView.hidden = YES;
    } else if (self.mainView.frame.origin.x < 0) {
        // 向左
        self.rightView.hidden = NO;
    }
    
    // 当手指松开时，做自动定位
    CGFloat target = 0;
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (self.mainView.frame.origin.x > screenW * 0.5) {
            // 1.判断在右侧
            // 当前view的x有没有大于屏幕宽度的一半，大于就是在右侧
            target = targetR;
        } else if (CGRectGetMaxX(self.mainView.frame) < screenW * 0.5) {
            // 2.判断在左侧
            // 当前view的最大的x有没有小于屏幕宽度的一半，小于就是在左侧
            target = targetL;
        }
        
        // 计算当前mainView的frame
        CGFloat offset = target - self.mainView.frame.origin.x;
        [UIView animateWithDuration:0.25 animations:^{
            self.mainView.frame = [self frameWithOffsetX:offset];
        }];
        
    }
    
    // 复位(取出来的tranP是相对原始位置，所以需要复位操作)
    [pan setTranslation:CGPointZero inView:self.mainView];
}

#define maxY 100
// 根据偏移量计算MainView的frame
- (CGRect)frameWithOffsetX:(CGFloat)offsetX {
    CGRect frame = self.mainView.frame;
    frame.origin.x += offsetX;
    
    // 当拖动的View的x值等于屏幕宽度时，maxY为最大，最大为100
    // 对计算的结果取绝对值
    CGFloat y = fabs(frame.origin.x * maxY / screenW);
    frame.origin.y = y;
    
    // 屏幕的高度减去两倍的y值
    frame.size.height = [UIScreen mainScreen].bounds.size.height - (2 * frame.origin.y);
    
    return frame;
}

#pragma mark - 初始化
#pragma mark 添加子控件
- (void)setupView {
    // leftView
    UIView *leftView = [[UIView alloc] initWithFrame:self.view.bounds];
    leftView.backgroundColor = [UIColor blueColor];
    _leftView = leftView;
    [self.view addSubview:leftView];
    
    // rightView
    UIView *rightView = [[UIView alloc] initWithFrame:self.view.bounds];
    rightView.backgroundColor = [UIColor greenColor];
    _rightView = rightView;
    [self.view addSubview:rightView];
    
    // mainView
    UIView *mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    mainView.backgroundColor = [UIColor redColor];
    _mainView = mainView;
    [self.view addSubview:mainView];
}

#pragma mark 添加手势
- (void)addGesture {
    // 添加拖动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.mainView addGestureRecognizer:pan];
    
    // 给控制器的View添加占点按手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
}

@end

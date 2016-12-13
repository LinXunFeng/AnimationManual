//
//  LXFWheelView.h
//  13-转盘
//
//  Created by LXF on 2016/12/11.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXFWheelView : UIView

// 快速创建转盘
+ (instancetype)wheelView;

// 让转盘开始旋转
- (void)rotate;
// 让转盘暂停旋转
- (void)pause;

@end

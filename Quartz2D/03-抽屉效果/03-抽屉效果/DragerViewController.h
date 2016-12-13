//
//  DragerViewController.h
//  03-抽屉效果
//
//  Created by LXF on 2016/12/2.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DragerViewController : UIViewController

/** 子视图 */
@property(nonatomic, weak, readonly) UIView *leftView;
@property(nonatomic, weak, readonly) UIView *rightView;
@property(nonatomic, weak, readonly) UIView *mainView;

@end

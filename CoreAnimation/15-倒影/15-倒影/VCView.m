//
//  VCView.m
//  15-倒影
//
//  Created by LXF on 2016/12/13.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "VCView.h"

@implementation VCView

// 返回当前UIView内部layer类型
+ (Class)layerClass {
    return [CAReplicatorLayer class];
}

@end

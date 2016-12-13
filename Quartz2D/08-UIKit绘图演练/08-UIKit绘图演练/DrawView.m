//
//  DrawView.m
//  08-UIKit绘图演练
//
//  Created by LXF on 2016/12/4.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect {
    // 画图片
    UIImage *img = [UIImage imageNamed:@"icon_00"];
    // drawAtPoint绘制的是原始图片的大小
    // [img drawAtPoint:CGPointZero];
    
    // 把要绘制的图片给填充到给定的区域当中
    //[img drawInRect:rect];
    
    // 裁剪(超过裁剪区域之后的内容，都会被自动裁剪掉)
    // 设置裁剪区域一定要在绘制之前进行设置
    UIRectClip(CGRectMake(20, 30, 100, 100));
    
    // 平铺
    [img drawAsPatternInRect:rect];
}

- (void)drawText:(CGRect)rect {
    NSString *str = @"林洵锋林洵锋林洵锋";
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    // 字体大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    // 设置颜色
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    // 设置描边(设置完前景色失效)
    dict[NSStrokeColorAttributeName] = [UIColor purpleColor];
    dict[NSStrokeWidthAttributeName] = @1;
    // 设置阴影
    NSShadow *shaw = [[NSShadow alloc] init];
    shaw.shadowColor = [UIColor blueColor];
    // 设置阴影的偏移量
    shaw.shadowOffset = CGSizeMake(2, 2);
    shaw.shadowBlurRadius = 2;
    dict[NSShadowAttributeName] = shaw;
    
//    [str drawAtPoint:CGPointZero withAttributes:dict];
    [str drawInRect:rect withAttributes:dict];
    // 用drawInRect:rect会自动换行。用drawAtPoint不会自动换行。
}

@end

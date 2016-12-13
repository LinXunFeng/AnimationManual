//
//  HandleImageView.h
//  16-画板
//
//  Created by LXF on 2016/12/8.
//  Copyright © 2016年 林洵锋. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HandleImageView;

@protocol HandleImageViewDelegate <NSObject>

- (void)handleImageView:(HandleImageView *)handleImageView newImage:(UIImage *)newImage;

@end

@interface HandleImageView : UIView

/** image */
@property(nonatomic, strong) UIImage *image;

/** 代理 */
@property(nonatomic, weak) id<HandleImageViewDelegate> delegate;

@end

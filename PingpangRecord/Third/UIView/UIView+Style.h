//
//  UIView+Style.h
//  FaceLoan
//
//  Created by pjh on 16/12/7.
//  Copyright © 2016年 pjh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(style)
/**
 *  获取一个新创建的View
 */
+ (UIView*)viewWithFrame:(CGRect)frame
                withbackGroudColor:(UIColor*)backGroudColor
                 ;

/**
 *  获取一个新创建的View,带圆角
 */
+ (UIView*)viewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor cornerRadius:(CGFloat)cornerRadius;
@end

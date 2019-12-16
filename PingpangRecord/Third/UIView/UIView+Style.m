//
//  UIView+Style.m
//  FaceLoan
//
//  Created by pjh on 16/12/7.
//  Copyright © 2016年 pjh. All rights reserved.
//

#import "UIView+Style.h"

@implementation UIView(style)

+ (UIView*)viewWithFrame:(CGRect)frame
      withbackGroudColor:(UIColor*)backGroudColor
{
    UIView *view=[[UIView alloc]initWithFrame:frame];
    view.backgroundColor=backGroudColor;
    return view;
}

+ (UIView*)viewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor cornerRadius:(CGFloat)cornerRadius
{
    UIView *view=[[UIView alloc]initWithFrame:frame];
    view.backgroundColor=backgroundColor;
    view.layer.cornerRadius = cornerRadius;
    view.layer.masksToBounds = YES;
    return view;
}
@end

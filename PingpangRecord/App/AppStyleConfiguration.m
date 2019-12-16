//
//  AppStyleConfiguration.m
//  EBoSports
//
//  Created by Awin on 2019/10/6.
//  Copyright © 2019年 zidingyi. All rights reserved.
//

#import "AppStyleConfiguration.h"

@implementation AppStyleConfiguration

+ (UIFont*)appFont:(NSInteger)size{
    
    return [UIFont systemFontOfSize:size];
}
+(UIColor*)ColorWithBottomTabBarUnSelectColor
{
    return [UIColor colorWithRed:0.57f green:0.42f blue:0.94f alpha:1.00f];
}
+(UIColor *)ColorWithLineColor
{
    return [UIColor colorWithRed:0.57f green:0.42f blue:0.94f alpha:1.00f];
}
+(UIColor*)ColorWithBottomTabBarSelectColor
{
    return [UIColor colorWithRed:0.15f green:0.62f blue:0.95f alpha:1.00f];
}
+(UIColor*)ColorWithNavigationTitleColor
{
    return [UIColor whiteColor];
}
/**
 *颜色黄色
 */
+(UIColor*)ColorWithYellowColor
{
    return [UIColor colorWithRed:0.96f green:0.80f blue:0.00f alpha:1.00f];
}
/**
 *颜色橙色
 */
+(UIColor*)ColorWithChengColor
{
    return [UIColor colorWithRed:0.96f green:0.46f blue:0.25f alpha:1.00f];
}

/**
 *颜色红色
 */
+(UIColor*)ColorWithRedColor
{
    return [UIColor colorWithRed:0.95f green:0.17f blue:0.13f alpha:1.00f];
}
+(UIColor*)ColorWithNavigationBackgroundColor
{
    return [UIColor colorWithRed:0.57f green:0.42f blue:0.94f alpha:1.00f];
}

/**
 字体白色
 */
+ (UIColor*)ColorWithTextWhite
{
    return [UIColor whiteColor];
}
/**
 字体一级
 */
+ (UIColor*)ColorWithTextOne{
    return [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
}
/**
 字体二级
 */
+ (UIColor*)ColorWithTextTwo{
    return [UIColor colorWithRed:0.46f green:0.46f blue:0.46f alpha:1.00f];
}
/**
 字体三级
 */
+ (UIColor*)ColorWithTextThree{
    return [UIColor colorWithRed:0.60f green:0.60f blue:0.60f alpha:1.00f];
}

/**
 字体大标题
 */
+ (UIFont*)FontWith18{
    return [UIFont systemFontOfSize:18];
}
/**
 字体小标题
 */
+ (UIFont*)FontWith16{
    return [UIFont systemFontOfSize:16];
}

/**
 字体普通字体
 */
+ (UIFont*)FontWith14{
    return [UIFont systemFontOfSize:14];
}
/**
 字体次要字体
 */
+ (UIFont*)FontWith12{
    return [UIFont systemFontOfSize:12];
}
/**
 字体最小字体
 */
+ (UIFont*)FontWith10{
    {
        return [UIFont systemFontOfSize:10];
    }
}
/**
 页面背景色
 */
+ (UIColor*)ColorWithBaseBoard{
    return [UIColor colorWithRed:0.96f green:0.95f blue:0.95f alpha:1.00f];
}
/**
 主按钮色-黄色
 */
+ (UIColor*)ColorWithSureBtn{
    return [UIColor colorWithRed:0.99f green:0.56f blue:0.15f alpha:1.00f];;
}

/*
 主题色彩
 **/
+ (UIColor*)ColorWithMain
{
    return  [UIColor colorWithRed:0.55f green:0.74f blue:0.42f alpha:1.00f];
}
/**
 底色
 */
+ (UIColor*)ColorWithbBaseBoard{
    return [UIColor colorWithRed:0.57f green:0.42f blue:0.94f alpha:1.00f];
}
/**
 灰色
 */
+ (UIColor*)ColorWithbGray{
    return [UIColor colorWithRed:0.43f green:0.44f blue:0.47f alpha:1.00f];
}
@end

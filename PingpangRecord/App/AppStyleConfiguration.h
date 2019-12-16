//
//  AppStyleConfiguration.h
//  EBoSports
//
//  Created by Awin on 2019/10/6.
//  Copyright © 2019年 zidingyi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppStyleConfiguration : NSObject
/**
 获取app字体
 */
+(UIFont*)appFont:(NSInteger)size;
/**
 导航栏背景色
 */
+(UIColor*)ColorWithNavigationBackgroundColor;
/**
 底部TabBar未选中字体颜色
 */
+(UIColor*)ColorWithBottomTabBarUnSelectColor;
/**
 底部TabBar选中字体颜色
 */
+(UIColor*)ColorWithBottomTabBarSelectColor;
/**
 线条颜色
 */
+(UIColor *)ColorWithLineColor;
/**
 *标题颜色
 */
+(UIColor*)ColorWithNavigationTitleColor;
/**
 *颜色黄色
 */
+(UIColor*)ColorWithYellowColor;
/**
 *颜色橙色
 */
+(UIColor*)ColorWithChengColor;
/**
 *颜色红色
 */
+(UIColor*)ColorWithRedColor;
/**
 字体白色
 */
+ (UIColor*)ColorWithTextWhite;
/**
 字体一级
 */
+ (UIColor*)ColorWithTextOne;
/**
 字体二级
 */
+ (UIColor*)ColorWithTextTwo;
/**
 字体三级
 */
+ (UIColor*)ColorWithTextThree;

/**
 字体大标题
 */
+ (UIFont*)FontWith18;
/**
 字体小标题
 */
+ (UIFont*)FontWith16;
/**
 字体普通字体
 */
+ (UIFont*)FontWith14;
/**
 字体次要字体
 */
+ (UIFont*)FontWith12;
/**
 字体最小字体
 */
+ (UIFont*)FontWith10;
/**
 页面背景色
 */
+ (UIColor*)ColorWithBaseBoard;
/**
 主按钮色-黄色
 */
+ (UIColor*)ColorWithSureBtn;

/*
 主题色彩
 **/
+ (UIColor*)ColorWithMain;
/**
 底色
 */
+ (UIColor*)ColorWithbBaseBoard;
/**
 灰色
 */
+ (UIColor*)ColorWithbGray;
@end

NS_ASSUME_NONNULL_END

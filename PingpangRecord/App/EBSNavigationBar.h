//
//  EBSNavigationBar.h
//  StarDreamiOS
//
//  Created by wing on 2019/8/8.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EBSNavigationBar : UIView

@property (nonnull ,nonatomic, strong) UIView *leftBarItem;
@property (nonnull ,nonatomic, strong) UIView *rightBarItem;
@property (nonnull, nonatomic, copy) NSString *title;
@property (nonnull ,nonatomic, strong) UIView *titleView;
@property (nullable, nonatomic, strong) UIImage *backgroundImage;
@property (nullable, nonatomic, strong) UIImage *shadowImage;// 底部线条
@property (nonatomic, assign) BOOL magicShadow;// 渐变阴影


/**
 创建navigationBar
 
 @return navigationBar对象
 */
+ (instancetype _Nonnull)elkNavigatonBar;

/**
 设置navigationbar的背景图片
 
 @param backImage 背景图片
 */
- (void)setBackgroundImage:(nullable UIImage *)backImage;

/**
 设置navigationbar的shadowImage，nil时显示默认shadowImage
 
 @param shadowImage 阴影图片
 */
- (void)setShadowImage:(nullable UIImage *)shadowImage;



@end

NS_ASSUME_NONNULL_END

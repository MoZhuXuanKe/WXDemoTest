//
//  ELKBaseNavigationBarView.h
//  FontWedgitExtention
//
//  Created by wx on 2019/5/24.
//  Copyright © 2019 wx. All rights reserved.
//

#import "ELKBaseView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^NaviBackBtnBlock)(void);
typedef void(^NaviRightBtnBlock)(void);

@interface ELKBaseNavigationBarView : UIView
//title
@property (nonatomic, strong) NSString * elk_title;
@property(null_resettable, nonatomic,strong) UIFont      *titleFont;
@property(null_resettable, nonatomic,strong) UIColor     *titleColor;

//backBtn
@property(null_resettable, nonatomic,strong) UIFont      *leftBtnFont;
@property(null_resettable, nonatomic,strong) UIColor     *leftBtnColor;

//rightBtn
@property(null_resettable, nonatomic,strong) UIFont      *rightBtnFont;
@property(null_resettable, nonatomic,strong) UIColor     *rightBtnColor;

//隐藏底部分割线
@property (nonatomic, assign) BOOL isHideBottomLine;
@property(null_resettable, nonatomic,strong) UIColor     *bottomLineColor;

@property (nonatomic, copy) NaviBackBtnBlock _Nullable  leftBtnClick;
@property (nonatomic, copy) NaviRightBtnBlock _Nullable rightBtnClick;

/**
 设置导航栏的三个控件的title 

 @param title naviTitle
 @param left leftBtnTitle 可传入图片名(png) title与图片名,只能二选一,要同时设置请使用 - (void)elk_setLeftButtonWithNormal:(UIImage *_Nullable)normal ...方法
 @param right rightBtnTitle 可传入图片名(png) title与图片名,只能二选一,要同时设置请使用 - (void)elk_setRightButtonWithNormal:(UIImage *_Nullable)normal ...方法
 */
- (void)setNaviWithTitle:(NSString *_Nullable)title leftTitle:(NSString *_Nullable)left rightTitle:(NSString *_Nullable)right;
- (void)setNaviWithTitle:(NSString *)title rightTitle:(NSString *)right;
- (void)setNaviWithTitle:(NSString *)title leftTitle:(NSString *)left;

/// 设置左按钮
- (void)elk_setLeftButtonWithNormal:(UIImage *_Nullable)normal highlighted:(UIImage *_Nullable)highlighted title:(NSString *_Nullable)title titleColor:(UIColor *_Nullable)titleColor;
- (void)elk_setLeftButtonWithImage:(UIImage *_Nullable)image title:(NSString *_Nullable)title titleColor:(UIColor *_Nullable)titleColor;
- (void)elk_setLeftButtonWithNormal:(UIImage *_Nullable)normal highlighted:(UIImage *_Nullable)highlighted;
- (void)elk_setLeftButtonWithImage:(UIImage *_Nullable)image;
- (void)elk_setLeftButtonWithTitle:(NSString *_Nullable)title titleColor:(UIColor *_Nullable)titleColor;

/// 设置右按钮
- (void)elk_setRightButtonWithNormal:(UIImage *_Nullable)normal highlighted:(UIImage *_Nullable)highlighted title:(NSString *_Nullable)title titleColor:(UIColor *_Nullable)titleColor;
- (void)elk_setRightButtonWithImage:(UIImage *_Nullable)image title:(NSString *_Nullable)title titleColor:(UIColor *_Nullable)titleColor;
- (void)elk_setRightButtonWithNormal:(UIImage *_Nullable)normal highlighted:(UIImage *_Nullable)highlighted;
- (void)elk_setRightButtonWithImage:(UIImage *_Nullable)image;
- (void)elk_setRightButtonWithTitle:(NSString *_Nullable)title titleColor:(UIColor *_Nullable)titleColor;

@end

NS_ASSUME_NONNULL_END

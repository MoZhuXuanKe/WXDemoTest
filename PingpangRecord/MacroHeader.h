//
//  MacroHeader.h
//  PingpangRecord
//
//  Created by Awin on 2019/10/20.
//  Copyright © 2019年 zidingyi. All rights reserved.
//

#ifndef MacroHeader_h
#define MacroHeader_h

// 屏幕尺寸相关

#define ELKScreenHeight       ([[UIScreen mainScreen] bounds].size.height)
#define ELKScreenWidth        ([[UIScreen mainScreen] bounds].size.width)

#define ELK_StatusBarHeight   ([UIApplication sharedApplication].statusBarFrame.size.height)

#define ELK_isiPhoneX         ((ELK_StatusBarHeight > 21.f) ? YES : NO)

#define ELK_NavBarHeight      (ELK_isiPhoneX ? 88.f : 64.f)
#define ELK_TabBarHeight      (ELK_isiPhoneX ? 83.f : 49.f)

#define ELK_SafeTop           (ELK_isiPhoneX ? 44.f : 0.f)
#define ELK_SafeBottom        (ELK_isiPhoneX ? 34.f : 0.f)
// 设备
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
// 判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define ColorWithRGB(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

// 颜色宏
#define ELK_HexColor(colorH,a) [UIColor colorWithRed:((float)((colorH & 0xff0000) >> 16)) / 255.0 green:((float)((colorH & 0x00ff00) >> 8)) / 255.0 blue:((float)(colorH & 0x0000ff)) / 255.0 alpha:a]

//色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

//强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;
#define WeakSelf  __weak typeof(self) weakself = self;

//View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

//定义UIImage对象
#define kImageNamed(fileName) [UIImage imageNamed:fileName]


#define KFONT(x) [UIFont systemFontOfSize:x]
#define KBOLDFONT(x) [UIFont boldSystemFontOfSize:x]

#define kMainScreen_width [[UIScreen mainScreen] bounds].size.width
#define kMainScreen_height [[UIScreen mainScreen] bounds].size.height
#define kWIDTHRADIUS           kMainScreen_width/375.0
#define kHEIGHTRADIUS          kMainScreen_height/667.0

#pragma mark - 避免循环引用
// 避免循环引用
#ifndef e_weakify
#define e_weakify(var) __weak typeof(var) ELKWeak_##var = var;
#endif

#ifndef e_strongify
#define e_strongify(var) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
__strong typeof(var) var = ELKWeak_##var; \
_Pragma("clang diagnostic pop")
#endif

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#endif


#endif /* MacroHeader_h */

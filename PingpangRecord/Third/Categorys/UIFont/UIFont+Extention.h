//
//  UIFont+Extention.h
//  FontWedgitExtention
//
//  Created by wx on 2019/5/22.
//  Copyright © 2019 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FontWeightStyle) {
    FontWeightStyleRegular, //!< 常规体
    FontWeightStyleMedium, //!< 中黑体
    FontWeightStyleSemibold, //!< 中粗体
    FontWeightStyleUltralight, //!< 极细体
    FontWeightStyleThin, //!< 纤细体
    FontWeightStyleLight, //!< 细体
};


@interface UIFont (Extention)
/**
 苹方字体
 
 @param weight 字体粗细（字重)
 @param fontSize 字体大小
 @return 返回指定字重大小的苹方字体
 */
+ (UIFont *)pingFWithWeight:(FontWeightStyle)weight size:(CGFloat)fontSize;
@end

NS_ASSUME_NONNULL_END

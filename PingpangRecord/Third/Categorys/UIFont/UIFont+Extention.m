//
//  UIFont+Extention.m
//  FontWedgitExtention
//
//  Created by wx on 2019/5/22.
//  Copyright © 2019 wx. All rights reserved.
//

#import "UIFont+Extention.h"

@implementation UIFont (Extention)

+ (UIFont *)pingFWithWeight:(FontWeightStyle)weight size:(CGFloat)fontSize {
    if (weight < FontWeightStyleRegular || weight > FontWeightStyleLight) {
        weight = FontWeightStyleRegular;
    }
    
    NSString *fontName = @"PingFangSC-Regular";
    switch (weight) {
        case FontWeightStyleRegular:
        fontName = @"PingFangSC-Regular";
        break;
        case FontWeightStyleMedium:
        fontName = @"PingFangSC-Medium";
        break;
        case FontWeightStyleSemibold:
        fontName = @"PingFangSC-Semibold";
        break;
        case FontWeightStyleUltralight:
        fontName = @"PingFangSC-Ultralight";
        break;
        case FontWeightStyleThin:
        fontName = @"PingFangSC-Thin";
        break;
        case FontWeightStyleLight:
        fontName = @"PingFangSC-Light";
        break;
    }
    
    UIFont *font = [UIFont fontWithName:fontName size:fontSize];
    
    return font ?: [UIFont systemFontOfSize:fontSize];
}
@end

//
//  UILabel+Style.m
//  InvestApp
//
//  Created by ZhangJiuCheng on 16/3/17.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "UILabel+Style.h"

@implementation UILabel (style)
/**
 *  获取一个新创建的label
 *
 *  @param color <#color description#>
 */

+ (UILabel*)labelWithSize:(UIFont*)font
                withColor:(UIColor*)color
                 withText:(NSString*)text
{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = color;
    label.text = text;
    return label;
}

/**
 *  获取一个新创建的label带图片
 */
+(UILabel*)labelWithSize:(UIFont*)font
               withColor:(UIColor*)color
                withText:(NSString*)text withImg:(NSString *)img  imgRect:(CGRect )imgRect leftImg:(BOOL)leftImg
{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = color;
    NSMutableAttributedString *mAString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@ ",text]];
    
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = [UIImage imageNamed:img];
    attch.bounds = imgRect;
    //将图片加入富文本
    NSAttributedString *imgString = [NSAttributedString attributedStringWithAttachment:attch];
    NSMutableAttributedString *ms=[[NSMutableAttributedString alloc]init];
    ms=(NSMutableAttributedString *)imgString;
    if (leftImg) {
        [ms appendAttributedString:mAString];
        label.attributedText=ms;
    }else{
        [mAString appendAttributedString:ms];
        label.attributedText=mAString;
    }
    return label;
}
+ (UILabel*)labelWithframe:(CGRect )frame withSize:(NSInteger)size
                 withColor:(UIColor*)color
                  withText:(NSString*)text
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:size];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = color;
    label.text = text;
    label.frame=frame;
    return label;
}
@end

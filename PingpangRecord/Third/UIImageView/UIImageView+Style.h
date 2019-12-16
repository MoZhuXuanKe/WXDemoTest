//
//  UIImageView+Style.h
//  FaceLoan
//
//  Created by pjh on 16/12/7.
//  Copyright © 2016年 pjh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView(style)

/**
 *普通图片
 */
+(UIImageView *)imageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName;



/**
 包含圆角的imageView
 */
+(UIImageView *)imageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName cornerRadius:(CGFloat)cornerRadius;

@end

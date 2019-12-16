//
//  UIImageView+Style.m
//  FaceLoan
//
//  Created by pjh on 16/12/7.
//  Copyright © 2016年 pjh. All rights reserved.
//

#import "UIImageView+Style.h"

@implementation UIImageView(style)

+(UIImageView *)imageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    
    if (imageName) {
        imageView.image = [UIImage imageNamed:imageName];
    }
    return imageView;
}




+(UIImageView *)imageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName cornerRadius:(CGFloat)cornerRadius{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    if (imageName) {
        imageView.image = [UIImage imageNamed:imageName];
    }
    imageView.layer.cornerRadius = cornerRadius;
    imageView.layer.masksToBounds = YES;
    return imageView;
}


@end

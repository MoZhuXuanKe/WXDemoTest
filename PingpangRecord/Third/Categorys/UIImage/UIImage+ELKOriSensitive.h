//
//  UIImage+ELKOriSensitive.h
//  ELKHTTPRequest
//
//  Created by Jonathan on 2019/5/30.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ELKOriSensitive)


- (UIImage *)fixOrientation;



+ (UIImage *)imageWithColor:(UIColor *)iColor;


@end

NS_ASSUME_NONNULL_END

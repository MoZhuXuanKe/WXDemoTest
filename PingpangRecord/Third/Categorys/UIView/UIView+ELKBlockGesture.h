//
//  UIView+ELKBlockGesture.h
//  StarDreamiOS
//
//  Created by wx on 2019/8/12.
//  Copyright © 2019 elk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^GestureActionBlock)(UIGestureRecognizer *gestureRecoginzer);

@interface UIView (ELKBlockGesture)

- (void)addTapActionWithBlock:(GestureActionBlock)block;
- (void)addLongPressActionWithBlock:(GestureActionBlock)block;

@end

NS_ASSUME_NONNULL_END

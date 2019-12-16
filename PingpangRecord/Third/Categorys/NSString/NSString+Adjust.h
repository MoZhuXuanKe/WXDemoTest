//
//  NSString+Adjust.h
//  FontWedgitExtention
//
//  Created by wx on 2019/5/29.
//  Copyright © 2019 wx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Adjust)

- (CGSize)elk_sizeWithFont:(UIFont *)font inSize:(CGSize)size;
- (CGSize)elk_sizeWithFont:(UIFont *)font inSize:(CGSize)size lineSpacing:(CGFloat)space;
- (CGSize)elk_sizeWithFont:(UIFont *)font inSize:(CGSize)size lineHeight:(CGFloat)lineHeight;
+ (BOOL)elk_isNilOrEmptyForString:(NSString *)aString;

- (NSUInteger)elk_numberOfMatchesNonChineseCharacterSet;
- (NSString *)elk_removeSpaceOfTyping;
+ (NSUInteger)elk_numberOfMatchesNonChineseCharacterSetInString:(NSString *)aString;
@end

NS_ASSUME_NONNULL_END

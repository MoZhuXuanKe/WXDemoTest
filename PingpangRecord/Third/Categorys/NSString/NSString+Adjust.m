//
//  NSString+Adjust.m
//  FontWedgitExtention
//
//  Created by wx on 2019/5/29.
//  Copyright © 2019 wx. All rights reserved.
//

#import "NSString+Adjust.h"

@implementation NSString (Adjust)

- (CGSize)elk_sizeWithFont:(UIFont *)font inSize:(CGSize)size lineSpacing:(CGFloat)space{
    CGSize s = CGSizeZero;
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.lineSpacing = space;
    NSDictionary * attributes = @{NSFontAttributeName : font,
                                  NSParagraphStyleAttributeName : paragraphStyle};
    s = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |
         NSStringDrawingUsesFontLeading
                        attributes:attributes
                           context:nil].size;
    return s;
}

- (CGSize)elk_sizeWithFont:(UIFont *)font inSize:(CGSize)size {
    return [self elk_sizeWithFont:font inSize:size lineSpacing:0];
}

- (CGSize)elk_sizeWithFont:(UIFont *)font inSize:(CGSize)size lineHeight:(CGFloat)lineHeight {
    CGSize s = CGSizeZero;
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.lineSpacing = 0.f;
    paragraphStyle.minimumLineHeight = lineHeight;
    
    NSDictionary * attributes = @{NSFontAttributeName : font,
                                  NSParagraphStyleAttributeName : paragraphStyle};
    s = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |
         NSStringDrawingUsesFontLeading
                        attributes:attributes
                           context:nil].size;
    return s;
}

+ (BOOL)elk_isNilOrEmptyForString:(NSString *)aString {
    if ([aString isEqual:[NSNull null]] || !aString || !aString.length) {
        return YES;
    }
    return NO;
}

- (NSString *)elk_removeSpaceOfTyping {
    const unichar replace[1] = {0x2006};//Chinese Input Method special space while typing.
    NSString *str = [NSString stringWithCharacters:replace length:1];
    NSString *ret = nil;
    ret = [self stringByReplacingOccurrencesOfString:str withString:@""];
    ret = [ret stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return ret;
}

- (NSUInteger)elk_numberOfMatchesNonChineseCharacterSet {
    return [NSString elk_numberOfMatchesNonChineseCharacterSetInString:self];
}

+ (NSUInteger)elk_numberOfMatchesNonChineseCharacterSetInString:(NSString *)aString {
    if ([self elk_isNilOrEmptyForString:aString]) {
        return 0;
    }
    
    NSString *pattern = @"[^\u4E00-\u9FFF]";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    NSUInteger numberOfMatches = [regex numberOfMatchesInString:aString
                                                        options:0
                                                          range:NSMakeRange(0, [aString length])];
    return numberOfMatches;
}

- (NSString *)elk_hexString {
    NSUInteger len = [self length];
    unichar *chars = malloc(len * sizeof(unichar));
    [self getCharacters:chars];
    
    NSMutableString *hexString = [[NSMutableString alloc] init];
    for(NSUInteger i = 0; i < len; i++ ) {
        [hexString appendString:[NSString stringWithFormat:@"%x", chars[i]]];
    }
    free(chars);
    
    return hexString;
}

@end

//
//  EBSNavigationBar.m
//  StarDreamiOS
//
//  Created by wing on 2019/8/8.
//  Copyright © 2019 elk. All rights reserved.
//

#import "EBSNavigationBar.h"
#import "UIImage+ELKOriSensitive.h"

#define EBSNavigationBarLeft 5.f
#define EBSNavigationBarRight 20.f

@interface EBSNavigationBar ()

@property (nonatomic, strong) UIImageView *barBackImgView;
@property (nonatomic, strong) UIView *barView;

@property (nonatomic, strong) UIView *leftBarView;
@property (nonatomic, strong) UIView *rightBarView;

@property (nonatomic, strong) UIView *titleBarView;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *shadowImgView;

@end


@implementation EBSNavigationBar

// 创建navigationBar
+ (instancetype _Nonnull)elkNavigatonBar
{
    EBSNavigationBar *navBar = [[[self class] alloc] initWithFrame:CGRectMake(0.f, 0.f, ELKScreenWidth, ELK_NavBarHeight)];
    
    return navBar;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initBarView:frame];
    }
    
    return self;
}

- (void)initBarView:(CGRect)frame
{
    if (!_barView) {
        CGFloat barTop = ELK_StatusBarHeight;
        
        self.backgroundColor = [UIColor clearColor];
        
        _barBackImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        _barBackImgView.backgroundColor = [UIColor clearColor];
        [_barBackImgView setImage:[UIImage imageWithColor:UIColor.whiteColor]];
        [self addSubview:_barBackImgView];
        
        _barView = [[UIView alloc] initWithFrame:CGRectMake(0.f, barTop, CGRectGetWidth(frame), 44.f)];
        _barView.backgroundColor = [UIColor clearColor];
        [self addSubview:_barView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100.f, 11.f, ELKScreenWidth - 200.f, 22.f)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:19.f];
        _titleLabel.textColor = UIColor.blackColor;
        [_barView addSubview:_titleLabel];
        
        _shadowImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, CGRectGetHeight(_barView.frame) - 0.5f, CGRectGetWidth(_barView.frame), 0.5f)];
        [self setShadowImage:[UIImage imageWithColor:UIColor.blackColor]];
        [_barView addSubview:_shadowImgView];
    }
}

- (void)setTitle:(NSString *)title
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:19.f];
        _titleLabel.textColor = UIColor.blackColor;
        [_barView addSubview:_titleLabel];
    }
    _titleLabel.text = title;
    _title = title;
    [self fitBarSize];
}
- (void)setTitleView:(UIView *)titleView
{
    if (!_titleBarView) {
        _titleBarView = [[UIView alloc] initWithFrame:CGRectMake(66.f, 0.f, ELKScreenWidth - 132.f, 44.f)];
        _titleBarView.backgroundColor = [UIColor clearColor];
        [_barView addSubview:_titleBarView];
    }
    [_titleView removeFromSuperview];
    [_titleBarView addSubview:titleView];
    CGRect itemRect = titleView.frame;
    _titleView = titleView;
    _titleBarView.frame = CGRectMake((ELKScreenWidth - CGRectGetWidth(itemRect)) / 2.f, 0.f, CGRectGetWidth(itemRect), 44.f);
    _titleView.frame = CGRectMake(0.f, (44.f - CGRectGetHeight(itemRect)) / 2.f, CGRectGetWidth(itemRect), CGRectGetHeight(itemRect));
    [self fitBarSize];
}
- (void)setLeftBarItem:(UIView *)leftBarItem
{
    if (!_leftBarView) {
        _leftBarView = [[UIView alloc] initWithFrame:CGRectMake(EBSNavigationBarLeft, 0.f, 50.f, 44.f)];
        _leftBarView.backgroundColor = [UIColor clearColor];
        [_barView addSubview:_leftBarView];
    }
    [_leftBarItem removeFromSuperview];
    [_leftBarView addSubview:leftBarItem];
    CGRect itemRect = leftBarItem.frame;
    _leftBarItem = leftBarItem;
    _leftBarView.frame = CGRectMake(EBSNavigationBarLeft, 0.f, CGRectGetWidth(itemRect), 44.f);
    _leftBarItem.frame = CGRectMake(CGRectGetMinX(itemRect), (44.f - CGRectGetHeight(itemRect)) / 2.f, CGRectGetWidth(itemRect), CGRectGetHeight(itemRect));
    [self fitBarSize];
}
- (void)setRightBarItem:(UIView *)rightBarItem
{
    if (!_rightBarView) {
        _rightBarView = [[UIView alloc] initWithFrame:CGRectMake(ELKScreenWidth - EBSNavigationBarRight - 50.f, 0.f, 50.f, 44.f)];
        _rightBarView.backgroundColor = [UIColor clearColor];
        [_barView addSubview:_rightBarView];
    }
    [_rightBarItem removeFromSuperview];
    [_rightBarView addSubview:rightBarItem];
    CGRect itemRect = rightBarItem.frame;
    _rightBarItem = rightBarItem;
    _rightBarView.frame = CGRectMake(ELKScreenWidth - CGRectGetWidth(itemRect) - EBSNavigationBarRight, 0.f, CGRectGetWidth(itemRect), 44.f);
    _rightBarItem.frame = CGRectMake(CGRectGetMinX(itemRect), (44.f - CGRectGetHeight(itemRect)) / 2.f, CGRectGetWidth(itemRect), CGRectGetHeight(itemRect));
    [self fitBarSize];
}
- (void)fitBarSize
{
    CGFloat titleWidth = 0.f;
    CGFloat titBarWidth = 0.f;
    CGFloat leftWidth = 0.f;
    CGFloat rightWidth = 0.f;
    
    if (self.leftBarView) {
        leftWidth = CGRectGetWidth(self.leftBarView.frame);
        self.leftBarView.frame = CGRectMake(EBSNavigationBarLeft, 0.f, leftWidth, 44.f);
    }
    if (self.rightBarView) {
        rightWidth = CGRectGetWidth(self.rightBarView.frame);
        self.rightBarView.frame = CGRectMake(ELKScreenWidth - rightWidth - EBSNavigationBarRight, 0.f, rightWidth, 44.f);
    }
    if (self.title) {
        titleWidth = [self strSizeWithLimit:CGSizeMake(ELKScreenWidth, 22.f) fontSize:19.f string:self.title].width;
        CGFloat spaceWidth = (leftWidth > rightWidth) ? leftWidth : rightWidth;
        if ((ELKScreenWidth - (spaceWidth * 2) - (EBSNavigationBarRight * 2) - 2.f) >=  titleWidth) {
            self.titleLabel.frame = CGRectMake((ELKScreenWidth - titleWidth) / 2, 11.f, titleWidth, 22.f);
        } else {
            self.titleLabel.frame = CGRectMake(EBSNavigationBarRight + 1.f + leftWidth, 11.f, (ELKScreenWidth - leftWidth - rightWidth - EBSNavigationBarRight * 2 -2.f), 22.f);
        }
    }
    _titleLabel.hidden = NO;
    if (self.titleBarView) {
        titBarWidth = CGRectGetWidth(self.titleBarView.frame);
        _titleLabel.hidden = YES;
        
        CGFloat spaceWidth = (leftWidth > rightWidth) ? leftWidth : rightWidth;
        if ((ELKScreenWidth - (spaceWidth * 2) - (EBSNavigationBarRight * 2) - 2.f) >=  titBarWidth) {
            self.titleBarView.frame = CGRectMake((ELKScreenWidth - titBarWidth) / 2, 0.f, titBarWidth, 44.f);
        } else {
            self.titleBarView.frame = CGRectMake(EBSNavigationBarRight + 1.f + leftWidth, 0.f, (ELKScreenWidth - leftWidth - rightWidth - EBSNavigationBarRight * 2 - 2.f), 44.f);
        }
    }
}

// 设置navigationbar的背景图片
- (void)setBackgroundImage:(nullable UIImage *)backImage
{
    UIImage *image =  [UIImage imageWithColor:[UIColor whiteColor]];
    if (backImage) {
        image = backImage;
    }
    _backgroundImage = image;
    [_barBackImgView setImage:image];
}
// 设置navigationbar的shadowImage，nil时显示默认shadowImage
- (void)setShadowImage:(nullable UIImage *)shadowImage
{
    UIImage *image = [UIImage imageWithColor:ELK_HexColor(0xCCCCCC, 1.f)];
    if (shadowImage) {
        image = shadowImage;
    }
    _shadowImage = image;
    [_shadowImgView setImage:image];
}

- (void)setMagicShadow:(BOOL)magicShadow
{
    _magicShadow = magicShadow;
    if (magicShadow) {
        [self addShadowColor:ELK_HexColor(0xE0E0E0, 1.f) offSet:CGSizeMake(0.f, 3.f) opacity:0.4f];
        [_shadowImgView setImage:[UIImage new]];
    } else {
        [self addShadowColor:[UIColor clearColor] offSet:CGSizeZero opacity:0.f];
        UIImage *image = [UIImage imageWithColor:ELK_HexColor(0xCCCCCC, 1.f)];
        if (self.shadowImage) {
            image = self.shadowImage;
        }
        [_shadowImgView setImage:image];
    }
}

- (CGSize)strSizeWithLimit:(CGSize)limitSize fontSize:(CGFloat)font string:(NSString *)string
{
    CGSize strSize = [string boundingRectWithSize:limitSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    return strSize;
}
@end

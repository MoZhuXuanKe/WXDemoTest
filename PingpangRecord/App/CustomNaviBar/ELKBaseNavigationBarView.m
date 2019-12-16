//
//  ELKBaseNavigationBarView.m
//  FontWedgitExtention
//
//  Created by wx on 2019/5/24.
//  Copyright © 2019 wx. All rights reserved.
//

#import "ELKBaseNavigationBarView.h"
#import "UIFont+Extention.h"
#import "NSString+Adjust.h"



#define KScreenHeight       ([[UIScreen mainScreen] bounds].size.height)
#define KScreenWidth        ([[UIScreen mainScreen] bounds].size.width)

#define KStatusBarHeight    ([UIApplication sharedApplication].statusBarFrame.size.height)

#define KIPhoneX            ((KScreenHeight >= 812.f) ? YES : NO)

#define KNavBarHeight      (KIPhoneX ? 88.f : 64.f)
#define KTabBarHeight      (KIPhoneX ? 83.f : 49.f)

#define KSafeTop           (KIPhoneX ? 44.f : 0.f)
#define KSafeBottom        (KIPhoneX ? 34.f : 0.f)

static CGFloat const padding = 10;
static CGFloat const spacing = 20;
static CGFloat const titleFont = 17;
static CGFloat const buttonFont = 14;

@interface ELKBaseNavigationBarView ()
@property (nonatomic, strong) UIView *naviView;
@property (nonatomic, strong) UILabel *naviTitleLabel;
@property (nonatomic, strong) UIButton *naviBackBtn;
@property (nonatomic, strong) UIButton *naviRightBtn;
@property (nonatomic, strong) UIView *line;
@end

@implementation ELKBaseNavigationBarView
{
    NSString * _title;
    NSString * _leftTitle;
    NSString * _rightTitle;
    NSString * _leftImg;
    NSString * _rightImg;
}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadViews];
        [self layoutViews];
    }
    return self;
}

- (void)updateConstraints {
    [self layoutViews];
    [super updateConstraints];
}
/// 设置导航栏title
- (void)setElk_title:(NSString *)elk_title
{
    [self setNaviWithTitle:elk_title leftTitle:@"back_white" rightTitle:@""];
}

- (void)setNaviWithTitle:(NSString *)title leftTitle:(NSString *)left
{
    [self setNaviWithTitle:title leftTitle:left rightTitle:@""];
}

- (void)setNaviWithTitle:(NSString *)title rightTitle:(NSString *)right
{
    [self setNaviWithTitle:title leftTitle:@"back_white" rightTitle:right];
}

#pragma mark - 设置左中右 三个控件 title
- (void)setNaviWithTitle:(NSString *)title leftTitle:(NSString *)left rightTitle:(NSString *)right
{
    if (!title && !left && !right) {
        self.naviTitleLabel.hidden = YES;
        self.naviBackBtn.hidden = YES;
        self.naviRightBtn.hidden = YES;
        return;
    }
    
    if (title) {
        if (title.length != 0 ) {
            if (self.naviTitleLabel.text != title) {
                _title = title;
                self.naviTitleLabel.text = title;
                [self adjustTitleSize:title];
            }
        }
    }else{
        self.naviTitleLabel.hidden = YES;
    }
    
    if (left) {
        UIImage * img = [UIImage imageNamed:left];
        if (img) {
            [self.naviBackBtn setImage:img forState:UIControlStateNormal];
            _leftImg = left;
        }else{
            [self.naviBackBtn setImage:nil forState:UIControlStateNormal];
            [self.naviBackBtn setTitle:left forState:UIControlStateNormal];
            _leftTitle = left;
            [self adjustLeftBtnSize:left];
        }
    }else{
        [self.naviBackBtn setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
    }
    
    if (right) {
        UIImage * img = [UIImage imageNamed:right];
        if (img) {
            [self.naviRightBtn setImage:img forState:UIControlStateNormal];
            self.naviRightBtn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
            _rightImg = right;
        }else{
            [self.naviRightBtn setTitle:right forState:UIControlStateNormal];
            _rightTitle = right;
            [self adjusRightBtnSize:right];
        }
    }else{
        self.naviRightBtn.hidden = YES;
    }
}

#pragma mark - 左btn_click

- (void)naviLeftButtonClick:(UIButton *)sender{
    if (self.leftBtnClick) {
        self.leftBtnClick();
    }
}
#pragma mark - 右按钮btn_click

- (void)naviRightButtonClick:(UIButton *)sender{
    if (self.rightBtnClick) {
        self.rightBtnClick();
    }
}

#pragma mark - 左右按钮

- (void)elk_setLeftButtonWithNormal:(UIImage * _Nullable)normal highlighted:(UIImage * _Nullable)highlighted title:(NSString * _Nullable)title titleColor:(UIColor *_Nullable)titleColor {
    
    if (!(normal || highlighted || title)) return;
    
    self.naviBackBtn.hidden = NO;
    if (normal) {
        [self.naviBackBtn setImage:normal forState:UIControlStateNormal];
    }
    if (highlighted) {
        [self.naviBackBtn setImage:highlighted forState:UIControlStateHighlighted];
    }
    if (title) {
        [self.naviBackBtn setTitle:title forState:UIControlStateNormal];
        [self adjustLeftBtnSize:title];
    }
    if (_leftImg) {
         [self.naviBackBtn setImage:[UIImage imageNamed:_leftImg] forState:UIControlStateNormal];
         [self.naviBackBtn setImage:[UIImage imageNamed:_leftImg] forState:UIControlStateHighlighted];
    }
    if ((title || _leftTitle) && (normal || _leftImg)) {
         [self adjustSizeToFit:self.naviBackBtn];
    }
    if (titleColor) {
        [self.naviBackBtn setTitleColor:titleColor forState:UIControlStateNormal];
    }
}
- (void)elk_setLeftButtonWithImage:(UIImage * _Nullable)image title:(NSString * _Nullable)title titleColor:(UIColor * _Nullable)titleColor {
    [self elk_setLeftButtonWithNormal:image highlighted:image title:title titleColor:titleColor];
}
- (void)elk_setLeftButtonWithNormal:(UIImage * _Nullable)normal highlighted:(UIImage * _Nullable)highlighted {
    [self elk_setLeftButtonWithNormal:normal highlighted:highlighted title:nil titleColor:nil];
}
- (void)elk_setLeftButtonWithImage:(UIImage * _Nullable)image {
    [self elk_setLeftButtonWithNormal:image highlighted:image title:nil titleColor:nil];
}
- (void)elk_setLeftButtonWithTitle:(NSString * _Nullable)title titleColor:(UIColor * _Nullable)titleColor {
    [self elk_setLeftButtonWithNormal:nil highlighted:nil title:title titleColor:titleColor];
}

- (void)elk_setRightButtonWithNormal:(UIImage * _Nullable)normal highlighted:(UIImage * _Nullable)highlighted title:(NSString * _Nullable)title titleColor:(UIColor * _Nullable)titleColor {
    
    if (!(normal || highlighted || title)) return;
    
    self.naviRightBtn.hidden = NO;
    if (normal) {
        [self.naviRightBtn setImage:normal forState:UIControlStateNormal];
    }
    if (highlighted) {
        [self.naviRightBtn setImage:highlighted forState:UIControlStateHighlighted];
    }
    if (title) {
        [self.naviRightBtn setTitle:title forState:UIControlStateNormal];
        [self adjusRightBtnSize:title];
    }
    if (_rightImg) {
        [self.naviRightBtn setImage:[UIImage imageNamed:_rightImg] forState:UIControlStateNormal];
        [self.naviRightBtn setImage:[UIImage imageNamed:_rightImg] forState:UIControlStateHighlighted];
    }
    if ((title || _rightTitle) && (normal || _rightImg)) {
        [self adjustSizeToFit:self.naviRightBtn];
    }
    if (titleColor) {
        [self.naviRightBtn setTitleColor:titleColor forState:UIControlStateNormal];
    }
}
- (void)elk_setRightButtonWithImage:(UIImage * _Nullable)image title:(NSString * _Nullable)title titleColor:(UIColor * _Nullable)titleColor {
    [self elk_setRightButtonWithNormal:image highlighted:image title:title titleColor:titleColor];
}
- (void)elk_setRightButtonWithNormal:(UIImage * _Nullable)normal highlighted:(UIImage * _Nullable)highlighted {
    [self elk_setRightButtonWithNormal:normal highlighted:highlighted title:nil titleColor:nil];
}
- (void)elk_setRightButtonWithImage:(UIImage * _Nullable)image {
    [self elk_setRightButtonWithNormal:image highlighted:image title:nil titleColor:nil];
}
- (void)elk_setRightButtonWithTitle:(NSString * _Nullable)title titleColor:(UIColor * _Nullable)titleColor {
    [self elk_setRightButtonWithNormal:nil highlighted:nil title:title titleColor:titleColor];
}

#pragma mark - UI

- (void)loadViews
{
    [self configDefault];
    [self addSubview:self.naviView];
    [self.naviView addSubview:self.naviTitleLabel];
    [self.naviView addSubview:self.naviBackBtn];
    [self.naviView addSubview:self.naviRightBtn];
}

-(void)configDefault{
    _titleFont = [UIFont pingFWithWeight:FontWeightStyleMedium size:titleFont];
    _leftBtnFont = [UIFont pingFWithWeight:FontWeightStyleRegular size:buttonFont];
    _rightBtnFont = [UIFont pingFWithWeight:FontWeightStyleRegular size:buttonFont];
    _titleColor = [UIColor whiteColor];
    _leftBtnColor = [UIColor whiteColor];
    _rightBtnColor = [UIColor whiteColor];
}

- (void)layoutViews
{
    _naviView.frame = CGRectMake(0, 0, KScreenWidth, KNavBarHeight);
    _line = [[UIView alloc]initWithFrame:CGRectMake(0, KNavBarHeight - 1, KScreenWidth, 0.5)];
    _line.backgroundColor=[UIColor lightGrayColor];
    [_naviView addSubview:_line];
}

#pragma mark - UIStyle

- (void)setTitleFont:(UIFont *)titleFont {
    if (titleFont) {
        _titleFont = titleFont;
        _naviTitleLabel.font = titleFont;
        [self adjustTitleSize:_naviTitleLabel.text];
    }
}

- (void)setTitleColor:(UIColor *)titleColor {
    if (titleColor) {
        _titleColor = titleColor;
        _naviTitleLabel.textColor = titleColor;
    }
}

-(void)setLeftBtnFont:(UIFont *)leftBtnFont {
    if (leftBtnFont) {
        _leftBtnFont = leftBtnFont;
        _naviBackBtn.titleLabel.font = leftBtnFont;
        [self adjustLeftBtnSize:_leftTitle];
    }
}

-(void)setLeftBtnColor:(UIColor *)leftBtnColor {
    if (leftBtnColor) {
        _leftBtnColor = leftBtnColor;
        [_naviBackBtn setTitleColor:leftBtnColor forState:UIControlStateNormal];
    }
}

- (void)setRightBtnFont:(UIFont *)rightBtnFont {
    if (rightBtnFont) {
        _rightBtnFont = rightBtnFont;
        _naviRightBtn.titleLabel.font = rightBtnFont;
        [self adjustLeftBtnSize:_rightTitle];
    }
}

-(void)setRightBtnColor:(UIColor *)rightBtnColor {
    if (rightBtnColor) {
        _rightBtnColor = rightBtnColor;
        [_naviRightBtn setTitleColor:rightBtnColor forState:UIControlStateNormal];
    }
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    if (backgroundColor) {
        _naviView.backgroundColor = backgroundColor;
    }
}

- (void)setIsHideBottomLine:(BOOL)isHideBottomLine {
    if (isHideBottomLine) {
        _isHideBottomLine = isHideBottomLine;
        _line.hidden = isHideBottomLine;
    }
}

-(void)setBottomLineColor:(UIColor *)bottomLineColor {
    if (bottomLineColor) {
        _bottomLineColor = bottomLineColor;
        _line.backgroundColor = bottomLineColor;
    }
}

#pragma mark - adjustSize

- (void)adjustTitleSize:(NSString*)title {
    
    CGFloat width =  [title elk_sizeWithFont:_titleFont inSize:CGSizeMake(CGFLOAT_MAX, 44)].width;
    _naviTitleLabel.frame = CGRectMake((KScreenWidth - ceilf(width))/2, KStatusBarHeight, ceilf(width), 44);
}

- (void)adjustLeftBtnSize:(NSString*)title {
    
    CGFloat width =  [title elk_sizeWithFont:_leftBtnFont inSize:CGSizeMake(CGFLOAT_MAX, 44)].width;
    _naviBackBtn.frame = CGRectMake(padding, KStatusBarHeight, ceilf(width) + spacing, 44);
}

- (void)adjusRightBtnSize:(NSString*)title {
    
    CGFloat width =  [title elk_sizeWithFont:_rightBtnFont inSize:CGSizeMake(CGFLOAT_MAX, 44)].width;
    _naviRightBtn.frame = CGRectMake(KScreenWidth - ceilf(width) - spacing - padding, KStatusBarHeight, ceilf(width) + spacing, 44);
}

- (void)adjustSizeToFit:(UIButton*)btn {
    
    CGFloat width = [btn sizeThatFits:CGSizeMake(CGFLOAT_MAX, 44)].width;
    if (btn == _naviBackBtn) {
        _naviBackBtn.frame = CGRectMake(padding, KStatusBarHeight, ceilf(width) + spacing, 44);
    }else {
        _naviRightBtn.frame = CGRectMake(KScreenWidth - ceilf(width) - spacing - padding, KStatusBarHeight, ceilf(width) + spacing, 44);
    }
}

#pragma mark - Getter

- (UIView *)naviView{
    if (!_naviView) {
        _naviView = [[UIView alloc] init];
    }
    return _naviView;
}

- (UILabel *)naviTitleLabel{
    if (!_naviTitleLabel) {
        _naviTitleLabel = [[UILabel alloc] init];
        _naviTitleLabel.frame = CGRectMake(44 + padding, KStatusBarHeight, KScreenWidth - (88 + padding*2), 44);
        _naviTitleLabel.textAlignment = NSTextAlignmentCenter;
        _naviTitleLabel.font = _titleFont;
        _naviTitleLabel.textColor = _titleColor;
    }
    return _naviTitleLabel;
}

- (UIButton *)naviBackBtn{
    if (!_naviBackBtn) {
        _naviBackBtn = [[UIButton alloc] init];
        _naviBackBtn.frame = CGRectMake(padding, KStatusBarHeight, 44, 44);
        [_naviBackBtn setTitleColor:_leftBtnColor forState:UIControlStateNormal];
        _naviBackBtn.titleLabel.font = _leftBtnFont;
        [_naviBackBtn addTarget:self action:@selector(naviLeftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _naviBackBtn;
}

- (UIButton *)naviRightBtn{
    if (!_naviRightBtn) {
        _naviRightBtn = [[UIButton alloc] init];
        _naviRightBtn.frame = CGRectMake(KScreenWidth - 44 - padding, KStatusBarHeight, 44, 44);
        [_naviRightBtn setTitleColor:_rightBtnColor forState:UIControlStateNormal];
        _naviRightBtn.titleLabel.font = _rightBtnFont;
        [_naviRightBtn addTarget:self action:@selector(naviRightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _naviRightBtn;
}

@end

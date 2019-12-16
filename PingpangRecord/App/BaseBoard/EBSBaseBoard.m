//
//  EBSBaseBoard.m
//  EBoSports
//
//  Created by wx on 2019/10/8.
//  Copyright © 2019 zidingyi. All rights reserved.
//

#import "EBSBaseBoard.h"

@interface EBSBaseBoard ()

@end

@implementation EBSBaseBoard

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self addCustomNaviBar];
}

-(void)addCustomNaviBar {
    
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:self.naviView];
    
    [self.naviView setNaviWithTitle:@"" leftTitle:@"" rightTitle:@""];
    e_weakify(self)
    self.naviView.leftBtnClick = ^{
        e_strongify(self)
        [self.navigationController popViewControllerAnimated:YES];
    };
}

#pragma mark - Getter
- (ELKBaseNavigationBarView *)naviView{
    if (!_naviView) {
        _naviView = [[ELKBaseNavigationBarView alloc] init];
        _naviView.frame = CGRectMake(0, 0, ELKScreenWidth, ELK_NavBarHeight);
        _naviView.backgroundColor = [AppStyleConfiguration ColorWithMain];
    }
    return _naviView;
}

@end

//
//  EBSNavigationController.m
//  StarDreamiOS
//
//  Created by wing on 2019/8/2.
//  Copyright © 2019 wing. All rights reserved.
//

#import "EBSNavigationController.h"

@interface EBSNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation EBSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.hidden = YES;
    
    __weak EBSNavigationController *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    NSArray *navArray = navigationController.viewControllers;
//    UIViewController *root = [navArray firstObject];
//    if (root != viewController) {
//        [viewController addLeftBarItemTarget:self action:@selector(popAction:)];
//    }
    
    navigationController.interactivePopGestureRecognizer.delegate = (id)self;
//    self.navigationBar.tintColor = ELK_HexColor(0x000000, 1.f);
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        if (navigationController.childViewControllers.count == 1) {
            self.interactivePopGestureRecognizer.enabled = NO;

        } else {
            self.interactivePopGestureRecognizer.enabled = YES;

        }

    }
}

- (void)popAction:(UIButton *)sender
{
    [self popViewControllerAnimated:YES];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)] && animated == YES ){
        self.interactivePopGestureRecognizer.enabled = NO;
        
    }
    
    [super pushViewController:viewController animated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)] && animated == YES) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    return [super popToRootViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    return [super popToViewController:viewController animated:animated];
}




@end

//
//  UIViewController+XHPhoto.m

//  XHPhotoExample
//
//  Created by xiaohui on 16/6/6.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHPhoto

#import "UIViewController+XHPhoto.h"
#import "objc/runtime.h"
#import <AssetsLibrary/ALAssetsLibrary.h>

#ifdef DEBUG
#define debugLog(...)    NSLog(__VA_ARGS__)
#else
#define debugLog(...)
#endif

#define XH_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define XH_IS_PAD (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)

static  BOOL canEdit = NO;
static  BOOL tempCanEdit = NO;
static  char blockKey;
static  char tempBlockKey;

@interface UIViewController()<UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIAlertViewDelegate>

@property (nonatomic,copy)photoBlock photoBlock;
@property (nonatomic,copy)photoBlock tempPhotoBlock;

@end

@implementation UIViewController (XHPhoto)

#pragma mark-set
-(void)setPhotoBlock:(photoBlock)photoBlock
{
    objc_setAssociatedObject(self, &blockKey, photoBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void)setTempPhotoBlock:(photoBlock)tempPhotoBlock
{
    objc_setAssociatedObject(self, &tempBlockKey, tempPhotoBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark-get
- (photoBlock )photoBlock
{
    return objc_getAssociatedObject(self, &blockKey);
}
-(photoBlock)tempPhotoBlock
{
    return objc_getAssociatedObject(self, &tempBlockKey);
}
-(void)showCanEdit:(BOOL)edit photo:(photoBlock)block
{
    tempCanEdit = edit;
    self.tempPhotoBlock = [block copy];

    [self ActionSheetWithTitle:nil message:nil destructive:@"Cancel" destructiveAction:^(NSInteger index) {
        
    } andOthers:@[@"The camera", @"Photo album"] animated:YES action:^(NSInteger index) {
        if (index == 0) {
             [self showCameraCanEdit:tempCanEdit photo:self.tempPhotoBlock];
        }else if (index == 1) {
            [self showPhotoLibraryCanEdit:tempCanEdit photo:self.tempPhotoBlock];
        }
    }];
}
-(void)showPhotoLibraryCanEdit:(BOOL)edit photo:(photoBlock)block
{
    canEdit = edit;
    self.photoBlock = [block copy];
    
    //权限
    if(![self authorWithType:1]) return;
    
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentScrollableAxes;
    }
    
    //相册
    UIImagePickerController* imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = canEdit;
    imagePickerController.sourceType =UIImagePickerControllerSourceTypePhotoLibrary;
 
    [self presentViewController:imagePickerController animated:YES completion:NULL];
}
-(void)showCameraCanEdit:(BOOL)edit photo:(photoBlock)block
{
    canEdit = edit;
    self.photoBlock = [block copy];
    
    //权限
    if(![self authorWithType:0]) return;
    
    //相机
    UIImagePickerController* imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = canEdit;
    //是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagePickerController animated:YES completion:NULL];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warm prompt" message:@"The device does not support cameras" delegate:nil cancelButtonTitle:@"Sure" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}
/**
 权限是否开启
 
 @param type 0相机,1相册
 @return 权限开启YES,否则NO
 */
-(BOOL)authorWithType:(NSInteger)type
{
    //权限
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied) {
        NSString *photoType = type==0?@"The camera":@"Photo album";
        NSString * title = [NSString stringWithFormat:@"%@ permission not opened",photoType];
        NSString * msg = [NSString stringWithFormat:@"Please enable this application in system Settings%@service\n(setting->privacy->%@->on)",photoType,photoType];
        NSString * cancelTitle = @"know";
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:nil, nil];
        [alertView show];
        debugLog(@"%@ permission not opened",photoType);
        return NO;
    }
    return YES;
}

#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    if (@available(ios 11.0,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    UIImage *image;
    //是否要裁剪
    if ([picker allowsEditing]){
        
        //编辑之后的图像
        image = [info objectForKey:UIImagePickerControllerEditedImage];
        
    } else {
        
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    if(self.photoBlock)
    {
        self.photoBlock(image);
    }
}
/*
 #pragma mark - UINavigationControllerDelegate
 - (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
 if ([navigationController isKindOfClass:[UIImagePickerController class]] &&
 ((UIImagePickerController *)navigationController).sourceType ==     UIImagePickerControllerSourceTypePhotoLibrary) {
 [[UIApplication sharedApplication] setStatusBarHidden:NO];
 
 [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
 }
 }
 */
@end

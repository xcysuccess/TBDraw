//
//  UIButton+TBNavBackButton.m
//  TBDraw
//
//  Created by XiangChenyu on 14-8-29.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "UIButton+TBNavBackButton.h"
#import "TBTabBarController.h"
#import "ECSlidingViewController.h"

@implementation UIButton (TBNavBackButton)

+(UIButton*)dgbBackButton{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"icon_back_white"] forState:UIControlStateNormal];
    [backBtn setTitle:NSLocalizedString(@"返回", @"") forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [backBtn addTarget:backBtn action:@selector(popViewController:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 60, 30);
    return backBtn;
}

-(void)popViewController:(id)sender{
     id rootVC = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    

    if ([rootVC isKindOfClass:[ECSlidingViewController class]]) {
        rootVC = ((ECSlidingViewController*)rootVC).topViewController;
    }

    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBar = (UITabBarController*)rootVC;
        UIViewController *vc = tabBar.viewControllers[tabBar.selectedIndex];
        
        
        if ([vc isKindOfClass:[UINavigationController class]]) {
            [(UINavigationController*)vc popViewControllerAnimated:YES];
        }

    }
}

@end

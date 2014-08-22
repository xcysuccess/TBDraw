//
//  AppDelegate.h
//  TBDraw
//
//  Created by xiangchenyu on 14-8-22.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    TBTabBarController* tabBarViewController;
}
@property (strong, nonatomic) UIWindow *window;

@end

//
//  UIBarButtonItem+TBBarButtonItem.m
//  TBDraw
//
//  Created by XiangChenyu on 14-8-29.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "UIBarButtonItem+TBBarButtonItem.h"
#import "UIButton+TBNavBackButton.h"

//http://beyondvincent.com/blog/2013/11/03/120-customize-navigation-status-bar-ios-7/
@implementation UINavigationItem (TBBarButtonItem)

-(void) dgbBackButtonItemStyle
{
    UIButton *backButton = [UIButton dgbBackButton];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.leftBarButtonItem = barItem;
}
@end

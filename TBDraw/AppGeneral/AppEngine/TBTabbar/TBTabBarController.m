//
//  TabBarController.m
//  TBDraw
//
//  Created by xiangchenyu on 14-8-22.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "TBTabBarController.h"
#import "HomeViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "AppDelegate.h"

@interface TBTabBarController ()

@end

@implementation TBTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (id)init
{
    self = [super init];
    if (self) {
        [self initViews];
    }
    return self;
}

-(void) navigationBarCustomStyle
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]]; //mRGBColor(0x06,0x7A,0xB5)
    //    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg.png"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
}

- (void) initViews
{
    [self navigationBarCustomStyle];
    
    HomeViewController   * first  = [[HomeViewController alloc]   init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:first];    
    
    SecondViewController * second = [[SecondViewController alloc] init];
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:second];
    
    ThirdViewController  * third  = [[ThirdViewController alloc]  init];
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:third];
    
    FourthViewController * fourth = [[FourthViewController alloc] init];
    UINavigationController *fourthNav = [[UINavigationController alloc] initWithRootViewController:fourth];
    
    self.viewControllers = [NSArray arrayWithObjects:firstNav, secondNav, thirdNav, fourthNav, nil];
    
    
    //-------UIImage--------
    UIImage *homeImage = [UIImage imageNamed:@"home.png"];
    UIImage *homeImageSel = [UIImage imageNamed:@"home_selected.png"];
    homeImage = [homeImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeImageSel = [homeImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *mapImage = [UIImage imageNamed:@"maps.png"];
    UIImage *mapImageSel = [UIImage imageNamed:@"maps_selected.png"];
    mapImage = [mapImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mapImageSel = [mapImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *myImage = [UIImage imageNamed:@"tab_icon_my"];
    UIImage *myImageSel = [UIImage imageNamed:@"tab_icon_my_selected"];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myImageSel = [myImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *sendImage = [UIImage imageNamed:@"setting_icon"];
    UIImage *sendImageSel = [UIImage imageNamed:@"settings_selected"];
    sendImage = [sendImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    sendImageSel = [sendImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //-------End--------
    
    first.title  = @"首页";
    second.title = @"第二页";
    third.title  = @"第三页";
    fourth.title = @"第四页";
    
    firstNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home"
                                                        image:homeImage
                                                selectedImage:homeImageSel];
    
    secondNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Second"
                                                         image:mapImage
                                                 selectedImage:mapImageSel];
    
    thirdNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"third"
                                                        image:myImage
                                                selectedImage:myImageSel];
    
    fourthNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"fourth"
                                                         image:sendImage
                                                 selectedImage:sendImageSel];
    
    
    //---------设置tabbar的外观属性------------
    UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar_selected.png"]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor whiteColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    
    UIColor *titleHighlightedColor = [UIColor colorWithRed:153/255.0 green:192/255.0 blue:48/255.0 alpha:1.0];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateHighlighted];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  TBECSlidingViewController.m
//  TBDraw
//
//  Created by XiangChenyu on 14-8-28.
//  Copyright (c) 2014年 com.alibaba-inc. All rights reserved.
//

#import "TBECSlidingViewController.h"

@interface TBECSlidingViewController ()

@end

@implementation TBECSlidingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initViews];
    // Do any additional setup after loading the view.
}

-(void) initViews
{
    //configure anchored layout
    self.anchorRightPeekAmount  = 100.0;
    self.anchorLeftRevealAmount = 250.0;
    
    self.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGesturePanning;
    //self.slidingViewController.customAnchoredGestures = @[];
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
